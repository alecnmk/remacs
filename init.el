;(desktop-save-mode 1)

(ns-toggle-toolbar)

(setq create-lockfiles nil)

;; (add-to-list 'load-path "~/.emacs.d/plugins/maxframe")
;; (require 'maxframe)
;; (add-hook 'window-setup-hook 'maximize-frame t)

; indent-region key rebind
(global-set-key (kbd "C-M-/") 'indent-region)

; delete key fix
(global-set-key [kp-delete] 'delete-char) ; in Carbon

; ELPA packagin
(add-to-list 'load-path
             "~/.emacs.d/plugins/package.el")
(load "package")
(package-initialize)

; disabling menu-bar-mode
(menu-bar-mode -1)

; slim-mode
(add-to-list 'load-path "~/.emacs.d/plugins/emacs-slim")
(require 'slim-mode)

; tabbar mode
(add-to-list 'load-path "~/.emacs.d/plugins/tabbar")
(require 'tabbar)

; jump-mode
(add-to-list 'load-path "~/.emacs.d/plugins/jump")

; deft mode
(add-to-list 'load-path "~/.emacs.d/plugins/deft")

(when (require 'deft nil 'noerror)
   (setq
      deft-extension "org"
      deft-directory "~/.deft/"
      deft-text-mode 'org-mode)
   (global-set-key (kbd "<f9>") 'deft))

; actionscript mode
(add-to-list 'load-path "~/.emacs.d/plugins/actionscript")
(require 'actionscript-mode)
(add-to-list 'auto-mode-alist '("\\.as$" . actionscript-mode))
(add-to-list 'auto-mode-alist '("\\.mxml$" . xml-mode))

; coffeescript mode
(add-to-list 'load-path "~/.emacs.d/plugins/coffee-mode")
(require 'coffee-mode)
; /coffeescript mode

; move line/region up/down
(load-file "~/.emacs.d/plugins/movelineregion/movelineregion.el")

; rabl
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
 (global-set-key (kbd "C-c p") 'swap-buffers-in-windows)

; deleting trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

; adding yasnippet
(add-to-list 'load-path
             "~/.emacs.d/plugins/yasnippet-0.6.1c")
(require 'yasnippet)
(setq yas/root-directory "~/.emacs.d/snippets")
(yas/initialize)
(yas/load-directory yas/root-directory)

; markdown mode hook
(add-to-list 'load-path "~/.emacs.d/plugins/markdown-mode")
(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)
(setq auto-mode-alist
   (cons '("\\.text" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist
   (cons '("\\.md" . markdown-mode) auto-mode-alist))

; mo-git-blame
(add-to-list 'load-path "~/.emacs.d/plugins/mo-git-blame")
(autoload 'mo-git-blame-file "mo-git-blame" nil t)
(autoload 'mo-git-blame-current "mo-git-blame" nil t)
(global-set-key (kbd "C-c g c") 'mo-git-blame-current)
(global-set-key (kbd "C-c g f") 'mo-git-blame-file)

; ido
(require 'ido)
(ido-mode t)

; git-emacs
(add-to-list 'load-path "~/.emacs.d/plugins/git-emacs")
(require 'git-emacs-autoloads)

; yaml-mode
(add-to-list 'load-path "~/.emacs.d/plugins/yaml-mode")
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

; emacs list expectations (rspec is dependent on it)
(add-to-list 'load-path "~/.emacs.d/plugins")
(require 'el-expectations)
; mode-compile (required by rspec-mode)
(add-to-list 'load-path "~/.emacs.d/plugins/mode-compile")
(require 'mode-compile)
(require 'ansi-color)

; rspec-emacs
(add-to-list 'load-path "~/.emacs.d/plugins/rspec-mode")
(require 'rspec-mode)

; applying color heme
(add-to-list 'load-path "~/.emacs.d/plugins/color-theme-6.6.0")
(require 'color-theme)
(load-file "~/.emacs.d/themes/color-theme-railscasts.el")
(load-file "~/.emacs.d/themes/twilight/color-theme-twilight.el")
(color-theme-twilight)

; disabling tool bar
(tool-bar-mode)
; disabling all scroll bars
(scroll-bar-mode)

; loading Feature mode cucumber.el
(add-to-list 'load-path "~/.emacs.d/plugins/cucumber.el")
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;; Rinari
(add-to-list 'load-path "~/.emacs.d/plugins/rinari")
(require 'rinari)

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
(global-set-key (kbd "C-M-`") 'ns-toggle-fullscreen)
