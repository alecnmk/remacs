; MELPA packaging
(require 'package)
(add-to-list 'package-archives
 '("melpa" . "http://melpa.milkbox.net/packages/") t)

; ELPA packaging
; (load "package")
(package-initialize)

; (desktop-save-mode 1)

; (ns-toggle-toolbar)

; setting up projectile
(projectile-global-mode)

(setq create-lockfiles nil)

(add-to-list 'load-path "~/.emacs.d/plugins/maxframe")
(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)

; indent-region key rebind
(global-set-key (kbd "C-M-/") 'indent-region)

; delete key fix
(global-set-key [kp-delete] 'delete-char) ; in Carbon

; disabling menu-bar-mode
(menu-bar-mode -1)

; ido
(require 'ido)
(ido-mode t)

(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)
; tune GC
(setq gc-cons-threshold 20000000)

(require 'rinari)

; turning on rspec snippets
(eval-after-load 'rspec-mode
  '(rspec-install-snippets))

; move line/region up/down
(load-file "~/.emacs.d/plugins/movelineregion/movelineregion.el")

; rabl
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rabl$" . ruby-mode))

; haml & sass
(add-to-list 'auto-mode-alist '("\\.scss$" . sass-mode))
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))

; nxhtml mode
(add-to-list 'load-path
             "~/.emacs.d/plugins/nxhtml")
; (load "autostart.el")

; textmate.el (autobrackets behavior)
(load-file "~/.emacs.d/plugins/textmate.el/textmate.el")
(require 'textmate-mode)
(defun textmate-mode-enable-hook ()
(textmate-mode t))
(add-hook 'feature-mode-hook 'textmate-mode-enable-hook)
(add-hook 'ruby-mode-hook 'textmate-mode-enable-hook)
(add-hook 'emacs-lisp-mode-hook 'textmate-mode-enable-hook)
(add-hook 'clojure-mode-hook 'textmate-mode-enable-hook)

; swap buffers in window (by ChrisWebber)
(setq swapping-buffer nil)
 (setq swapping-window nil)
 (defun swap-buffers-in-windows ()
   "Swap buffers between two windows"
   (interactive)
   (if (and swapping-window
            swapping-buffer)
       (let ((this-buffer (current-buffer))
             (this-window (selected-window)))
         (if (and (window-live-p swapping-window)
                  (buffer-live-p swapping-buffer))
             (progn (switch-to-buffer swapping-buffer)
                    (select-window swapping-window)
                    (switch-to-buffer this-buffer)
                    (select-window this-window)
                    (message "Swapped buffers."))
           (message "Old buffer/window killed.  Aborting."))
         (setq swapping-buffer nil)
         (setq swapping-window nil))
     (progn
       (setq swapping-buffer (current-buffer))
       (setq swapping-window (selected-window))
       (message "Buffer and window marked for swapping."))))
 (global-set-key (kbd "C-c s") 'swap-buffers-in-windows)

; deleting trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq auto-mode-alist
   (cons '("\\.text" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist
   (cons '("\\.md" . markdown-mode) auto-mode-alist))

; git-emacs
(add-to-list 'load-path "~/.emacs.d/plugins/git-emacs")
(require 'git-emacs-autoloads)

; yaml-mode
;; (add-to-list 'load-path "~/.emacs.d/plugins/yaml-mode")
;; (require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

; applying color heme
(add-to-list 'load-path "~/.emacs.d/plugins/color-theme-6.6.0")
(require 'color-theme)
(load-file "~/.emacs.d/themes/color-theme-railscasts.el")
(load-file "~/.emacs.d/themes/twilight/color-theme-twilight.el")
(color-theme-solarized-dark)

; disabling tool bar
(tool-bar-mode)
; disabling all scroll bars
(scroll-bar-mode)

; loading Feature mode cucumber.el
(add-to-list 'load-path "~/.emacs.d/plugins/cucumber.el")
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(rails-ws:default-server-type "webrick"))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

; defining line duplication hotkey
(defun duplicate-line ()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (newline)
  (yank)
)
(global-set-key (kbd "C-c d") 'duplicate-line)

;; auto-complete
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/auto-complete/ac-dict")
(ac-config-default)

(setq custom-file "~/.emacs.d/customizations.el")
(load custom-file)

; fullscreen toggle
(global-set-key (kbd "C-M-`") 'toggle-frame-fullscreen)
