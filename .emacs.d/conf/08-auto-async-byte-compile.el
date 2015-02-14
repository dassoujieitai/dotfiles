;; auto-async-byte-compile.elの設定。

;; インストール方法
;;
;;     M-x install-elisp-from-emacswiki auto-async-byte-compile.el
;;

(require 'auto-async-byte-compile)

;; 自動コンパイルを無効にするファイル名の正規表現。
(setq auto-async-byte-compile-exclude-files-regexp "/junk/")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
(setq eldoc-idle-delay 0.2) ; すぐに表示したい。
(setq eldoc-minor-mode-string "") ; モードラインにElDocと表示しない。

;; 釣り合いのとれる括弧をハイライトする。
(show-paren-mode 1)

;; 改行と同時にインデントを行う。
(global-set-key (kbd "C-m") 'newline-and-indent)

;; find-functionをキー割り当てする。
(find-function-setup-keys)

