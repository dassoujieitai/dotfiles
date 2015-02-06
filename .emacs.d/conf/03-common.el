;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacsテクニックバイブル
;; Chapter 02 初期装備に必要な知識
;; P59 COLUMN おすすめ設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 現在行に色を付ける。tは色をつける、0は色をつけない。
(global-hl-line-mode 0)
;; 色
(set-face-background 'hl-line "darkblue")
(set-face-foreground 'hl-line "white")

;; 履歴を次回Emacs起動時にも保存する。
(savehist-mode t)
;; ファイル内のカーソル位置を記録する。tは記録する、0は記録しない。
(setq-default save-place t)
(require 'saveplace)

;; 対応する括弧を表示させる。tは表示させる、0は表示しない。
(show-paren-mode t)

;; シェルに合わせるため、C-hは後退に割り当てる。
;; ヘルプは<f1>を使う。
(global-set-key (kbd "C-h") 'delete-backward-char)

;; モードラインに時計を表示する。
; (display-time)

;; 行番号・桁番号を表示する。tは表示する、0は表示しない。
; (line-number-mode t)
; (column-number-mode t)

;; リージョンに色を付ける。tは色を付ける、0は色を付けない。
;; (transient-mark-mode t)

;; GCを減らして軽くする(デフォルトの10倍)。
;; 現代のマシンではもっと大きくしても良い。
(setq gc-cons-threshold (* 10 gc-cons-threshold))

;; ログの記録行数を増やす。
(setq message-log-max 10000)

;; ミニバッファを再帰的に呼び出せるようにする。tは呼び出せる、0は呼び出せない。
(setq enable-recursive-minibuffers t)

;; ダイアログボックスを使わないようにする。tは使う、0は使わない。
(setq use-dialog-box 0)
(defalias 'message-box 'message)

;; 履歴をたくさん保存する。
(setq history-length 1000)

;; キーストロークをエコーエリアに早く表示する。
(setq echo-keystrokes 0.1)

;; 大きいファイルを開こうとしたときに警告を発生させる。
;; デフォルトは10MBなので100MBに拡張する。
(setq large-file-warning-threshold (* 100 1024 1024))

;; ミニバッファで入力を取り消しても履歴に残す。
;; 誤って取り消して入力が失われるのを防ぐため。
(defadvice abort-recursive-edit
    (before minibuffer-save activate)
  (when (eq (selected-window) (active-minibuffer-window))
    (add-to-history minibuffer-history-variable (minibuffer-contents))))

;; yesと入力するのは面倒なのでyで十分。
; (defalias 'yes-or-no-p 'y-or-n-p)

;; ツールバーとスクロールバーを消す。
; (tool-bar-mode -1)
; (scroll-bar-mode -1)
