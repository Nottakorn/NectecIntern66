#!/usr/bin/env python3

import rospy
import smach
import smach_ros
from nectec.msg import *
from math import pow,sqrt,atan2,pi
from geometry_msgs.msg import Point,Pose,Quaternion,Twist
from nav_msgs.msg import Odometry

#Humanpose = rospy.Subscriber('',Point,)
class Jim() :
    def __init__(self):
        rospy.init_node('Rotation_control',anonymous = True)
        rospy.Subscriber('/Hand/nectec',Handdection,self.callback)
        self.rotation_control = rospy.Publisher('/cmd_vel',Twist,queue_size=10)
        self.pubRotation = rospy.Publisher('RotationHand',Rotatecom,queue_size=10)
        self.max_rotation = 0.5
        self.mid_rotation = 0.125
        self.min_rotation = 0.1
        self.H = Handdection()
        self.rotation = Twist()
        self.Rotation()
    def callback(self,data):
        self.H = data
    def Rotation(self):
        while(True):
            if (self.H.cx <157) and (self.H.cx > 0):
                self.rotation.angular.z = self.max_rotation
            elif (self.H.cx <253) and (self.H.cx > 157):
                self.rotation.angular.z = self.mid_rotation
            elif (self.H.cx <350) and (self.H.cx > 253):
                self.rotation.angular.z = self.min_rotation
            elif (self.H.cx <447) and (self.H.cx > 350):
                self.rotation.angular.z = -(self.min_rotation)
            elif (self.H.cx <543) and (self.H.cx > 447):
                self.rotation.angular.z = -(self.mid_rotation)
            elif (self.H.cx <700) and (self.H.cx > 543):
                self.rotation.angular.z = -(self.max_rotation)
            else:
                self.rotation.angular.z = 0

            self.rotation_control.publish(self.rotation)


#def posecallback(odom):

if __name__ == '__main__':
    try:
        Jim()
    except rospy.ROSInterruptException:
        pass
