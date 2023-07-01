; Auto-generated. Do not edit!


(cl:in-package nectec-srv)


;//! \htmlinclude DectectionRL-request.msg.html

(cl:defclass <DectectionRL-request> (roslisp-msg-protocol:ros-message)
  ((timeout
    :reader timeout
    :initarg :timeout
    :type cl:float
    :initform 0.0))
)

(cl:defclass DectectionRL-request (<DectectionRL-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DectectionRL-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DectectionRL-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name nectec-srv:<DectectionRL-request> is deprecated: use nectec-srv:DectectionRL-request instead.")))

(cl:ensure-generic-function 'timeout-val :lambda-list '(m))
(cl:defmethod timeout-val ((m <DectectionRL-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nectec-srv:timeout-val is deprecated.  Use nectec-srv:timeout instead.")
  (timeout m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DectectionRL-request>) ostream)
  "Serializes a message object of type '<DectectionRL-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'timeout))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DectectionRL-request>) istream)
  "Deserializes a message object of type '<DectectionRL-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'timeout) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DectectionRL-request>)))
  "Returns string type for a service object of type '<DectectionRL-request>"
  "nectec/DectectionRLRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DectectionRL-request)))
  "Returns string type for a service object of type 'DectectionRL-request"
  "nectec/DectectionRLRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DectectionRL-request>)))
  "Returns md5sum for a message object of type '<DectectionRL-request>"
  "bf270a3091a6f4c4532e2ae7f6534df5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DectectionRL-request)))
  "Returns md5sum for a message object of type 'DectectionRL-request"
  "bf270a3091a6f4c4532e2ae7f6534df5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DectectionRL-request>)))
  "Returns full string definition for message of type '<DectectionRL-request>"
  (cl:format cl:nil "float32 timeout~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DectectionRL-request)))
  "Returns full string definition for message of type 'DectectionRL-request"
  (cl:format cl:nil "float32 timeout~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DectectionRL-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DectectionRL-request>))
  "Converts a ROS message object to a list"
  (cl:list 'DectectionRL-request
    (cl:cons ':timeout (timeout msg))
))
;//! \htmlinclude DectectionRL-response.msg.html

(cl:defclass <DectectionRL-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass DectectionRL-response (<DectectionRL-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DectectionRL-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DectectionRL-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name nectec-srv:<DectectionRL-response> is deprecated: use nectec-srv:DectectionRL-response instead.")))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <DectectionRL-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nectec-srv:type-val is deprecated.  Use nectec-srv:type instead.")
  (type m))

(cl:ensure-generic-function 'symbol-val :lambda-list '(m))
(cl:defmethod symbol-val ((m <DectectionRL-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nectec-srv:symbol-val is deprecated.  Use nectec-srv:symbol instead.")
  (symbol m))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <DectectionRL-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nectec-srv:success-val is deprecated.  Use nectec-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DectectionRL-response>) ostream)
  "Serializes a message object of type '<DectectionRL-response>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DectectionRL-response>) istream)
  "Deserializes a message object of type '<DectectionRL-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DectectionRL-response>)))
  "Returns string type for a service object of type '<DectectionRL-response>"
  "nectec/DectectionRLResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DectectionRL-response)))
  "Returns string type for a service object of type 'DectectionRL-response"
  "nectec/DectectionRLResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DectectionRL-response>)))
  "Returns md5sum for a message object of type '<DectectionRL-response>"
  "bf270a3091a6f4c4532e2ae7f6534df5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DectectionRL-response)))
  "Returns md5sum for a message object of type 'DectectionRL-response"
  "bf270a3091a6f4c4532e2ae7f6534df5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DectectionRL-response>)))
  "Returns full string definition for message of type '<DectectionRL-response>"
  (cl:format cl:nil "string type~%string symbol~%bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DectectionRL-response)))
  "Returns full string definition for message of type 'DectectionRL-response"
  (cl:format cl:nil "string type~%string symbol~%bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DectectionRL-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'type))
     4 (cl:length (cl:slot-value msg 'symbol))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DectectionRL-response>))
  "Converts a ROS message object to a list"
  (cl:list 'DectectionRL-response
    (cl:cons ':type (type msg))
    (cl:cons ':symbol (symbol msg))
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'DectectionRL)))
  'DectectionRL-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'DectectionRL)))
  'DectectionRL-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DectectionRL)))
  "Returns string type for a service object of type '<DectectionRL>"
  "nectec/DectectionRL")