(setq gc-cons-threshold (* 50 1000 1000))

(defun efs/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                     (time-subtract after-init-time before-init-time)))
           gcs-done))

(add-hook 'emacs-startup-hook #'efs/display-startup-time)

(require 'dashboard)
        (dashboard-setup-startup-hook)
        ;; Or if you use use-package
        (use-package dashboard
          :ensure t
          :config
          (dashboard-setup-startup-hook))

      ;; Set the title
      (setq dashboard-banner-logo-title "Hallo Niklas, wie geht's?")
      ;; Set the banner
(setq dashboard-startup-banner "/home/niklas/Downloads/leonardo.png")
      ;; Value can be
      ;; 'official which displays the official emacs logo
      ;; 'logo which displays an alternative emacs logo
      ;; 1, 2 or 3 which displays one of the text banners
      ;; "path/to/your/image.gif", "path/to/your/image.png" or "path/to/your/text.txt" which displays whatever gif/image/text you would prefer

      ;; Content is not centered by default. To center, set
      (setq dashboard-center-content t)

      ;; To disable shortcut "jump" indicators for each section, set
      (setq dashboard-show-shortcuts nil)

    (setq dashboard-set-heading-icons t)
    (setq dashboard-set-file-icons t)

;; Initialize package sources
  (require 'package)

  (setq package-archives '(("melpa" . "https://melpa.org/packages/")
			   ("org" . "https://orgmode.org/elpa/")
			   ("elpa" . "https://elpa.gnu.org/packages/")))

  (package-initialize)
  (unless package-archive-contents
    (package-refresh-contents))

    ;; Initialize use-package on non-Linux platforms
  (unless (package-installed-p 'use-package)
    (package-install 'use-package))

  (require 'use-package)
  (setq use-package-always-ensure t)

(use-package auto-package-update
  :custom
  (auto-package-update-interval 7)
  (auto-package-update-prompt-before-update t)
  (auto-package-update-hide-results t)
  :config
  (auto-package-update-maybe)
  (auto-package-update-at-time "09:00"))

;; Add my library path to load-path
(push "~/.dotfiles/.emacs.d/lisp" load-path)

(set-default-coding-systems 'utf-8)

(setq inhibit-startup-message t)

(scroll-bar-mode -1)  ; Disable scroll Bar
(tool-bar-mode -1)    ; Disable toolabr
(tooltip-mode -1)     ; Disable tooltips
(set-fringe-mode -1)

(menu-bar-mode -1)

(setq myFont 165)

(set-face-attribute 'default nil :font "Fira Code Retina" :height myFont)

;; Set the fixed pitch face
(set-face-attribute 'fixed-pitch nil :font "Fira Code Retina" :height myFont)

;; Set the variable pitch face
(set-face-attribute 'variable-pitch nil :font "Cantarell" :height myFont :weight 'regular)

;; On new machine run: M-x all-the-icons-install-fonts
     (use-package all-the-icons)

    (use-package doom-modeline
      :init (setq  doom-modeline-height 15)
	  (setq      doom-modeline-bar-width 6)
	  (setq      doom-modeline-lsp t)
	  (setq      doom-modeline-github nil)
	  (setq      doom-modeline-mu4e nil)
	  (setq      doom-modeline-irc t)
	  (setq      doom-modeline-minor-modes nil)
	  (setq      doom-modeline-persp-name nil)
	  (setq      doom-modeline-buffer-file-name-style 'truncate-except-project)
	  (setq      doom-modeline-major-mode-icon nil))
  (custom-set-faces '(mode-line ((t (:height 0.85))))
		    '(mode-line-inactive ((t (:height 0.85)))))
(doom-modeline-mode 1)

     (use-package doom-themes
       :ensure t
       :config
       ;; Global settings (defaults)
       (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
	     doom-themes-enable-italic t)) ; if nil, italics is universally disabled

     (load-theme 'doom-palenight t)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(global-set-key (kbd "C-M-u") 'universal-argument)

(use-package evil
  ;; Pre-load configuration
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  (setq evil-respect-visual-line-mode t)

  ;; Activate the Evil
  (evil-mode 1)

  ;; Set Emacs state modes
  (dolist (mode '(custom-mode
                  eshell-mode
                  git-rebase-mode
                  erc-mode
                  circe-server-mode
                  circe-chat-mode
                  circe-query-mode
                  sauron-mode
                  term-mode))
    (add-to-list 'evil-emacs-state-modes mode))

  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)


(defun dont-arrow-me-bro ()
    (interactive)
    (message "Arrow keys are bad, you know?"))

    ;; Disable arrow keys in normal and visual modes
    (define-key evil-normal-state-map (kbd "<left>") 'dont-arrow-me-bro)
    (define-key evil-normal-state-map (kbd "<right>") 'dont-arrow-me-bro)
    (define-key evil-normal-state-map (kbd "<down>") 'dont-arrow-me-bro)
    (define-key evil-normal-state-map (kbd "<up>") 'dont-arrow-me-bro)
    (evil-global-set-key 'motion (kbd "<left>") 'dont-arrow-me-bro)
    (evil-global-set-key 'motion (kbd "<right>") 'dont-arrow-me-bro)
    (evil-global-set-key 'motion (kbd "<down>") 'dont-arrow-me-bro)
    (evil-global-set-key 'motion (kbd "<up>") 'dont-arrow-me-bro))

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal)

(use-package evil-collection)
  ;; Is this a bug in evil-collection?
  (setq evil-collection-company-use-tng nil)

(use-package general
  :config
  (general-evil-setup t)

  (general-create-definer rune/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC"))

(column-number-mode)
(global-display-line-numbers-mode t)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1)
  :config
  (setq ivy-format-function #'ivy-format-function-line)
  (setq ivy-rich--display-transformers-list
        (plist-put ivy-rich--display-transformers-list
                   'ivy-switch-buffer
                   '(:columns
                     ((ivy-rich-candidate (:width 40))
                      (ivy-rich-switch-buffer-indicators (:width 4 :face error :align right)); return the buffer indicators
                      (ivy-rich-switch-buffer-major-mode (:width 12 :face warning))          ; return the major mode info
                      (ivy-rich-switch-buffer-project (:width 15 :face success))             ; return project name using `projectile'
                      (ivy-rich-switch-buffer-path (:width (lambda (x) (ivy-rich-switch-buffer-shorten-path x (ivy-rich-minibuffer-width 0.3))))))  ; return file path relative to project root or `default-directory' if project is nil
                     :predicate
                     (lambda (cand)
                       (if-let ((buffer (get-buffer cand)))
                           ;; Don't mess with EXWM buffers
                           (with-current-buffer buffer
                             (not (derived-mode-p 'exwm-mode)))))))))

(defun dw/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (auto-fill-mode 0)
  (visual-line-mode 1)
  (setq evil-auto-indent nil))

(use-package org
  :hook (org-mode . dw/org-mode-setup)
  :config
  (setq org-ellipsis " ▾"
        org-hide-emphasis-markers t))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

;; Replace list hyphen with dot
(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(dolist (face '((org-level-1 . 1.2)
                (org-level-2 . 1.1)
                (org-level-3 . 1.05)
                (org-level-4 . 1.0)
                (org-level-5 . 1.1)
                (org-level-6 . 1.1)
                (org-level-7 . 1.1)
                (org-level-8 . 1.1)))
  (set-face-attribute (car face) nil :font "Cantarell" :weight 'regular :height (cdr face)))

;; Make sure org-indent face is available
(require 'org-indent)

;; Ensure that anything that should be fixed-pitch in Org files appears that way
(set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
(set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-table nil   :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-indent nil :inherit '(org-hide fixed-pitch))
(set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch)

(setq org-directory "~/Projects/Code/OrgFiles")
(setq org-agenda-files '("Tasks.org" "Birthdays.org" "Habits.org"))

;; If you only want to see the agenda for today
;; (setq org-agenda-span 'day)

(setq org-agenda-start-with-log-mode t)
(setq org-log-done 'time)
(setq org-log-into-drawer t)

(setq org-todo-keywords
  '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)")
    (sequence "BACKLOG(b)" "PLAN(p)" "READY(r)" "ACTIVE(a)" "REVIEW(v)" "WAIT(w@/!)" "HOLD(h)" "|" "COMPLETED(c)" "CANC(k@)")))

;; Configure custom agenda views
(setq org-agenda-custom-commands
  '(("d" "Dashboard"
     ((agenda "" ((org-deadline-warning-days 7)))
      (todo "NEXT"
        ((org-agenda-overriding-header "Next Tasks")))
      (tags-todo "agenda/ACTIVE" ((org-agenda-overriding-header "Active Projects")))))

    ("n" "Next Tasks"
     ((todo "NEXT"
        ((org-agenda-overriding-header "Next Tasks")))))


    ("W" "Work Tasks" tags-todo "+work")

    ;; Low-effort next actions
    ("e" tags-todo "+TODO=\"NEXT\"+Effort<15&+Effort>0"
     ((org-agenda-overriding-header "Low Effort Tasks")
      (org-agenda-max-todos 20)
      (org-agenda-files org-agenda-files)))

    ("w" "Workflow Status"
     ((todo "WAIT"
            ((org-agenda-overriding-header "Waiting on External")
             (org-agenda-files org-agenda-files)))
      (todo "REVIEW"
            ((org-agenda-overriding-header "In Review")
             (org-agenda-files org-agenda-files)))
      (todo "PLAN"
            ((org-agenda-overriding-header "In Planning")
             (org-agenda-todo-list-sublevels nil)
             (org-agenda-files org-agenda-files)))
      (todo "BACKLOG"
            ((org-agenda-overriding-header "Project Backlog")
             (org-agenda-todo-list-sublevels nil)
             (org-agenda-files org-agenda-files)))
      (todo "READY"
            ((org-agenda-overriding-header "Ready for Work")
             (org-agenda-files org-agenda-files)))
      (todo "ACTIVE"
            ((org-agenda-overriding-header "Active Projects")
             (org-agenda-files org-agenda-files)))
      (todo "COMPLETED"
            ((org-agenda-overriding-header "Completed Projects")
             (org-agenda-files org-agenda-files)))
      (todo "CANC"
            ((org-agenda-overriding-header "Cancelled Projects")
             (org-agenda-files org-agenda-files)))))))

(setq org-refile-targets
      '(("Archive.org" :maxlevel . 1)))

;; Save Org buffers after refiling!
(advice-add 'org-refile :after 'org-save-all-org-buffers)

(use-package hydra)

(defhydra hydra-text-scale (:timeout 4)
  "scale text"
  ("j" text-scale-increase "in")
  ("k" text-scale-decrease "out")
  ("f" nil "finished" :exit t))

(rune/leader-keys
  "ts" '(hydra-text-scale/body :which-key "scale text"))

(rune/leader-keys
      "f" '(:ignore t :which-key "Files")
      "ff" '(counsel-find-file :which-key "Dir")
      "<" '(counsel-switch-buffer :which-key "Buffer")
      "m" '(:ignore t :which-key "Org")
      "me" '(org-export-dispatch :which-key "Org-Export")
      "mt" '(org-babel-tangle :which-key "babel-tangel")
      "tt" '(counsel-load-theme :which-key "themes"))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))



(use-package counsel
  :bind(("M-x" . counsel-M-x)
        ("C-x b" . counsel-switch-buffer)
        ("C-x C-f" . counsel-find-file)
        :map minibuffer-local-map
        ("C-r" . 'counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil)) ;; Don't start search ^

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))
