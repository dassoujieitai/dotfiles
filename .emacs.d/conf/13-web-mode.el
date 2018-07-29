;; web-modeの設定。

;; web-modeのインストール。
;; M-x package-install RET web-mode RET

(when (require 'web-mode nil t)
  ;; 自動的にweb-modeを起動したい拡張子を追加する。
  (add-to-list 'auto-mode-alist '("\\.html\\'"      . web-mode))
  (add-to-list 'auto-mode-alist '("\\.css\\'"       . web-mode))
  (add-to-list 'auto-mode-alist '("\\.js\\'"        . web-mode))
  (add-to-list 'auto-mode-alist '("\\.jsx\\'"       . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.ctp\\'"       . web-mode))
  (add-to-list 'auto-mode-alist '("\\.jsp\\'"       . web-mode))
  (add-to-list 'auto-mode-alist '("\\.ac[cp]x\\'"   . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'"       . web-mode))
  ;;; web-modeのインデント設定用フック
  (defun web-mode-hook ()
    "Hooks for Web mode."
    (setq web-mode-markup-indent-offset 2) ; HTMLのインデント。
    (setq web-mode-css-indent-offset 2)    ; CSSのインデント。
    (setq web-mode-code-indent-offset 2)   ; JS、PHP、Rubyなどのインデント。
    (setq web-mode-comment-style 2)        ; web-mode内のコメントのインデント。
    (setq web-mode-style-padding 1)        ; <style>内のインデント開始レベル。
    (setq web-mode-script-padding 1)       ; <script>内のインデント開始レベル。
    )
  (add-hook 'web-mode-hook 'web-mode-hook)
)
