(asdf:defsystem #:common-lisp-jupyter
  :description "A Common Lisp kernel for Jupyter along with a library for building Jupyter kernels."
  :version "0.1"
  :author "Tarn W. Burton"
  :license "MIT"
  :depends-on
    (:alexandria
     :babel
     :bordeaux-threads
     :cl-base64
     :closer-mop
     ; This should be `(:feature (:not :clasp) :ironclad)` but some distributions still don't have
     ; ASDF 3
     #-clasp :ironclad
     :iterate
     :jsown
     :pzmq
     :trivial-backtrace
     :trivial-garbage
     :trivial-gray-streams
     :trivial-mimes)
  :components
    ((:module res
      :components
        ((:module cl
          :components
            ((:static-file "logo-64x64.png")))
         (:module sbcl
          :components
            ((:static-file "logo-64x64.png")))))
     (:module src
      :serial t
      :components
        ((:file "packages")
         (:file "utils")
         (:file "queue")
         (:file "config")
         (:file "log")
         (:file "mac")
         (:file "channel")
         (:file "heartbeat")
         (:file "message")
         (:file "shell")
         (:file "stdin")
         (:file "control")
         (:file "iopub")
         (:file "results")
         (:file "comm")
         (:module widgets
          :serial t
          :components
            ((:file "traits")
             (:file "widget")
             (:file "trait-types")
             (:file "shared-slots")
             (:file "dom-widget")
             (:file "style")
             (:file "checkbox")
             (:file "combobox")
             (:file "box")
             (:file "button")
             (:file "color-picker")
             (:file "controller")
             (:file "date-picker")
             (:file "file-upload")
             (:file "label")
             (:file "link")
             (:file "media")
             (:file "output")
             (:file "progress")
             (:file "select")
             (:file "slider")
             (:file "text")
             (:file "toggle-button")
             (:file "valid")))
         (:file "history")
         (:file "kernel")
         (:file "installer")
         (:file "cl-kernel")
         (:file "ros-install")
         (:file "convert")))))
