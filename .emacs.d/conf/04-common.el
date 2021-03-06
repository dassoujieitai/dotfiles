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
;; (global-set-key (kbd "C-h") 'delete-backward-char)

;; モードラインの時計表示。tは表示する。0は表示しない。
(display-time-mode t)

;; 曜日・月・日を表示。
(setq display-time-day-and-date t)

;; 24時間表示。
(setq display-time-24hr-format t)

;; モードラインの日時表記を"月/日(曜日)時:分"にする。
(setq display-time-string-forms
      '((format "%s/%s/%s(%s)%s:%s"
                year month day dayname
                24-hours minutes)))

;; 行番号・桁番号を表示する。tは表示する、0は表示しない。
(line-number-mode t)
(column-number-mode t)

;; リージョンに色を付ける。tは色を付ける、0は色を付けない。
(transient-mark-mode t)

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
(defalias 'yes-or-no-p 'y-or-n-p)

;; ツールバーの表示。tは表示する。0は表示しない。
(tool-bar-mode 0)

;; スクロールバーの表示。tは表示する。0は表示しない。
(scroll-bar-mode 0)

;; font-lock
(global-font-lock-mode t)

;; タブを使わない。tはタブを使う馬鹿設定。nilはタブを使わない環境に厳しい設定。
(setq-default indent-tabs-mode nil)

;; 行末の空白をハイライト表示する。tは表示する。nilは表示しない。
(setq-default show-trailing-whitespace t)

;; タブをハイライト表示する。
(add-hook 'font-lock-mode-hook
          (lambda ()
            (font-lock-add-keywords
             nil
             '(("\t" 0 'trailing-whitespace prepend)))))

;; 自動インデント(electric-indent-mode)を無効にする。
(electric-indent-mode -1)

;; RETにnewline-and-indentではなく、newlineoを設定する。
(global-set-key (kbd "RET") 'newline)

;; font-lock-modeをtoggleさせる。C-c f l m。
(global-set-key (kbd "C-c flm") 'font-lock-mode)

;; auto-fill-modeをtoggleさせる。C-c a f m。
(global-set-key (kbd "C-c afm") 'auto-fill-mode)

;; 変数window-system
;;     値 w32 または pc : Windowsの場合
;;     値 ns            : Macの場合
;;     値 x             : Linuxの場合
;;     値 nil           : ターミナルの場合
(when window-system
  ;; tool-barを表示するか否か。tは表示する。0は表示しない。
  (tool-bar-mode 0)
  ;; scroll-barを表示するか否か。tは表示する。0は表示しない。
  (scroll-bar-mode 0)
  ;; menu-barを表示するか否か。tは表示する。0は表示しない。
  (menu-bar-mode 0))

;; 行の折り返し表示を変更する。
(global-set-key (kbd "C-c l") 'toggle-truncate-lines)

;; ファイルサイズの表示。tは表示する。0は表示しない。
(size-indication-mode 0)

;; バッテリー残量の表示。tは表示する。0は表示しない。
(display-battery-mode 0)
