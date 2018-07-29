;; lispxmp.elの設定。

;; インストール
;;
;;     M-x install-elisp-from-emacswiki lispxmp.el
;;

;; 式の評価結果を注釈するための設定。
(require 'lispxmp)

;; emacs-lisp-modeでC-c C-dを押すと注釈される。
(define-key emacs-lisp-mode-map (kbd "C-c C-d") 'lispxmp)

