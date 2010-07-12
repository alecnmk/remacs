; emacs desktop mode
(desktop-save-mode 1)

; disabling menu-bar-mode
(menu-bar-mode -1)

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
(setq auto-mode-alist
   (cons '("\\.text" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist
   (cons '("\\.md" . markdown-mode) auto-mode-alist))

; gist.github
(set 'gist-view-gist 1)
(set 'github-user "alecnmk")
(set 'github-token "595bec32065e5e42eeb1813e5065951f")
(add-to-list 'load-path "~/.emacs.d/plugins/gist.el")
(require 'gist)

; ido
(require 'ido)
(ido-mode t)

; git-emacs
(add-to-list 'load-path "~/.emacs.d/plugins/git-emacs")
(require 'git-emacs-autoloads)

; action-script mode
(add-to-list 'load-path "~/.emacs.d/plugins/flex")
(require 'actionscript-mode)
(add-to-list 'auto-mode-alist '("\\.as\\'" . actionscript-mode))

; yaml-mode
(add-to-list 'load-path "~/.emacs.d/plugins/yaml-mode")
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

; vala-mode
(add-to-list 'load-path
	     "~/.emacs.d/plugins/vala-mode")
(autoload 'vala-mode "vala-mode" "Major mode for editing Vala code." t)
(add-to-list 'auto-mode-alist '("\\.vala$" . vala-mode))
(add-to-list 'auto-mode-alist '("\\.vapi$" . vala-mode))
(add-to-list 'file-coding-system-alist '("\\.vala$" . utf-8))
(add-to-list 'file-coding-system-alist '("\\.vapi$" . utf-8))

;; rsense
(setq rsense-home "/home/alex/projects/env/rsense")
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)
(add-hook 'ruby-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-rsense-method)
            (add-to-list 'ac-sources 'ac-source-rsense-constant)))
(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key (kbd "C-.") 'ac-complete-rsense)))

; haml&saas mode
(add-to-list 'load-path
	     "~/.emacs.d/plugins/haml-mode")
(require 'haml-mode)
(require 'sass-mode)

; ansi-color
(ansi-color-for-comint-mode-on)

; mode-compile (required by rspec-mode)
(add-to-list 'load-path "~/.emacs.d/plugins/mode-compile")
(require 'mode-compile)

; rspec-emacs
(add-to-list 'load-path "~/.emacs.d/plugins/rspec-mode")
(require 'rspec-mode)

; applying color heme
(require 'color-theme)
(load-file "~/.emacs.d/themes/color-theme-railscasts.el")
(color-theme-railscasts)

; disabling tool bar
(tool-bar-mode)
; disabling all scroll bars
(scroll-bar-mode)

; loading Feature mode cucumber.el
(add-to-list 'load-path "~/.emacs.d/plugins/cucumber.el")
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;; Rinari
(add-to-list 'load-path "~/.emacs.d/plugins/jump.el")
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
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/auto-complete//ac-dict")
(ac-config-default)

(setq custom-file "~/.emacs.d/customizations.el")
(load custom-file)
