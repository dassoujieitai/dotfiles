;; Macだけに読み込ませる内容。
(when (eq system-type 'darwin)
  ;; MacのEmacsでファイル名を正しく扱うための設定。
  (require 'ucs-normalize)
  (setq file-name-coding-system 'utf-8-hfs)
  (setq locale-coding-system 'utf-8-hfs)

  ;; diredで/usr/local/opt/coreutils/libexec/gnubin/lsを使わせる。
  (add-to-list 'exec-path "/usr/local/opt/coreutils/libexec/gnubin")

  ;; diredを正常に動作させるための設定。
  (require 'ls-lisp)
  (setq ls-lisp-use-insert-directory-program 0))

;; あどけない話 2014年6月25日の記事から引用。
;; Emacsのフォント設定。

;; 以下はフレームの設定
(defvar my-frame-parameters
  '((height . 25)
    (width . 80)
    (top . 0)
    (left . 0)
    (foreground-color . "white")
    (background-color . "black")
    (cursor-color . "white")
    (mouse-color . "white")
    (tool-bar-lines . nil)))

(when (memq window-system '(x mac ns))
  (setq frame-title-format '(multiple-frames "%b" ("" invocation-name)))
  (setq default-frame-alist my-frame-parameters))

;; 以下が Mac 用のフォント設定
(when (memq window-system '(mac ns))
  (global-set-key [s-mouse-1] 'browse-url-at-mouse)
  (let* ((size 12)
         (jpfont "Hiragino Maru Gothic ProN")
         (asciifont "Monaco")
         (h (* size 10)))
    (set-face-attribute 'default nil :family asciifont :height h)
    (set-fontset-font t 'katakana-jisx0201 jpfont)
    (set-fontset-font t 'japanese-jisx0208 jpfont)
    (set-fontset-font t 'japanese-jisx0212 jpfont)
    (set-fontset-font t 'japanese-jisx0213-1 jpfont)
    (set-fontset-font t 'japanese-jisx0213-2 jpfont)
    (set-fontset-font t '(#x0080 . #x024F) asciifont))
  (setq face-font-rescale-alist
        '(("^-apple-hiragino.*" . 1.2)
          (".*-Hiragino Maru Gothic ProN-.*" . 1.2)
          (".*osaka-bold.*" . 1.2)
          (".*osaka-medium.*" . 1.2)
          (".*courier-bold-.*-mac-roman" . 1.0)
          (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
          (".*monaco-bold-.*-mac-roman" . 0.9)
          ("-cdac$" . 1.3)))
  ;; C-x 5 2 で新しいフレームを作ったときに同じフォントを使う
  (setq frame-inherited-parameters '(font tool-bar-lines)))

;; 以下の設定はお好みで
(setq resize-mini-windows nil)
(setq mouse-drag-copy-region t)

