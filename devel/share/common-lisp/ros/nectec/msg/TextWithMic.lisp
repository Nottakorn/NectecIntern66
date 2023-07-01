; Auto-generated. Do not edit!


(cl:in-package nectec-msg)


;//! \htmlinclude TextWithMic.msg.html

(cl:defclass <TextWithMic> (roslisp-msg-protocol:ros-message)
  ((mic
    :reader mic
    :initarg :mic
    :type cl:string
    :initform ""))
)

(cl:defclass TextWithMic (<TextWithMic>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TextWithMic>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TextWithMic)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name nectec-msg:<TextWithMic> is deprecated: use nectec-msg:TextWithMic instead.")))

(cl:ensure-generic-function 'mic-val :lambda-list '(m))
(cl:defmethod mic-val ((m <TextWithMic>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nectec-msg:mic-val is deprecated.  Use nectec-msg:mic instead.")
  (mic m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TextWithMic>) ostream)
  "Serializes a message object of type '<TextWithMic>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'mic))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'mic))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TextWithMic>) istream)
  "Deserializes a message object of type '<TextWithMic>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mic) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'mic) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TextWithMic>)))
  "Returns string type for a message object of type '<TextWithMic>"
  "nectec/TextWithMic")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TextWithMic)))
  "Returns string type for a message object of type 'TextWithMic"
  "nectec/TextWithMic")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TextWithMic>)))
  "Returns md5sum for a message object of type '<TextWithMic>"
  "5c60854cf88203241207ee392c3dd59c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TextWithMic)))
  "Returns md5sum for a message object of type 'TextWithMic"
  "5c60854cf88203241207ee392c3dd59c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TextWithMic>)))
  "Returns full string definition for message of type '<TextWithMic>"
  (cl:format cl:nil "string mic~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TextWithMic)))
  "Returns full string definition for message of type 'TextWithMic"
  (cl:format cl:nil "string mic~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TextWithMic>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'mic))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TextWithMic>))
  "Converts a ROS message object to a list"
  (cl:list 'TextWithMic
    (cl:cons ':mic (mic msg))
))
