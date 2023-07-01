#!/usr/bin/env python3
import cv2
import rospy
import math
from cvzone.HandTrackingModule import HandDetector
from std_msgs.msg import String
from nectec.srv import DectectionRL, DectectionRLResponse
from nectec.msg import Handdection
import time
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
#webcam


wa = 0
valueList = []


#Hand detector
detector = HandDetector(detectionCon=0.5, maxHands= 1) #sure 80 = detect
#loop part
class Handdetectype(object):
    def __init__(self)->None:
        rospy.init_node('hand_detectype', anonymous= True )
        self.img_sub = rospy.Subscriber("/usb_cam/image_raw", Image, callback = self.image_callback)
        self.s = rospy.Service('/nectec/vision/waving_dectectype2Hands', DectectionRL, self.HanddetecRL)
        self.bridge = CvBridge()
        self.pub = rospy.Publisher('/nectec/vision/waving_detectype2Hands', Image , queue_size = 1)
        self.pubHand = rospy.Publisher('/Hand/nectec' , Handdection , queue_size= 10)
        self.rate = rospy.Rate(10)
        self.CodeName = 'Noaction'
        self.fingers2 = []
        self.fingers1 = []
        self.handType1 = ""
        self.handType2 = ""
        self.handType = ""
        
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

        while True:#while time.time() < end:
            
            self.CodeName = 'No Action'
            self.image = self.img
            hands,_ = detector.findHands(self.image)  
            lmList = []

            if hands: #return back khar tee dai
                lmList1 = hands[0]["lmList"]  # List of 21 Landmark points
                bbox1 = hands[0]["bbox"]  # Bounding box info x,y,w,h
                centerPoint1 = hands[0]['center']
                self.fingers1 = detector.fingersUp(hands[0])
                self.handType1 = hands[0]["type"]
                #print(fingers1)
                
                if len(hands) == 2:
                    # Hand 2
                    lmList2 = hands[1]["lmList"]  # List of 21 Landmark points
                    bbox2 = hands[1]["bbox"]  # Bounding box info x,y,w,h
                    centerPoint2 = hands[1]['center']  # center of the hand cx,cy
                    self.handType2 = hands[1]["type"]  # Hand Type "Left" or "Right"

                    self.fingers2 = detector.fingersUp(hands[1])
                    '''
                    #print(lmList1[12])
                    #print(lmList2[12])
                    x11,y11,z11 = lmList1[0]
                    x12,y12,z12 = lmList1[5]
                    x13,y13,z13 = lmList1[17]
                    x21,y21,z21 = lmList2[0]
                    x22,y22,z22 = lmList2[5]
                    x23,y23,z23 = lmList2[17]
                    x1c = int((x11+x12+x13)/3)
                    y1c = int((y11+y12+y13)/3)
                    z1c = int((z11+z12+z13)/3)
                    x2c = int((x21+x22+x23)/3)
                    y2c = int((y21+y22+y23)/3)
                    z2c = int((z21+z22+z23)/3)
                    distance = math.sqrt(math.pow(int(x1c-x2c),2)+math.pow(int(z1c-z2c),2)+math.pow(int(y1c-y2c),2))
                    print(distance)
                    
                    if (distance == 350 )&(y1c<y2c):
                        self.handType = self.handType1
                        print(self.handType)
                    else :
                        self.handType = self.handType2 
                        print(self.handType)
                    '''
                    
                if  (self.fingers1 == [0,1,0,0,0]) or  (self.fingers2 == [0,1,0,0,0] ) :
                    self.CodeName = 'Nubber one'
                    
                elif (self.fingers1 == [0,1,1,0,0]) or ( self.fingers1 == [0,1,1,0,0] ) :
                    self.CodeName = 'Nubber two'


                elif ( self.fingers1 == [0,1,1,1,0] ) or ( self.fingers2 == [0,1,1,1,0] ):
                    self.CodeName = 'Nubber three'


                elif ( self.fingers1 == [0,1,1,1,1] ) or ( self.fingers2 == [0,1,1,1,1] ):
                    self.CodeName = 'Nubber Four'


                elif ( self.fingers1 == [1,1,1,1,1] ) or ( self.fingers1 == [1,1,1,1,1] ):
                    self.CodeName = 'Stop'

                elif self.fingers1 == [1,0,0,0,1] :
                    self.CodeName = 'Carabourd'

                        
                elif self.fingers1 == [1,1,0,0,1] :
                    self.CodeName = 'Love u Tangkwa'

                elif self.fingers1 == [0,0,1,0,0] :
                    self.CodeName = 'Middle Finger'
                pub_data = Handdection(type = self.handType,symbol=self.CodeName,success=True)
                #print(pub_data)
                self.pubHand.publish(pub_data)
            elif len(hands) == 0:
                self.CodeName = 'Noaction'
                self.fingers2 = []
                self.fingers1 = []
                self.handType1 = ""
                self.handType2 = ""
                self.handType = ""
                
                

            cv2.putText(self.image, self.CodeName, (30,30), cv2.FONT_HERSHEY_PLAIN,2, (0, 0, 0), 2)
            cv_image=self.image
            ros_image = self.bridge.cv2_to_imgmsg(cv_image, encoding='bgr8')
            self.pub.publish(ros_image)
            
                    
   

if __name__ == "__main__":
    # pub = rospy.Publisher('/basil/vision/waving_detection_image', Image , queue_size = 1)
    # rate = rospy.Rate(10)
    Handdetectype()
    
    #hand_wavepublisher()

