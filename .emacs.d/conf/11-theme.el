;; load-themeの設定。

;; テーマの設定は以下のように行う。
;; M-x load-theme RET
;; ミニバッファに「Load custom theme:」と表示されるので、テーマ名を入力する。
;; TABキーによる補完も可能。

;; テーマ「zenburn-theme」は、以下のコマンドでインストールする。
;; M-x package-install RET zenburn-theme RET

;; テーマを解除したい場合は、以下のコマンドを実行する。
;; M-x disable-theme RET テーマ名 RET

;; テーマは以下のサイトで大量に公開されている。
;; https://emacsthemes.com/index/2.html

;; zenburn-themeを使用する。
(load-theme 'zenburn t)
