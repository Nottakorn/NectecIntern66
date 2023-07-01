#!/usr/bin/env python3
from nectec.srv import *
import rospy
def user_sum():
    rospy.wait_for_service('/nectec/vision/waving_dectectype2Hands')
    try:
        Handdectec = rospy.ServiceProxy('/nectec/vision/waving_dectectype2Hands', DectectionRL)
        a = Handdectec(10000)
    except rospy.ServiceException as e:
        print("Service call failed: %s"%e)

if __name__ == "__main__":
    user_sum()