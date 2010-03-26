;; CUSTOM SETTINGS OF EMACS VARIABLES BELOW

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(flyspell-use-meta-tab nil)
 '(hscroll-margin 1)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(js-enabled-frameworks (quote (javascript)))
 '(js-indent-level 2)
 '(js-js-switch-tabs nil)
 '(js2-auto-indent-p t)
 '(js2-bounce-indent-p nil)
 '(mouse-wheel-scroll-amount (quote (1 ((shift) . 1) ((control)))))
 '(rails-ws:default-server-type "webrick")
 '(safe-local-variable-values (quote ((require-final-newline))))
 '(scroll-bar-mode nil)
 '(tab-width 4)
 '(tabbar-background-color "black")
 '(tabbar-mode t nil (tabbar))
 '(tabbar-scroll-left-button (quote ((" <") " =")))
 '(tabbar-scroll-right-button (quote ((" >") " =")))
 '(tabbar-separator (quote ("  |  ")))
 '(tabbar-use-images nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#232323" :foreground "#E6E1DC" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "unknown" :family "Inconsolata"))))
 '(tabbar-button ((t (:background "black" :foreground "lightgreen"))))
 '(tabbar-default ((((class color grayscale) (background dark)) (:inherit variable-pitch :background "black" :height 0.8))))
 '(tabbar-highlight ((t (:foreground "lightgreen"))))
 '(tabbar-selected ((t (:inherit tabbar-default :foreground "green"))))
 '(tabbar-separator ((t (:inherit tabbar-default :foreground "gray"))))
 '(tabbar-unselected ((t (:inherit tabbar-default)))))
