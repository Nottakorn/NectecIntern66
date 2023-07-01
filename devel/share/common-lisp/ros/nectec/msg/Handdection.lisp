; Auto-generated. Do not edit!


(cl:in-package nectec-msg)


;//! \htmlinclude Handdection.msg.html

(cl:defclass <Handdection> (roslisp-msg-protocol:ros-message)
  ((type
    :reader type
    :initarg :type
    :type cl:string
    :initform "")
   (symbol
    :reader symbol
    :initarg :symbol
    :type cl:string
    :initform "")
   (success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Handdection (<Handdection>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Handdection>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Handdection)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name nectec-msg:<Handdection> is deprecated: use nectec-msg:Handdection instead.")))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <Handdection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nectec-msg:type-val is deprecated.  Use nectec-msg:type instead.")
  (type m))

(cl:ensure-generic-function 'symbol-val :lambda-list '(m))
(cl:defmethod symbol-val ((m <Handdection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nectec-msg:symbol-val is deprecated.  Use nectec-msg:symbol instead.")
  (symbol m))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <Handdection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nectec-msg:success-val is deprecated.  Use nectec-msg:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Handdection>) ostream)
  "Serializes a message object of type '<Handdection>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'type))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'type))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'symbol))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'symbol))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Handdection>) istream)
  "Deserializes a message object of type '<Handdection>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'type) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'type) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'symbol) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'symbol) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Handdection>)))
  "Returns string type for a message object of type '<Handdection>"
  "nectec/Handdection")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Handdection)))
  "Returns string type for a message object of type 'Handdection"
  "nectec/Handdection")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Handdection>)))
  "Returns md5sum for a message object of type '<Handdection>"
  "9d3ac493f6c86d8e2bb954ef0fe24df9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Handdection)))
  "Returns md5sum for a message object of type 'Handdection"
  "9d3ac493f6c86d8e2bb954ef0fe24df9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Handdection>)))
  "Returns full string definition for message of type '<Handdection>"
  (cl:format cl:nil "string type~%string symbol~%bool success~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Handdection)))
  "Returns full string definition for message of type 'Handdection"
  (cl:format cl:nil "string type~%string symbol~%bool success~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Handdection>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'type))
     4 (cl:length (cl:slot-value msg 'symbol))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Handdection>))
  "Converts a ROS message object to a list"
  (cl:list 'Handdection
    (cl:cons ':type (type msg))
    (cl:cons ':symbol (symbol msg))
    (cl:cons ':success (success msg))
))
