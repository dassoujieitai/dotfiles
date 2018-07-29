;; helmの設定。
; (when (require 'helm-config nil t)
;  (helm-mode t))

(require 'helm-config)

;; helm-descbindsをインストール。
;; package-install RET helm-descbinds RET

(helm-descbinds-mode)

;; C-h b キーバインド一覧表示。helm-descbinds-modeにより、Helmインタ
;;       フェースで表示される。

