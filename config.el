(after! org
  (setq package-archives '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                           ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
                           ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"))))

(setq doom-font (font-spec :family "Fira Mono" :size 18))
;; (setq doom-font (font-spec :family "Fira Mono" :size 16.3))

(setq confirm-kill-emacs nil)

;; (require 'anki-editor)

;;(set-frame-parameter (selected-frame) 'alpha '(<active> . <inactive>))
 ;;(set-frame-parameter (selected-frame) 'alpha <both>)
(set-frame-parameter (selected-frame) 'alpha '(96 . 96))
(add-to-list 'default-frame-alist '(alpha . (96 . 96)))
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
         '(96 . 96) '(100 . 100)))))
(map! "C-c t" 'toggle-transparency)

;; (map! (:after org-mode-map :g "C-c C-o" 'youdao-dictionary-search-at-point-posframe))
;; (map! "C-c o" 'youdao-dictionary-search-at-point-posframe)

(map! "C-x C-b" 'switch-to-buffer)
(map! "C-x C-o" 'ace-window)
(global-visual-line-mode)
(setq display-line-numbers-type 'visual)

;; (setq doom-theme 'doom-outrun-electric)
;; (setq doom-theme 'doom-fairy-floss)
;; (setq doom-theme 'doom-fairy-floss)
;; (setq doom-theme 'doom-dark+)
;; (setq doom-theme 'doom-one-light)
(setq doom-theme 'doom-dracula)
(setq doom-dark+-blue-modeline t)

;; (use-package! posframe
;;   :load-path "~/.doom.d/posframe/")
;; (setq posframe-arghandler #'my-posframe-arghandler)
;; ;; (setq posframe-arghandler '(:internal-border-width 1 :background-color "#012762"))
;; ;; (defun my-posframe-arghandler (buffer-or-name arg-name value)
;; (defun my-posframe-arghandler (buffer-or-name arg-name value)
;;   (let ((info '(:internal-border-width 1 :background-color "#012762")))
;;     (or (plist-get info arg-name) value)))

;; (org-link-set-parameters "chrome" :follow (lambda (path) (browse-url-chrome (concat "http:" path))))
;; (org-link-set-parameters "chromes" :follow (lambda (path) (browse-url-chrome (concat "https:" path))))
;; (org-link-set-parameters "chromium" :follow (lambda (path) (browse-url-chromium (concat "http:" path))))
;; (org-link-set-parameters "chromiums" :follow (lambda (path) (browse-url-chromium (concat "https:" path))))
;; (setq browse-url-browser-function 'browse-url-generic
;;       browse-url-generic-program "chromium")
;; (setq browse-url-generic-program (executable-find "chromium")
      ;; browse-url-browser-function 'browse-url-generic)
;; (setq browse-url-browser-function 'browse-url-default-browser)
;; (setq process-connection-type nil)
;; (setq browse-url-browser-function 'browse-url-generic browse-url-generic-program "xdg-open")
(setq browse-url-browser-function 'browse-url-chromium)
(after! org
  (defun counsel-locate-action-extern (x)
    "Use xdg-open shell command on X."
    (call-process shell-file-name nil
                nil nil
                shell-command-switch
                (format "%s %s"
                        (if (eq system-type 'darwin)
                            "open"
                          "xdg-open")
                        (shell-quote-argument x)))))

;; (set-popup-rule! PREDICATE &key IGNORE ACTIONS SIDE SIZE WIDTH HEIGHT SLOT VSLOT TTL QUIT SELECT MODELINE AUTOSAVE PARAMETERS)
(set-popup-rule! "*SDCV*" :side 'right :size 60 :modeline nil :select nil :quit t)
(setq sdcv-dictionary-complete-list    ;setup dictionary list for simple search
      '("朗道英汉字典5.0"
        "朗道汉英字典5.0"))
;; (map! "C-c i" 'sdcv-search-pointer)
;; (map! :m "[g" 'sdcv-search-pointer)
(map! :leader :m "d" 'sdcv-search-pointer)
;; (set-popup-rules!
 ;; '(("*SDCV*" :side 'right)
   ;; ))

(after! org
  (setq org-directory "~/Dropbox/org")
  (setq org-journal-dir "~/Dropbox/org/journal/")
  ;; (setq org-journal-file-type 'weekly)
  (setq org-journal-date-format "%A, %d %B %Y")
  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline "~/Dropbox/org/gtd.org" "Tasks")
           "* TODO %?\n  %i\n  %a")
          ("h" "Note" entry (file+headline "~/Dropbox/org/note.org" "Notes")
           "* %?\n  %i\n  %a")
          ("j" "Journal" entry (file+datetree "~/Dropbox/org/journal.org")
           "* %?\nEntered on %U\n  %i\n  %a"))))

;; (setq debug-on-quit t)
;; (after! eshell
  ;; (setq eshell-visual-commands (delete "bash" eshell-visual-commands)))

;; (setq url-proxy-services
      ;; '(("no_proxy" . "^\\(localhost\\|10.*\\)")
        ;; ("http" . "127.0.0.1:8118")
        ;; ("https" . "127.0.0.1:8118")))
;; (setq url-gateway-method 'socks)
;; (setq socks-server '("Default server" "127.0.0.1" 1080 5))

(set-popup-rule! "*lsp-help*" :side 'bottom :size 60 :modeline nil :select nil :quit t)

(defun org-insert-clipboard-image ()
  "Take a screenshot into a time stamped unique-named file in the
same directory as the org-buffer and insert a link to this file."
  (interactive)
  (setq filename
        (concat
         (make-temp-name
          ;; (concat (file-name-directory buffer-file-name)
          (concat "~/Dropbox/org/"
                  "images/"
                  (file-name-base buffer-file-name)
                  "_"
                  (format-time-string "%Y%m%d_%H%M%S_")) ) ".png"))
  ;; (call-process "xclip" nil nil nil "-selection " "clipboard" "-t" "image/png" "-o" "\>" filename)
  (call-process-shell-command (concat "xclip -selection clipboard -t image/png -o > " filename))
  (insert (concat "[[" filename "]]"))
  (org-display-inline-images))
(map! "C-c i" 'org-insert-clipboard-image)
;; (setq org-image-actual-width t)
(after! org
  (setq org-image-actual-width (/ (display-pixel-width) 3)
        )
  )

(map! "C-c h" 'hide-mode-line-mode)

(defun dir-org ()
  "open org dictionary at Dropbox"
  (interactive)
  (+lookup/file "~/Dropbox/org"))
(map! "C-c o" 'dir-org)
(defun dir-emacs ()
  "open org dictionary at Dropbox"
  (interactive)
  (+lookup/file "~/.emacs.d"))
(map! "C-c e" 'dir-emacs)
;; (defun dir-temp ()
;;   "open org dictionary at Temp"
;;   (interactive)
;;   (+lookup/file "~/Temp"))
;; (map! "C-c t" 'dir-temp)

(setq evil-escape-key-sequence nil)

;; (setf tramp-ssh-controlmaster-options (concat "-o SendEnv TRAMP=yes " tramp-ssh-controlmaster-options))
(setq tramp-ssh-controlmaster-options
   "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

(use-package! eaf
  :after evil
  :custom
  (eaf-find-alternate-file-in-dired t)
  :config
  ;; (setq which-key-show-transient-maps t)
  (defun call-doom-leader ()
    (interactive)
    (set-transient-map doom-leader-map))

(after! eaf
  (set-evil-initial-state! 'eaf-mode 'emacs)
  (defun eaf-org-open-file (file &optional link)
    "An wrapper function on `eaf-open'."
    (eaf-open file))
  (map! "C-c b" 'eaf-open-browser)
  (map! "C-c s" 'eaf-open-browser-with-history)
  ;; (which-key-show-keymap doom-leader-map)
  ;; (eaf-setq eaf-browser-download-path "other_path")
  ;; (eaf-bind-key call-doom-leader "SPC" eaf-browser-keybinding)
  (eaf-bind-key eaf-open-browser "C-c b" eaf-browser-keybinding)
  (eaf-bind-key dark_mode "M-d" eaf-browser-keybinding)
  (eaf-bind-key sdcv-search-input "M-i" eaf-browser-keybinding)
  (eaf-bind-key eaf-open-bookmark "C-c m" eaf-browser-keybinding)

  (eaf-setq eaf-browser-enable-plugin "false")
  (eaf-setq eaf-browser-enable-javascript "true")
  (eaf-setq eaf-browse-default-zoom "1.5")

  (setq browse-url-browser-function 'eaf-open-browser))

;; use `emacs-application-framework' to open PDF file: link
;; (add-to-list 'org-file-apps '("\\.pdf\\'" . eaf-org-open-file))
(defalias 'browse-web #'eaf-open-browser))

(set-docsets! 'python-mode :add "Python_3")

;; (map! :leader :m "a" 'toggle-input-method)
;; (setq evil-input-method "pyim")
(use-package! pyim

  :after  liberime-config
  :init
  (setq pyim-title "ㄓ")
  (setq pyim-punctuation-translate-p '(no yes auto))
  (setq evil-input-method "pyim")
  :config
  (setq pyim-page-tooltip 'minibuffer)
  (setq pyim-default-scheme 'rime)
  (setq pyim-page-length 9)
  (setq-default pyim-english-input-switch-functions
                '(pyim-probe-dynamic-english
                  pyim-probe-isearch-mode
                  pyim-probe-program-mode
                  pyim-probe-org-structure-template))
  (after! org
    ;; (map! "C-;" 'pyim-delete-word-from-personal-buffer)
    (map! :g "s-j" 'pyim-convert-string-at-point) ;与 pyim-probe-dynamic-english 配合
    (map! :g "<XF86Tools>" 'pyim-convert-string-at-point) ;与 pyim-probe-dynamic-english 配合
    ;; (setq evil-input-method "pyim")
    ;; (toggle-input-method)
    )
  )
;; (global-set-key (kbd "s-j") 'pyim-convert-string-at-point)
(use-package! liberime-config
  :init
  ;; (setq liberime-user-data-dir "~/.config/ibus/rime/")
  ;; (liberime-start "/usr/share/rime-data/" (file-truename "~/.emacs.d/pyim/rime/"))
  (add-hook 'after-liberime-load-hook
            (lambda ()
              (liberime-select-schema "double_pinyin_flypy")))
  ;; (liberime-select-schema "luna_pinyin_simp")))
  :config
  ;; (liberime-start "/usr/share/rime-data"
  ;; (file-truename "~/.emacs.d/rime/"))
  (setq default-input-method "pyim")
  ;; (liberime-select-schema "double_pinyin_fly")
  )
