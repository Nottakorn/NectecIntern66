#!/usr/bin/env python3
import rospy
from nectec.msg import TextWithMic
def callback(Text):
    rospy.loginfo(rospy.get_caller_id() + "I heard %s", Text.mic)
def listener():
    rospy.init_node('listener', anonymous=True)
    rospy.Subscriber("Testext", TextWithMic, callback)
    rospy.spin()

if __name__ == '__main__':
    listener()