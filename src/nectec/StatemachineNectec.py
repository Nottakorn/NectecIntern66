#!/usr/bin/env python3

import rospy
import roslaunch
import actionlib
from actionlib_msgs.msg import *
import smach
import smach_ros
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
import time
from std_srvs.srv import *
from nectec.srv import *
from math import pow,sqrt,atan2,pi,radians
from nectec.msg import *
from nav_msgs.msg import Odometry
from geometry_msgs.msg import Point,Pose,Quaternion,Twist

#from turtlesim.msg import Pose

#====================tooic node ======================================
x=0
y=0
theta=0

def posecallback(pose_message):
    global x
    global y,theta
    x = pose_message.pose.pose.position.x
    y = pose_message.pose.pose.position.y
    theta = pose_message.pose.pose.orientation

#===================== stop  ========================================

def stop():
    Velocity_publisher = rospy.Publisher('cmd_vel',Twist,queue_size =10)
    vel_msg = Twist()
    #linear
    vel_msg.linear.x = 0
    #angular
    vel_msg.angular.z = 0
    Velocity_publisher.publish(vel_msg)

#=======================move only====================================
def moveonly(speed,Is_forward):
    Velocity_publisher = rospy.Publisher('cmd_vel',Twist,queue_size =10)
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

   # vel_msg.linear.x = 0
    Velocity_publisher.publish(vel_msg)

#====================== move ========================================

def move(speed, distance, Is_forward):
    Velocity_publisher = rospy.Publisher('cmd_vel',Twist,queue_size =10)
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
    Velocity_publisher = rospy.Publisher('cmd_vel',Twist,queue_size = 10)
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

    vel_msg.angle.z = 0
    Velocity_publisher.publish(vel_msg)

#=================================== smach ====================================================================#
class SelectMode(smach.State):
    def __init__(self, outcomes=['Hand', 'Sound']):
        super().__init__(outcomes)
        rospy.Subscriber('/Hand/nectec',Handdection,self.callback_Hand)
        rospy.Subscriber('microphone',TextWithMic,self.callback)
        self.Handdec = Handdection()
        self.voice = TextWithMic()
    def callback_Hand(self,data):
        self.Handdec = data
        print(self.Handdec)
    def callback(self,data):
        self.voice = data.mic
        print(self.voice)
    def execute(self, ud):
        rospy.loginfo("Executing state Handdectectype")
        while True:
           # print(self.Handdec)
            #print(self.voice)
            if (self.Handdec.success) == True:
                rospy.sleep(3)
                if (self.Handdec.success == True):
                    return 'Hand'
            elif(self.voice == 'เริ่ม'):
                return 'Sound'

class Handmode(smach.State):
    def __init__(self, outcomes=['success']):
        super().__init__(outcomes)
        rospy.Subscriber('/Hand/nectec',Handdection,self.callback_Hand)
        self.Handdec = Handdection() 
    def callback_Hand(self,data):
        self.Handdec = data
    def execute(self, ud):
        rospy.loginfo("Executing state HandMode")
        A = True
        while A:
            if self.Handdec.symbol == "11" :
                move(1,1,True)
                A = False
            elif self.Handdec.symbol == "12":
                move(1,2,True)
                A = False
            elif self.Handdec.symbol == "13" :
                move(1,3,True)
                A = False
            elif self.Handdec.symbol == "14":
                move(1,4,True)
                A = False
            elif self.Handdec.symbol == "15" :
                move(1,5,True)
                A = False
            elif self.Handdec.symbol == "21":
                move(2,1,True)
                A = False
            elif self.Handdec.symbol == "22":
                move(2,2,True)
                A = False
            elif self.Handdec.symbol == "23" :
                move(2,3,True)
                A = False
            elif self.Handdec.symbol == "24":
                move(2,4,True)
                A = False
            elif self.Handdec.symbol == "25" :
                move(2,5,True)
                A = False
            elif self.Handdec.symbol == "31":
                move(3,1,True)
                A = False
            elif self.Handdec.symbol == "32":
                move(3,2,True)
                A = False
            elif self.Handdec.symbol == "33" :
                move(3,3,True)
                A = False
            elif self.Handdec.symbol == "34":
                move(3,4,True)
                A = False
            elif self.Handdec.symbol == "35" :
                move(3,5,True)
                A = False
            elif self.Handdec.symbol == "41":
                move(4,1,True)
                A = False
            elif self.Handdec.symbol == "42":
                move(4,2,True)
                A = False
            elif self.Handdec.symbol == "43":
                move(4,3,True)
                A = False
            elif self.Handdec.symbol == "44":
                move(4,4,True)
                A = False
            elif self.Handdec.symbol == "45":
                move(4,5,True)
                A = False
            elif self.Handdec.symbol == "51":
                move(5,1,True)
                A = False
            elif self.Handdec.symbol == "52":
                move(5,2,True)
                A = False
            elif self.Handdec.symbol == "53":
                move(5,3,True)
                A = False
            elif self.Handdec.symbol == "54":
                move(5,4,True)
                A = False
            elif self.Handdec.symbol == "Stop":
                stop()
                A = False
            elif self.Handdec.symbol == "reset":
                return 'success'
        while A == False:    
            if (self.Handdec.symbol == 'reset') :
                return 'success'
class Soundmode(smach.State):
    def __init__(self, outcomes=['success']):
        super().__init__(outcomes)
        rospy.Subscriber('microphone',TextWithMic,self.callback)
        self.voice = TextWithMic()
    
    def callback(self,data):
        self.voice = data.mic
    
    def execute(self, ud):
        rospy.loginfo("Executing state Soundmode")
        d = 0.2
        condition = False
        while True:
            if (self.voice == "เดิน" ) :
                print("gg")
                move(d,10000,True)
                while condition:
                    if self.voice == "เพิ่ม ความ เร็ว" :
                        x += 0.1
                        moveonly(d,True)
                    elif self.voice == "ลด ความ เร็ว":
                        x -= 0.1
                        moveonly(d,True)
                    if x <= 0 :
                        stop()
                        x = 0.2
                        condition = False
                    if self.voice == "หยุด":
                        condition = False
                        stop()
            elif (self.voice == "เลี้ยว ซ้าย"):
                rotate(3,90,True)
            if (self.voice == "เลิก ใช้ เสียง"):
                return 'success'
            if self.voice == "หยุด":
                stop()

class RobotState(object):
    def __init__(self) -> None:
        rospy.init_node('robot_state', anonymous=True)
        sm = smach.StateMachine(outcomes=['---finish---'])

        with sm:
            smach.StateMachine.add('Selectmode', SelectMode(), 
                               transitions={'Hand':'Handcommand', 'Sound':'Soundcommand'})
           
            smach.StateMachine.add('Handcommand', Handmode(), 
                               transitions={'success':'Selectmode'})
            
            smach.StateMachine.add('Soundcommand', Soundmode(), 
                    transitions={'success':'Selectmode'})
               
                             
        outcome = sm.execute()

if __name__ == "__main__":
    pose_subscriber = rospy.Subscriber('/odom',Odometry,posecallback)
    RobotState()
