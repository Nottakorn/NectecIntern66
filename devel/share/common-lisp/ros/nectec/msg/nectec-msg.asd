
(cl:in-package :asdf)

(defsystem "nectec-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Handdection" :depends-on ("_package_Handdection"))
    (:file "_package_Handdection" :depends-on ("_package"))
    (:file "Rotatecom" :depends-on ("_package_Rotatecom"))
    (:file "_package_Rotatecom" :depends-on ("_package"))
    (:file "TextWithMic" :depends-on ("_package_TextWithMic"))
    (:file "_package_TextWithMic" :depends-on ("_package"))
  ))