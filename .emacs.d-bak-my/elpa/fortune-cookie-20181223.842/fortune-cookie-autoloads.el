;;; fortune-cookie-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "fortune-cookie" "fortune-cookie.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from fortune-cookie.el

(autoload 'fortune-cookie "fortune-cookie" "\
Get a fortune cookie (maybe with cowsay)." t nil)

(autoload 'fortune-cookie-comment "fortune-cookie" "\
Comment ARG with PREFIX.

ARG is the input string.
PREFIX is prepended to each line of ARG.

\(fn ARG PREFIX)" t nil)

(defvar fortune-cookie-mode nil "\
Non-nil if Fortune-Cookie mode is enabled.
See the `fortune-cookie-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `fortune-cookie-mode'.")

(custom-autoload 'fortune-cookie-mode "fortune-cookie" nil)

(autoload 'fortune-cookie-mode "fortune-cookie" "\
Set `initial-scratch-message' to a commented fortune cookie.

If called interactively, enable Fortune-Cookie mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "fortune-cookie" '("fortune-co")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; fortune-cookie-autoloads.el ends here