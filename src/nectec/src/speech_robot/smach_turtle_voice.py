#!/usr/bin/env python3

import rospy
import smach
import smach_ros
from math import pow,sqrt,atan2,pi,radians
from std_msgs.msg import String
from geometry_msgs.msg import Twist
from turtlesim.msg import Pose
import time
#====================tooic node ======================================
x=0
y=0
theta=0

def posecallback(pose_message):
    global x
    global y,theta
    x = pose_message.x
    y = pose_message.y
    theta = pose_message.theta

#===================== stop  ========================================

def stop():
    Velocity_publisher = rospy.Publisher('/turtle1/cmd_vel',Twist,queue_size =10)
    vel_msg = Twist()
    #linear
    vel_msg.linear.x = 0
    #angular
    vel_msg.angular.z = 0
    Velocity_publisher.publish(vel_msg)


#====================== move ========================================

def move(speed, distance, Is_forward):
    Velocity_publisher = rospy.Publisher('/turtle1/cmd_vel',Twist,queue_size =10)
    vel_msg = Twist()
    global x,y
    x0 = x
    y0 = y
    if(Is_forward):
        vel_msg.linear.x = abs(speed)
    else:
        vel_msg.linear.x = -abs(speed)
    vel_msg.linear.y = 0
    vel_msg.linear.z = 0
    vel_msg.angular.x = 0
    vel_msg.angular.y = 0
    vel_msg.angular.z = 0
    distance_moved = 0
    loop_rate = rospy.Rate(10)


    while True:
        rospy.loginfo("moves forwards")
        Velocity_publisher.publish(vel_msg)
        loop_rate.sleep()

        distance_moved = distance_moved + abs(0.5*sqrt(pow(x-x0,2)+pow(y-y0,2)))
        print(distance_moved)
        if not (distance_moved<distance):
            rospy.loginfo("reached")
            break

    vel_msg.linear.x = 0
    Velocity_publisher.publish(vel_msg)
#=======================  rotation  ==================================

def rotate(speed,angle,clockwise):
    Velocity_publisher = rospy.Publisher('/turtle1/cmd_vel',Twist,queue_size = 10)
    vel_msg = Twist()
    global theta
    vel_msg = Twist()
    vel_msg.linear.x = 0
    vel_msg.linear.y = 0
    vel_msg.linear.z = 0 
    vel_msg.angular.x = 0
    vel_msg.angular.y = 0
    vel_msg.angular.z = 0

    theta0 = theta
    angular_speed = radians(abs(speed))
    if (clockwise):
        vel_msg.angular.z = -abs(angular_speed)
    else:
        vel_msg.angular.z = abs(angular_speed)

    angle_moved = 0
    loop_rate = rospy.Rate(10)

    t0 = rospy.Time.now().to_sec()

    while True:
        rospy.loginfo("Rotating")
        Velocity_publisher.publish(vel_msg)
    
        t1 = rospy.Time.now().to_sec()
        current_angle_degree = (t1-t0)*speed
        loop_rate.sleep()

        if (current_angle_degree>angle):
            rospy.loginfo("finished rotate")
            break

    vel_msg.angular.z = 0
    Velocity_publisher.publish(vel_msg)





#=======================  smach  =====================================

class sleep(smach.State):
    def __init__(self):
        stop()
        smach.State.__init__(self, outcomes=['forward','backward','hear_turn_left','hear_turn_right'])
        rospy.Subscriber("/Speech2text",String,self.Voicecallback)
        self.voice_detector = ""
        #self.hand_detect = hand_topic

    def Voicecallback(self, data):
        self.voice_detector = data.data
    
    def execute(self, userdata):
        rospy.loginfo('Executing state sleep')
        while not rospy.is_shutdown():
            if self.voice_detector == "เดิน":
                return 'forward'
            elif self.voice_detector == "ถอย":
                return 'backward'
            elif self.voice_detector == "เลี้ยว ซ้าย":
                return 'hear_turn_left'
            elif self.voice_detector == "เลี้ยว ขวา":
                return 'hear_turn_right'
            else:
                pass
        
class move_forward(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['finished_move_forward'])
        rospy.Subscriber("/Speech2text",String,self.callback)
        self.voice_detector = String()
    def callback(self, data):
        self.voice_detector = data.data

    def execute(self, userdata):
        rospy.loginfo('Executing state move forward')
        while not rospy.is_shutdown():
            move(1,2,True)
            if self.voice_detector == 'หยุด':
                return 'finished_move_forward'
            else:
                pass

class move_backward(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['finished_move_backward'])
        rospy.Subscriber("/Speech2text",String,self.callback)
        self.voice_detector = String()
    def callback(self, data):
        self.voice_detector = data.data

    def execute(self, userdata):
        rospy.loginfo('Executing state move backward')
        while not rospy.is_shutdown():
            move(1,2,False)
            if self.voice_detector == 'หยุด':
                return 'finished_move_backward'
            else:
                pass


class turn_left(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['finished_turn_left'])
        rospy.Subscriber("/Speech2text",String,self.callback)
        self.voice_detector = String()
    def callback(self, data):
        self.voice_detector = data.data

    def execute(self, userdata):
        rospy.loginfo('Executing state turn left')
        while not rospy.is_shutdown():
            rotate(4,1,False)
            if self.voice_detector == 'หยุด':
                return 'finished_turn_left'
            else:
                pass

class turn_right(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['finished_turn_right'])
        rospy.Subscriber("/Speech2text",String,self.callback)
        self.hand_detector = ""
    def callback(self, data):
        self.voice_detector = data.data

    def execute(self, userdata):
        rospy.loginfo('Executing state sleep')
        while not rospy.is_shutdown():
            rotate(4,1,True)
            if self.voice_detector == 'หยุด':
                return 'finished_turn_right'
            else:
                pass

def main():
    rospy.init_node('Voice_control')

    sm = smach.StateMachine(outcomes=['---finish---'])
    with sm:
        smach.StateMachine.add('sleep',sleep(),transitions={'forward':'move_forward','backward':'move_backward','hear_turn_left':'turn_left','hear_turn_right':'turn_right'})
        smach.StateMachine.add('move_forward',move_forward(),transitions={'finished_move_forward':'sleep'})
        smach.StateMachine.add('move_backward',move_backward(),transitions={'finished_move_backward':'sleep'})
        smach.StateMachine.add('turn_left',turn_left(),transitions={'finished_turn_left':'sleep'})
        smach.StateMachine.add('turn_right',turn_right(),transitions={'finished_turn_right':'sleep'})
    outcome = sm.execute()

if __name__ == '__main__':  
    pose_subscriber = rospy.Subscriber('/turtle1/pose',Pose,posecallback)
    time.sleep(2)
    main()
