#!usr/bin/env python3
import rospy
import smach
import smach_ros
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
import actionlib
from actionlib_msgs.msg import *
from geometry_msgs.msg import Pose, Point, Quaterntion


class GoToPose():
    def __init__(self):
        self.goal_sent = False

        rospy.on_shutdown(self.shutdown)

        self.move_base = actionlib.SimpleActionClient("move_base",MoveBaseAction)
        rospy.loginfo("wait for the action server to come up")
        self.move_base.wait_for_server(rospy.Duration(5))
    def goto(self,pod,quat):
        #send a goal
        self.goal_sent = True
        goal = MoveBaseGoal()
        goal.target_pose.header.frame_id = 'map'
        goal.target_pose.header.stamp = rospy.Time.now()
        goal.target_pose.pose = Pose(Point(pos['x'],pos['y'],0.000),
                Quaternion(quat['r1'],quat['r2'],quat['r3'],quat['r4']))
        #start moving
        self.move_base.send_goal(goal)
        success =  self.move_base.wait_for_result(rospy.Duration(60))
        state = self.move_base.get_state()
        result = False
        
        if success and state == GoalStatus.SUCCEED:
            result = True
        else:
            self.move_base.cancel_goal()

        self.goal_sent = False
        return result
    def shutdown(self):
        if self.goal_sent:
            self.move_base.cancel_goal()
        rospy.loginfo("stop")
        rospt.sleep(1)




class Listen():
    def __init__(self):
        rospy.Subscriber("/Speech2text",String,Self.callback)
    def callback(self,data):
        voice_detect = data.data
        return voice_detect

class wait(smach.state):
    def __init__(self):
        smach.State.__init__(self, outcomes = {'GoTOBase','END'})
        self.speech = Listen()
    def execute(self, userdata):
        if self.speech = Listen.callback:
            return 'GoToBase'
        else:
            pass

class GoToBase(smach.state):
    def __init__(self):
        smach.State.__init__(self, outcomes={'reeched'})
        navigator = GotoPose()
        
        position = {'x': 1.31, 'y': 0.78}
        quaternion = {'r1' : 0.000, 'r2' : 0.000, 'r3':-0.183, 'r4' : 0.983}
        

    def execute(self, userdata):





def main():
    rospy.init_node('Voice_control_robot')
    sm. = smach.StateMachine(outcomes =['finished'])
    with sm:
        ``smach.StateMachine.add
