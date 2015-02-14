;; Ubuntuで-nwオプションを付けずにEmacsを起動したとき用の設定ファイル。

(when (and (eq system-type 'gnu/linux) (eq window-system 'x))
  ;; asciiフォントをIPAゴシックに
  (set-face-attribute 'default nil
		      :family "IPAゴシック"
		      :height 106)
  ;; 日本語フォントをIPAゴシックに
  (set-fontset-font
   nil 'japanese-jisx0208
   (font-spec :family "IPAゴシック")))
