
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
 
(add-to-list 'package-archives
'("melpa" . "http://melpa.org/packages/") t)
 
(package-initialize)
;; If there are no archived package contents, refresh them
(when (not package-archive-contents)
  (package-refresh-contents))
(unless (package-installed-p 'use-package)
(package-refresh-contents)
(package-install 'use-package))

;; Installs packages
;;
;; myPackages contains a list of package names
(defvar myPackages
  '(elpy                            ;; Emacs Lisp Python Environment
    )
  )


;; Scans the list in myPackages
;; If the package listed is not already installed, install it
(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))


;;Zenburn theme
(use-package zenburn-theme
 :ensure t
  :config
  (load-theme 'zenburn t))

;;Enable line numbers
(global-linum-mode t)

(elpy-enable)

;; Enable Evil
(require 'evil)
(evil-mode 1)

;;Add support for markdown
(use-package markdown-mode
  :ensure t)


     ;; -----------------------------------------------------------------------------
     ;; on the fly syntax check feedback
     (use-package flycheck
       :ensure)

     ;; -----------------------------------------------------------------------------
     ;; use `black' for formatting, `elpy' recognizes it, and enables it
     ;; automatically on file-save
     (use-package blacken
       :ensure
       :config
       (setq blacken-line-length 80))

     ;; -----------------------------------------------------------------------------
     ;; completion using jedi
     (use-package jedi
       :ensure
       :config
       ;; ---------------------------------------------------------------------------
       ;; automatically start completion after inserting a '.' character
       (setq jedi:complete-on-dot t))

     ;; -----------------------------------------------------------------------------
     ;; the package that ties all other packages together
     (use-package elpy
       :ensure

       :init
       (elpy-enable)

       :bind
       (:map elpy-mode-map
             ("C-M-n" . elpy-nav-forward-block)
             ("C-M-p" . elpy-nav-backward-block))

       :hook ((elpy-mode-hook . flycheck-mode)
              (elpy-mode-hook . blacken-mode)
              (elpy-mode-hook . jedi:setup))

       :config

       ;; ---------------------------------------------------------------------------
       ;; remove flymake
       (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))

       ;; ---------------------------------------------------------------------------
       ;; don't echo python's shell output in the echo area after input
       ;; has been sent to the shell
       (setq elpy-shell-echo-output nil)

       ;; ---------------------------------------------------------------------------
       ;; setup python interpreter for the rpc backend
       (setq elpy-rpc-python-command "python3")
       (setq elpy-rpc-timeout 2)

       ;; ---------------------------------------------------------------------------
       ;; the python interpreter
       (setq python-shell-interpreter "ipython3")
       (setq python-shell-interpreter-args "--simple-prompt -i"))




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#93E0E3")
 '(cua-normal-cursor-color "#DCDCCC")
 '(cua-overwrite-cursor-color "#F0DFAF")
 '(cua-read-only-cursor-color "#7F9F7F")
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes
   (quote
    ("e6df46d5085fde0ad56a46ef69ebb388193080cc9819e2d6024c9c6e27388ba9" "59b1d6fa127ccd7de28dc059422d675b91e82aebd1952e453c5b9687d68b693c" "e3dd6693e140e87e8926b1f13e82e89d3ee9afd3b387a6b0d0a51ca8471f910b" default)))
 '(highlight-changes-colors (quote ("#DC8CC3" "#bbb0cb")))
 '(highlight-symbol-colors
   (quote
    ("#681063eb5999" "#54db645164d1" "#6098535f5323" "#5c2959a95fa1" "#4edf55f24ea4" "#64de597a525e" "#530160d26158")))
 '(highlight-symbol-foreground-color "#FFFFEF")
 '(highlight-tail-colors
   (quote
    (("#4F4F4F" . 0)
     ("#488249" . 20)
     ("#5dacaf" . 30)
     ("#57a2a4" . 50)
     ("#b6a576" . 60)
     ("#ac7b5a" . 70)
     ("#aa5790" . 85)
     ("#4F4F4F" . 100))))
 '(hl-bg-colors
   (quote
    ("#b6a576" "#ac7b5a" "#9f5c5c" "#aa5790" "#85749c" "#57a2a4" "#5dacaf" "#488249")))
 '(hl-fg-colors
   (quote
    ("#3F3F3F" "#3F3F3F" "#3F3F3F" "#3F3F3F" "#3F3F3F" "#3F3F3F" "#3F3F3F" "#3F3F3F")))
 '(hl-paren-colors (quote ("#93E0E3" "#F0DFAF" "#8CD0D3" "#bbb0cb" "#7F9F7F")))
 '(lsp-ui-doc-border "#FFFFEF")
 '(package-selected-packages
   (quote
    (magit yasnippet-snippets zenburn-theme use-package)))
 '(pos-tip-background-color "#4F4F4F")
 '(pos-tip-foreground-color "#FFFFEF")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#7F9F7F" "#4F4F4F" 0.2))
 '(term-default-bg-color "#3F3F3F")
 '(term-default-fg-color "#DCDCCC")
 '(vc-annotate-background-mode nil)
 '(weechat-color-list
   (quote
    (unspecified "#3F3F3F" "#4F4F4F" "#9f5c5c" "#CC9393" "#488249" "#7F9F7F" "#b6a576" "#F0DFAF" "#57a2a4" "#8CD0D3" "#aa5790" "#DC8CC3" "#5dacaf" "#93E0E3" "#DCDCCC" "#6F6F6F")))
 '(xterm-color-names
   ["#4F4F4F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#fffff6"])
 '(xterm-color-names-bright
   ["#3F3F3F" "#DFAF8F" "#878777" "#6F6F6F" "#DCDCCC" "#bbb0cb" "#FFFFEF" "#FFFFFD"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )




