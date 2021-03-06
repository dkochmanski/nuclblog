;;; file: nuclblog.asd
;;;
;;; Copyright (c) 2007 Cyrus Harmon (ch-lisp@bobobeach.com)
;;; All rights reserved.
;;;
;;; Redistribution and use in source and binary forms, with or without
;;; modification, are permitted provided that the following conditions
;;; are met:
;;;
;;;   * Redistributions of source code must retain the above copyright
;;;     notice, this list of conditions and the following disclaimer.
;;;
;;;   * Redistributions in binary form must reproduce the above
;;;     copyright notice, this list of conditions and the following
;;;     disclaimer in the documentation and/or other materials
;;;     provided with the distribution.
;;;
;;; THIS SOFTWARE IS PROVIDED BY THE AUTHOR 'AS IS' AND ANY EXPRESSED
;;; OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
;;; WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
;;; ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
;;; DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
;;; DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
;;; GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
;;; INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
;;; WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
;;; NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
;;; SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
;;;

(asdf:defsystem nuclblog
  :name "nuclblog"
  :author "Cyrus Harmon <ch-lisp@bobobeach.com>"
  :version #.(with-open-file
                 (vers (merge-pathnames "version.lisp-expr" *load-truename*))
               (read vers))
  :licence "BSD"
  :depends-on (:hunchentoot :cl-who :cl-store :md5 :bordeaux-threads :hunchentoot-auth :cl-markdown)
  :components
  ((:static-file "version" :pathname #p"version.lisp-expr")
   (:static-file "README")
   (:static-file "NEWS")
   (:static-file "LICENSE")
   (:static-file "ChangeLog")
   (:cl-source-file "defpackage")
   (:cl-source-file "utilities":depends-on ("defpackage"))
   (:cl-source-file "nuclblog" :depends-on ("defpackage" "utilities"))
   (:cl-source-file "links" :depends-on ("defpackage" "utilities" "nuclblog"))
   (:cl-source-file "pages" :depends-on ("defpackage"
                                         "utilities"
                                         "nuclblog"
                                         "links"))
   (:cl-source-file "handlers" :depends-on ("defpackage"
                                            "utilities"
                                            "nuclblog"
                                            "links"
                                            "pages"))
   (:module "css"
            :components ((:static-file nuclblog-css :pathname #p"nuclblog.css")))))
