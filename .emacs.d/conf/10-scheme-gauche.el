;; Gaucheのデフォルトコーディングに合わせる。
(modify-coding-system-alist 'process "gosh" '(utf-8 . utf-8))

;; goshインタプリタの設定。
(setq scheme-program-name "gosh -i")

;; schemeモードとrun-schemeモードにcmuscheme.elを使用する。
(autoload 'scheme-mode "cmuscheme" "Major mode for Scheme." t)
(autoload 'run-scheme "cmuscheme" "Run an inferior Scheme process." t)

;; ウィンドウを2つに分ける。一方でgoshインタプリタを実行するコマンドを定義する。
(defun scheme-other-window ()
  "Run scheme on other window"
  (interactive)
  (switch-to-buffer-other-window
   (get-buffer-create "*scheme*"))
  (run-scheme scheme-program-name))

;; scheme-other-windowoをCtrl-c sで呼び出す。
(define-key global-map (kbd "C-c s") 'scheme-other-window)

;; インデントの定義。

