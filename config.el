(setq doom-font (font-spec :family "Fira Mono" :size 15.3))
;; (setq doom-font (font-spec :family "Fira Mono" :size 16.3))
(after! org
  (setq package-archives '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                           ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
                           ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"))))
(setq confirm-kill-emacs nil)
;; (require 'anki-editor)
 ;;(set-frame-parameter (selected-frame) 'alpha '(<active> . <inactive>))
 ;;(set-frame-parameter (selected-frame) 'alpha <both>)
(set-frame-parameter (selected-frame) 'alpha '(90 . 90))
(add-to-list 'default-frame-alist '(alpha . (90 . 90)))
(defun toggle-transparency ()
  (interactive)
  (let ((alpha (frame-parameter nil 'alpha)))
    (set-frame-parameter
     nil 'alpha
     (if (eql (cond ((numberp alpha) alpha)
                    ((numberp (cdr alpha)) (cdr alpha))
                    ;; Also handle undocumented (<active> <inactive>) form.
                    ((numberp (cadr alpha)) (cadr alpha)))
              100)
         '(87 . 90) '(100 . 100)))))
(map! "C-c t" 'toggle-transparency)
;; (map! (:after org-mode-map :g "C-c C-o" 'youdao-dictionary-search-at-point-posframe))
(map! "C-c o" 'youdao-dictionary-search-at-point-posframe)
(map! "C-x C-b" 'switch-to-buffer)
(global-visual-line-mode)
(setq display-line-numbers-type 'visual)
;; (add-to-list 'load-path "~/.doom.d/eaf/")
;; (require 'eaf)

;; (use-package! eaf
;;   :load-path "~/.doom.d/eaf"
;;   :custom
;;   (eaf-find-alternate-file-in-dired t)
;;   :config
;;   (eaf-bind-key scroll_up "RET" eaf-pdf-viewer-keybinding)
;;   (eaf-bind-key scroll_down_page "DEL" eaf-pdf-viewer-keybinding)
;;   (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
;;   (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
;;   (eaf-bind-key take_photo "p" eaf-camera-keybinding))
(use-package! posframe
  :load-path "~/.doom.d/posframe/")
(setq posframe-arghandler #'my-posframe-arghandler)
;; (setq posframe-arghandler '(:internal-border-width 1 :background-color "#012762"))
;; (defun my-posframe-arghandler (buffer-or-name arg-name value)
(defun my-posframe-arghandler (buffer-or-name arg-name value)
  (let ((info '(:internal-border-width 1 :background-color "#012762")))
    (or (plist-get info arg-name) value)))
;; (org-link-set-parameters "chrome" :follow (lambda (path) (browse-url-chrome (concat "http:" path))))
;; (org-link-set-parameters "chromes" :follow (lambda (path) (browse-url-chrome (concat "https:" path))))
;; (org-link-set-parameters "chromium" :follow (lambda (path) (browse-url-chromium (concat "http:" path))))
;; (org-link-set-parameters "chromiums" :follow (lambda (path) (browse-url-chromium (concat "https:" path))))
;; ;; (setq browse-url-browser-function 'browse-url-generic
;;       browse-url-generic-program "chromium")
;; (set-popup-rule! PREDICATE &key IGNORE ACTIONS SIDE SIZE WIDTH HEIGHT SLOT VSLOT TTL QUIT SELECT MODELINE AUTOSAVE PARAMETERS)
(set-popup-rule! "*SDCV*" :side 'right :size 60 :modeline nil :select nil :quit t)
(setq sdcv-dictionary-complete-list    ;setup dictionary list for simple search
      '("朗道英汉字典5.0"
        "朗道汉英字典5.0"))
(map! "C-c i" 'sdcv-search-pointer)
(map! :m "[g" 'sdcv-search-pointer)
(map! :leader :m "d" 'sdcv-search-pointer)
;; (set-popup-rules!
 ;; '(("*SDCV*" :side 'right)
   ;; ))
(setq org-directory "~/Dropbox/org")
(setq org-journal-dir "~/Dropbox/org/journal/")
;; (setq org-journal-file-type 'weekly)
(setq org-journal-date-format "%A, %d %B %Y")
