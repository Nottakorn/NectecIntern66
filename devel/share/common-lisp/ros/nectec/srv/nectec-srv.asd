
(cl:in-package :asdf)

(defsystem "nectec-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "DectectionRL" :depends-on ("_package_DectectionRL"))
    (:file "_package_DectectionRL" :depends-on ("_package"))
  ))