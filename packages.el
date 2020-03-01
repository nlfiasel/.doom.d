;; -*- no-byte-compile: t; -*-
;;; packages.el
;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:host github :repo "username/repo"))
;; (package! builtin-package :disable t)

;; Anki
;; (package! anki-editor)
;; (package! ellocate)
;; (package! youdao-dictionary)
(package! sdcv)
(package! org-journal)
(package! org-noter)

(package! liberime-config
  :recipe (:host github
                 :repo "merrickluo/liberime"
                 :files ("CMakeLists.txt" "Makefile" "src" "liberime-config.el")))

(package! eaf
  :recipe (:host github
                 :repo "manateelazycat/emacs-application-framework"
                 :files ("*")))

(package! posframe
  :recipe (:host github
                 :repo "tumashu/posframe"
                 :files ("*")))
