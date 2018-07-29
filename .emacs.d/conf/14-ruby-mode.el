;; ruby-modeの設定。

(setq ruby-indent-level 2               ; インデント幅を2に設定。
      ruby-deep-indent-paren-style nil  ; 改行時のインデントを調整する。
      ruby-indent-tabs-mode nil)        ; タブ文字の使用。tは使用。nilは不使用。

;; ruby-electric 括弧などを自動的に挿入してくれる。
;; M-x package-install RET ruby-electric RET

(add-hook 'ruby-mode-hook #'ruby-electric-mode)

;; inf-ruby irbをEmacsから利用できるようにする。
;; M-x package-install RET inf-ruby RET
;;
;;   C-c C-s inf-ruby             irbを起動する。
;;   C-c C-b ruby-send-block      ブロックをirbへ送る。
;;   C-c C-x ruby-send-definition メソッド定義をirbへ送る。
;;   C-c C-r ruby-send-region     リージョンをirbへ送る。
;;   C-c C-z ruby-switch-to-inf   *ruby*バッファへ移動する。
;;   C-c C-l ruby-load-file       ファイルを読み込んでirbへ送る。
