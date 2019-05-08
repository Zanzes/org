					; Setup package
(require 'package)

					; No startup package
(setq package-enable-at-startup nil)

					; Set package sources
(setq package-archives '(("marmalade" . "http://marmalade-repo.org/packages/")
			 ("ELPA"  . "http://tromey.com/elpa/")
			 ("gnu"   . "http://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")))

					; Initialize package
(package-initialize)

					; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

					; Emacs variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (manoj-dark)))
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(org-hide-block-startup t)
 '(package-selected-packages
   (quote
    (format-all org htmlize which-key volume use-package try threes switch-window swiper sudo-ext sudo-edit spacemacs-theme spaceline-all-the-icons smex smartparens slime rainbow-mode rainbow-delimiters python pulseaudio-control pretty-mode popup-kill-ring paren-completer paredit-menu org-bullets mark-multiple jedi ido-vertical-mode hungry-delete highlight-parentheses golden-ratio gited exwm expand-region dmenu dashboard csv-mode company-statistics company-math company-ebdb beacon ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-ellipsis ((t (:inherit nil :foreground "dark magenta" :underline nil))))
 '(org-level-1 ((t (:foreground "LightSkyBlue" :height 1.2))))
 '(org-level-2 ((t (:foreground "LightGoldenrod" :height 1.1)))))

					; Load custom config
(org-babel-load-file (expand-file-name "~/.emacs.d/lzconf.org"))
