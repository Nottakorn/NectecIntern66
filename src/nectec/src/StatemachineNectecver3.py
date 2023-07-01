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

#=================================== smach ====================================================================#
class SelectMode(smach.State):
    def __init__(self, outcomes=['Hand', 'Sound','Mixed','success']):
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
            elif(self.voice == 'รวม'):
                return 'Mixed'
            if (self.voice == "หยุด การ ทำ งาน"):
                return 'success'
#======================================================Hand Only =================================================#

class Handmode(smach.State):
    def __init__(self, outcomes=['success']):
        super().__init__(outcomes)
        rospy.Subscriber('/Hand/nectec',Handdection,self.callback_Hand)
        self.Handdec = Handdection() 
    def callback_Hand(self,data):
        self.Handdec = data

    def moveDH(self,speed, distance, Is_forward):
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
            if self.Handdec.symbol == "Stop" or self.Handdec.symbol == "reset":
                stop()
                break
        vel_msg.linear.x = 0
        Velocity_publisher.publish(vel_msg)


    def execute(self, ud):
        rospy.loginfo("Executing state HandMode")
        while True:
            if self.Handdec.symbol == "11" :
                self.moveDH(0.1,1,True)
            elif self.Handdec.symbol == "12":
                self.moveDH(0.1,2,True)
            elif self.Handdec.symbol == "13" :
                self.moveDH(0.1,3,True)
            elif self.Handdec.symbol == "14":
                self.moveDH(0.1,4,True)
            elif self.Handdec.symbol == "15" :
                self.moveDH(0.1,5,True)
            elif self.Handdec.symbol == "21":
                self.moveDH(0.2,1,True)
            elif self.Handdec.symbol == "22":
                self.moveDH(0.2,2,True)
            elif self.Handdec.symbol == "23" :
                self.moveDH(0.2,3,True)
            elif self.Handdec.symbol == "24":
                self.moveDH(0.2,4,True)
            elif self.Handdec.symbol == "25" :
                self.moveDH(0.2,5,True)
            elif self.Handdec.symbol == "31":
                self.moveDH(0.3,1,True)
            elif self.Handdec.symbol == "32":
                self.moveDH(0.3,2,True)
            elif self.Handdec.symbol == "33" :
                self.moveDH(0.3,3,True)
            elif self.Handdec.symbol == "34":
                self.moveDH(0.3,4,True)
            elif self.Handdec.symbol == "35" :
                self.moveDH(0.3,5,True)
            elif self.Handdec.symbol == "41":
                self.moveDH(0.4,1,True)
            elif self.Handdec.symbol == "42":
                self.moveDH(0.4,2,True)
            elif self.Handdec.symbol == "43":
                self.moveDH(0.4,3,True)
            elif self.Handdec.symbol == "44":
                self.moveDH(0.4,4,True)
            elif self.Handdec.symbol == "45":
                self.moveDH(0.4,5,True)
            elif self.Handdec.symbol == "51":
                self.moveDH(0.5,1,True)
            elif self.Handdec.symbol == "52":
                self.moveDH(0.5,2,True)
            elif self.Handdec.symbol == "53":
                self.moveDH(0.5,3,True)
            elif self.Handdec.symbol == "54":
                self.moveDH(0.5,4,True)
            elif self.Handdec.symbol == "reset":
                return 'success'

#====================================================Sound Only ============================================#

class Soundmode(smach.State):
    def __init__(self, outcomes=['success']):
        super().__init__(outcomes)
        rospy.Subscriber('microphone',TextWithMic,self.callback)
        self.voice = TextWithMic()
    
    def callback(self,data):
        self.voice = data.mic
    
    def moveD(self,speed, distance, Is_forward):
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
            if self.voice == "หยุด":
                stop()
                break
        vel_msg.linear.x = 0
        Velocity_publisher.publish(vel_msg)  
    def moveO(self,speed, Is_forward):
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
            if self.voice == "เพิ่ม ความ เร็ว":
                vel_msg.linear.x += 1
            elif self.voice == "ลด ความ เร็ว":
                vel_msg.linear.x -= 1
            if vel_msg.linear.x == 0:
                rospy.loginfo("reached")
                break
            if self.voice == "เลี้ยว ซ้าย":
                self.rotateD(10,vel_msg.linear.x,90,False)
            elif self.voice == "เลี้ยว ขวา":
                self.rotateD(10,vel_msg.linear.x,90,True)
            if self.voice == "หยุด":
                stop()
                rospy.loginfo("reached")
                break
        vel_msg.linear.x = 0
        Velocity_publisher.publish(vel_msg)

    def rotateD(self,speed,x,angle,clockwise):
        Velocity_publisher = rospy.Publisher('cmd_vel',Twist,queue_size = 10)
        vel_msg = Twist()
        global theta
        vel_msg = Twist()
        vel_msg.linear.x = x
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
            if (self.voice == "หยุด"):
                stop()
                vel_msg.linear.x = 0
                break

        vel_msg.angular.z = 0
        Velocity_publisher.publish(vel_msg)

    def execute(self, ud):
        rospy.loginfo("Executing state Soundmode")
        d = 0.2
        condition = False
        while True:
            if (self.voice == "เดิน" ) :
                print("gg")
                self.moveO(d,True)
            elif (self.voice == "เลี้ยว ขวา"):
                self.rotateD(5,0,90,True)
            elif (self.voice == "เลี้ยว ซ้าย"):
                self.rotateD(5,0,90,False)
            if (self.voice == "เลิก ใช้ เสียง"):
                return 'success'
            if self.voice == "หยุด":
                stop()
            if self.voice == "กลับ":
                return 'GoGo'

#===========================================================Mixed ===========================================#

class Mixedmode(smach.State):
    def __init__(self, outcomes=['success']):
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

    def moveD(self,speed, distance, Is_forward):
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
            if self.voice == "หยุด":
                stop()
                break
        vel_msg.linear.x = 0
        Velocity_publisher.publish(vel_msg)  

    def moveO(self,speed, Is_forward):
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
            if self.voice == "เพิ่ม ความ เร็ว":
                vel_msg.linear.x += 1
            elif self.voice == "ลด ความ เร็ว":
                vel_msg.linear.x -= 1
            if vel_msg.linear.x == 0:
                rospy.loginfo("reached")
                break
            if self.voice == "เลี้ยว ซ้าย":
                self.rotateD(10,vel_msg.linear.x,90,False)
            elif self.voice == "เลี้ยว ขวา":
                self.rotateD(10,vel_msg.linear.x,90,True)
            elif self.Handdec.symbol == "Nubber two":
                self.rotateD(10,vel_msg.linear.x,90,False)
            elif self.Handdec.symbol == "Numbber three":
                self.rotateD(10,vel_msg.linear.x,90,True)
            if self.voice == "หยุด":
                stop()
                rospy.loginfo("reached")
                break
        vel_msg.linear.x = 0
        Velocity_publisher.publish(vel_msg)

    def rotateD(self,speed,x,angle,clockwise):
        Velocity_publisher = rospy.Publisher('cmd_vel',Twist,queue_size = 10)
        vel_msg = Twist()
        global theta
        vel_msg = Twist()
        vel_msg.linear.x = x
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
            if (self.voice == "หยุด"):
                stop()
                vel_msg.linear.x = 0
                break
            elif (self.Handdec.symbol == "Stop"):
                stop()
                vel_msg.linear.x = 0
                break
        vel_msg.angular.z = 0
        Velocity_publisher.publish(vel_msg)

    def execute(self, ud):
        rospy.loginfo("Executing state Mixed")  
        while True:
            if self.Handdec.symbol == "Nubber one":
                self.moveO(0.2,True)
            elif self.Handdec.symbol == "Nubber two":
                self.rotateD(8,0,90,False)
            elif self.Handdec.symbol == "Nubber three":
                self.rotateD(8,0,90,True)
            elif self.voice == "เดิน":
                self.moveO(0.2,True) 
            elif self.voice == "ถอย":
                self.moveO(-0.2,True)
            elif (self.Handdec.symbol == "reset") or (self.voice == "ออก จาก โหมด นี้"):
                return "success"            
#========================================= go to base ===========================================================#
class GoToPosition(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['finished'])
        self.position = {'x':1.31 , 'y':0.78}
        self.quaternion = {'r1' : 0.000, 'r2' : 0.000, 'r3' :-0.183 , 'r4' : 0.983}

    def execute(self,userdata):
        rospy.loginfo('start go to location')
        self.navigator = GoToPose()
        self.success = self.navigator.goto(self.position,self.quaternion)
        rospy.loginfo("Go to ($s,%s) position",self.position['x'],self.position['y'])
        if self.success:
            rospy.loginfo('reach loaction')
            return 'finished'
        
 #====================================================== Go ===============================================#     

class GoToPose:
    def __init__(self):
        self.goal_sent = False
        rospy.on_shutdown(self.shutdown)
        self.move_base = actionlib.SimpleActionClient("move_base",MoveBaseAction)
        rospy.loginfo("wait for the action sever to come up")

        #ALLOW up to 5 seconds for the action server to come up
        self.move_base.wait_for_server(rospy.Duration(5))
    
    def goto(self, pos ,quat):
        self.goal_sent = True
        goal = MoveBaseGoal()
        goal.target_pose.header.frame_id = 'map'
        goal.target_pose.header.stamp = rospy.Time.now()
        goal.target_pose.pose = Pose(Point(pos['x'],pos['y'],0.000),
                                     Quaternion(quat['r1'],quat['r2'],quat['r3'],quat['r4']))

        #star moving
        self.move_base.send_goal(goal)
        success = self.move_base.wait_for_result(rospy.Duration(60))
        state = self.move_base.get_state()
        result = False

        if success and state == GoalStatus.SUCCEEDED:
            result = True
        else:
            self.move_base.cancel_goal()

        self.goal_sent = False
        return result
    
    def shutdown(self):
        #if self.goal_sent:
            #self.move_base.cancel_goal()
        rospy.loginfo("stop")
        rospy.sleep(1)

#=========================================================== main =============================================#

class RobotState(object):
    def __init__(self) -> None:
        rospy.init_node('robot_state', anonymous=True)
        sm = smach.StateMachine(outcomes=['---finish---'])

        with sm:
            smach.StateMachine.add('Selectmode', SelectMode(), 
                               transitions={'Hand':'Handcommand', 'Sound':'Soundcommand','Mixed':'Mixedcommand','success':'---finish---'})

            smach.StateMachine.add('Mixedcommand', Mixedmode(), 
                               transitions={'success':'Selectmode'})

            smach.StateMachine.add('Handcommand', Handmode(), 
                               transitions={'success':'Selectmode'})
            
            smach.StateMachine.add('Soundcommand', Soundmode(), 
                               transitions={'success':'Selectmode', 'GoGo':'Gotobase'})
            smach.StateMachine.add('Gotobase', Soundmode(), 
                               transitions={'finished':'Soundcommand'})            
               
                             
        outcome = sm.execute()


if __name__ == "__main__":
    try :
        pose_subscriber = rospy.Subscriber('/odom',Odometry,posecallback)
        RobotState()
    except rospy.ROSInterruptException:
        rospy.is_shutdown()