;; Auto-generated. Do not edit!


(when (boundp 'nectec::TextWithMic)
  (if (not (find-package "NECTEC"))
    (make-package "NECTEC"))
  (shadow 'TextWithMic (find-package "NECTEC")))
(unless (find-package "NECTEC::TEXTWITHMIC")
  (make-package "NECTEC::TEXTWITHMIC"))

(in-package "ROS")
;;//! \htmlinclude TextWithMic.msg.html


(defclass nectec::TextWithMic
  :super ros::object
  :slots (_mic ))

(defmethod nectec::TextWithMic
  (:init
   (&key
    ((:mic __mic) "")
    )
   (send-super :init)
   (setq _mic (string __mic))
   self)
  (:mic
   (&optional __mic)
   (if __mic (setq _mic __mic)) _mic)
  (:serialization-length
   ()
   (+
    ;; string _mic
    4 (length _mic)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _mic
       (write-long (length _mic) s) (princ _mic s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _mic
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _mic (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get nectec::TextWithMic :md5sum-) "5c60854cf88203241207ee392c3dd59c")
(setf (get nectec::TextWithMic :datatype-) "nectec/TextWithMic")
(setf (get nectec::TextWithMic :definition-)
      "string mic
")



(provide :nectec/TextWithMic "5c60854cf88203241207ee392c3dd59c")


