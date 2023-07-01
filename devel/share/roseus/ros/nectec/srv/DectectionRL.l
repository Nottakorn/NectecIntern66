;; Auto-generated. Do not edit!


(when (boundp 'nectec::DectectionRL)
  (if (not (find-package "NECTEC"))
    (make-package "NECTEC"))
  (shadow 'DectectionRL (find-package "NECTEC")))
(unless (find-package "NECTEC::DECTECTIONRL")
  (make-package "NECTEC::DECTECTIONRL"))
(unless (find-package "NECTEC::DECTECTIONRLREQUEST")
  (make-package "NECTEC::DECTECTIONRLREQUEST"))
(unless (find-package "NECTEC::DECTECTIONRLRESPONSE")
  (make-package "NECTEC::DECTECTIONRLRESPONSE"))

(in-package "ROS")





(defclass nectec::DectectionRLRequest
  :super ros::object
  :slots (_timeout ))

(defmethod nectec::DectectionRLRequest
  (:init
   (&key
    ((:timeout __timeout) 0.0)
    )
   (send-super :init)
   (setq _timeout (float __timeout))
   self)
  (:timeout
   (&optional __timeout)
   (if __timeout (setq _timeout __timeout)) _timeout)
  (:serialization-length
   ()
   (+
    ;; float32 _timeout
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _timeout
       (sys::poke _timeout (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _timeout
     (setq _timeout (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass nectec::DectectionRLResponse
  :super ros::object
  :slots (_type _symbol _success ))

(defmethod nectec::DectectionRLResponse
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

(defclass nectec::DectectionRL
  :super ros::object
  :slots ())

(setf (get nectec::DectectionRL :md5sum-) "bf270a3091a6f4c4532e2ae7f6534df5")
(setf (get nectec::DectectionRL :datatype-) "nectec/DectectionRL")
(setf (get nectec::DectectionRL :request) nectec::DectectionRLRequest)
(setf (get nectec::DectectionRL :response) nectec::DectectionRLResponse)

(defmethod nectec::DectectionRLRequest
  (:response () (instance nectec::DectectionRLResponse :init)))

(setf (get nectec::DectectionRLRequest :md5sum-) "bf270a3091a6f4c4532e2ae7f6534df5")
(setf (get nectec::DectectionRLRequest :datatype-) "nectec/DectectionRLRequest")
(setf (get nectec::DectectionRLRequest :definition-)
      "float32 timeout
---
string type
string symbol
bool success
")

(setf (get nectec::DectectionRLResponse :md5sum-) "bf270a3091a6f4c4532e2ae7f6534df5")
(setf (get nectec::DectectionRLResponse :datatype-) "nectec/DectectionRLResponse")
(setf (get nectec::DectectionRLResponse :definition-)
      "float32 timeout
---
string type
string symbol
bool success
")



(provide :nectec/DectectionRL "bf270a3091a6f4c4532e2ae7f6534df5")


