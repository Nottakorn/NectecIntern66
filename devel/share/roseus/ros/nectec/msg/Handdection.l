;; Auto-generated. Do not edit!


(when (boundp 'nectec::Handdection)
  (if (not (find-package "NECTEC"))
    (make-package "NECTEC"))
  (shadow 'Handdection (find-package "NECTEC")))
(unless (find-package "NECTEC::HANDDECTION")
  (make-package "NECTEC::HANDDECTION"))

(in-package "ROS")
;;//! \htmlinclude Handdection.msg.html


(defclass nectec::Handdection
  :super ros::object
  :slots (_type _symbol _success ))

(defmethod nectec::Handdection
  (:init
   (&key
    ((:type __type) "")
    ((:symbol __symbol) "")
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _type (string __type))
   (setq _symbol (string __symbol))
   (setq _success __success)
   self)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:symbol
   (&optional __symbol)
   (if __symbol (setq _symbol __symbol)) _symbol)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; string _type
    4 (length _type)
    ;; string _symbol
    4 (length _symbol)
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _type
       (write-long (length _type) s) (princ _type s)
     ;; string _symbol
       (write-long (length _symbol) s) (princ _symbol s)
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _symbol
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _symbol (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get nectec::Handdection :md5sum-) "9d3ac493f6c86d8e2bb954ef0fe24df9")
(setf (get nectec::Handdection :datatype-) "nectec/Handdection")
(setf (get nectec::Handdection :definition-)
      "string type
string symbol
bool success
")



(provide :nectec/Handdection "9d3ac493f6c86d8e2bb954ef0fe24df9")


