# **Intership Project**
By Nottakorn Sukmanont from Kasetsart University 
* Objectives:
  1. Voice-controlled robotics: Controlling robots through voice commands.
  2. Gesture-controlled robotics: Controlling robots through gestures.

Detail : linirobot with jetson-nano and csi-camera

follow me step by step
## launch you robot
```
roslaunch linorobot bringup.launch
```
When you run roslaunch linorobot bringup.launch, you are essentially instructing ROS to execute the configurations and nodes specified in the "bringup.launch" file within the "linorobot" package. This is a common practice in ROS to streamline the startup process of a robot system, initializing the necessary components for the robot to operate as intended.

* roslaunch: It is a command-line tool for launching ROS launch files. Launch files in ROS are XML files that describe the configuration of nodes and their parameters.
* linorobot: It refers to a specific ROS package named "linorobot." A ROS package is a way to organize software in ROS.
* bringup.launch: This is a launch file within the "linorobot" package. The launch file is responsible for starting and configuring nodes and other settings required to bring up the robot or a specific part of it.

## launch CSI-camera
```
roslaunch realsense2_camera rs_camera.launch
```

## Hand-Detection
In ths section . I will use opencv-zone for detection hand you can read opencv-zone in github.If you want to run Hand-detection Program you can follow this command
```
rosrun nectec DetecHand1.1.py
```
* detail of DectecHand code
1. set you Detection parameter
```py
detector = HandDetector(detectionCon=0.5, maxHands= 1) #sure 80 = detect
```
  2. subscrib image from csi camera and setup another tools example service , publish data to statemachine
```py
        rospy.init_node('hand_detectype', anonymous= True )
        self.img_sub = rospy.Subscriber("/usb_cam/image_raw", Image, callback = self.image_callback)
        self.s = rospy.Service('/nectec/vision/waving_dectectype2Hands', DectectionRL, self.HanddetecRL)
        self.bridge = CvBridge()
        self.pub = rospy.Publisher('/nectec/vision/waving_detectype2Hands', Image , queue_size = 1)
        self.pubHand = rospy.Publisher('/Hand/nectec' , Handdection , queue_size= 10)

   def image_callback(self,data):
        self.img = self.bridge.imgmsg_to_cv2(data, desired_encoding="bgr8")
```

  * detail of service
    
    input
          float32 time out : time to want dectection program end process

    output

          string type   : right or left hand

          string symbol : gesture you hand to command you robot

          bool success : if Ture is program have data of detection
```
float32 timeout
---
string type
string symbol
bool success
```
  3. use fingerdetection to make a symbol
```py
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
```
4. publish you data to service
```py
pub_data = Handdection(type = self.handType,symbol=self.CodeName,success=True)
#print(pub_data)
self.pubHand.publish(pub_data)
```
5. for use rpt_image_view you must to change cv to image by CVbridge. follow this code
```py
cv2.putText(self.image, self.CodeName, (30,30), cv2.FONT_HERSHEY_PLAIN,2, (0, 0, 0), 2)
cv_image=self.image
ros_image = self.bridge.cv2_to_imgmsg(cv_image, encoding='bgr8')
self.pub.publish(ros_image)
```
## Run-Program Hand detection
```
rosrun nectec runcam.py
```

detail of runcam.py wait call service in dectectionhand1.1.py and use ServiceProxy to service  DectectionRL. feed input time user want to run handdetection program

```py
rospy.wait_for_service('/nectec/vision/waving_dectectype2Hands')
    try:
        Handdectec = rospy.ServiceProxy('/nectec/vision/waving_dectectype2Hands', DectectionRL)
        a = Handdectec(10000)
    except rospy.ServiceException as e:
        print("Service call failed: %s"%e)
```
## Use rpt

check you result of image. follow this code
```
rqt_image_view
```
## Speech to text
this code in part of speech2text from nectec lab. 
```
python3 SpeechToTextThai-Auto.py
```

for connec speech2text to state machine you must use publish from this file in line 201 and publish data in line 220
```py
with MicrophoneStream(_AUDIO_SAMPLE_RATE, CHUNK) as stream:

                    audio_generator = stream.generator()
                    print("\nStart capture audio...")
                    pub = rospy.Publisher('microphone',TextWithMic,queue_size=10)
                    
                    rate = rospy.Rate(10)
                    responses = stub.LiveTranscribe( audio_generator, metadata=metadata)
                    try:
                        for response in responses:
                            if(response.Status == PartiiService_pb2.StatusCode.Ok):
                                if(response.sentenceType == PartiiService_pb2.ResultType.PARTIAL):
                                    if _VERBOSE != "0" : 
                                        print("sentenceNumber %s " %(response.sentenceNumber))
                                        print("transcript %s " %(response.transcript))
                                        print("confidence %s " %(response.confidence))
                                        print("startTime %s, %s " %(response.startTime, convMilliFormat(response.startTime)))
                                        print("endTime %s, %s " %(response.endTime, convMilliFormat(response.endTime)))
                            
                                elif(response.sentenceType == PartiiService_pb2.ResultType.RESULT):
                                    if _VIEW == "sentent" :
                                        #print("sentenceNumber %s " %(response.sentenceNumber))
                                        print("transcript %s " %(response.transcript))
                                        pub_data = TextWithMic(mic = response.transcript)
                                        print(pub_data.mic)
                                        pub.publish(pub_data)
```

in message file make some string to store output of speech2text
```
string mic
```


## Run State machine

Use smach to make statemachine for you Robot systems
```
rosrun nectec StatemachineNectecver3.py
```
* detail of statemachine
  
  In statemachine has 4 state
```py
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
```

state one : select connad you want by if you
