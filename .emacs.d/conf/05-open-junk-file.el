;; 試行錯誤用ファイルを開くための設定。

;; インストール方法
;;
;;     M-x install-elisp-from-emacswiki open-junk-file.el
;;

(require 'open-junk-file)

;; C-x C-jで試行錯誤ファイルを開く。
(global-set-key (kbd "C-x C-j") 'open-junk-file)


