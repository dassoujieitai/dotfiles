;; flycheckの設定。

;; flycheckのインストール。
;; M-x package-install RET flycheck RET

(add-hook 'after-init-hook #'global-flycheck-mode)

;; flycheck-pos-tipのインストール。
;; M-x package-install RET flycheck-pos-tip RET

;; flycheck使用時にエラーがツールチップ表示される。
(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))
