#!/usr/bin/env python3
import cv2
import rospy
import math
from cvzone.HandTrackingModule import HandDetector
from std_msgs.msg import String
from nectec.srv import DectectionRL, DectectionRLResponse
import time
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
#webcam


wa = 0
valueList = []


#Hand detector
detector = HandDetector(detectionCon=0.8, maxHands= 2) #sure 80 = detect
#loop part
class Handdetectype(object):
    def __init__(self)->None:
        rospy.init_node('hand_detectype', anonymous= True )
        self.img_sub = rospy.Subscriber("/usb_cam/image_raw", Image, callback = self.image_callback)
        self.s = rospy.Service('/nectec/vision/waving_dectectype2Hands', DectectionRL, self.HanddetecRL)
        self.bridge = CvBridge()
        self.pub = rospy.Publisher('/nectec/vision/waving_detectype2Hands', Image , queue_size = 1)
        self.rate = rospy.Rate(10)
        self.CodeName = 'None'
        self.fingers2 = []
        
        print("Ready to detect waving")
        rospy.spin()
        rospy.loginfo("Waiting ")

    def image_callback(self,data):
        self.img = self.bridge.imgmsg_to_cv2(data, desired_encoding="bgr8")
        
        # rospy.spin()

    def HanddetecRL(self,req):
        a = DectectionRLResponse()
        print(req.timeout)
        end = time.time() + req.timeout
        print("1")
        rate = rospy.Rate(10)

        while time.time() < end:
            
            self.CodeName = 'No Action'
            self.image = self.img
            hands,_ = detector.findHands(self.image)  
            lmList = []
                
            if hands: #return back khar tee dai
                lmList1 = hands[0]["lmList"]  # List of 21 Landmark points
                bbox1 = hands[0]["bbox"]  # Bounding box info x,y,w,h
                centerPoint1 = hands[0]['center']
                fingers1 = detector.fingersUp(hands[0])
                handType1 = hands[0]["type"]
                print(fingers1)
                if len(hands) == 2:
                    # Hand 2
                    lmList2 = hands[1]["lmList"]  # List of 21 Landmark points
                    bbox2 = hands[1]["bbox"]  # Bounding box info x,y,w,h
                    centerPoint2 = hands[1]['center']  # center of the hand cx,cy
                    handType2 = hands[1]["type"]  # Hand Type "Left" or "Right"

                    self.fingers2 = detector.fingersUp(hands[1])
                    #print(handType1,handType2)
                    cydif = -1*(centerPoint1[1] - centerPoint2[1] )
                    print(cydif)
                    '''
                    if cydif >= 200 & centerPoint2[1] != 0:
                        
                        if cydif >= 100:
                            print(handType1)
                    elif cydif >= -200:
                        
                        if cydif >= -100:
                            print(handType2)
                    '''
                if fingers1 == [0,1,0,0,0] :
                    self.CodeName = 'Nubber one'
                    a.symbol = self.CodeName
                    return a
                elif fingers1 == [0,1,1,0,0] :
                    self.CodeName = 'Nubber two'
                    a.symbol = self.CodeName
                    return a
                elif fingers1 == [0,1,1,1,0] :
                    self.CodeName = 'Nubber three'
                    a.symbol = self.CodeName
                    return a
                elif fingers1 == [0,1,1,1,1] :
                    self.CodeName = 'Nubber Four'
                    a.symbol = self.CodeName
                    return a
                elif fingers1 == [1,1,1,1,1] :
                    self.CodeName = 'Stop'
                    a.success = True
                    a.symbol = self.CodeName
                    return a
                elif fingers1 == [1,0,0,0,1] :
                    self.CodeName = 'Carabourd'
                    a.symbol = self.CodeName
                    return a
                elif fingers1 == [1,1,0,0,1] :
                    self.CodeName = 'Love u Tangkwa'
                    a.symbol = self.CodeName
                    return a
                elif fingers1 == [0,0,1,0,0] :
                    self.CodeName = 'Middle Finger'
                    a.symbol = self.CodeName
                    return a
            cv2.putText(self.image, self.CodeName, (30,30), cv2.FONT_HERSHEY_PLAIN,2, (0, 0, 0), 2)
            cv_image=self.image
            ros_image = self.bridge.cv2_to_imgmsg(cv_image, encoding='bgr8')
            self.pub.publish(ros_image)
            
                    
   

if __name__ == "__main__":
    # pub = rospy.Publisher('/basil/vision/waving_detection_image', Image , queue_size = 1)
    # rate = rospy.Rate(10)
    Handdetectype()
    
    #hand_wavepublisher()
