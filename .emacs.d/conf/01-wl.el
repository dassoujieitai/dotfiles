;; autoload の設定
;; (XEmacs の package としてインストールした場合は必要ありません)
(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)

;; アイコンを置くディレクトリ。
(defvar wl-icon-directory "~/.emacs.d/elpa/wanderlust-20150127.2331/icons")

;; メールを送信するSMTPサーバ。初期値は'nil'。
(defvar wl-smtp-posting-server (getenv "smtp_host"))
;(setq wl-smtp-posting-server "smtp.jcom.home.ne.jp")

;; ニュース投稿用の NNTP サーバ。 初期設定は 'nil'。
; (setq wl-nntp-posting-server "your.nntp.example.com")

;; C-x m (compose-mail)によってWanderlustのドラフトモードを起動する。
;; mail-user-agentの定義が可能なEmacsである場合に有効。
(autoload 'wl-user-agent-compose "wl-draft" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'wl-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'wl-user-agent
      'wl-user-agent-compose
      'wl-draft-send
      'wl-draft-kill
      'mail-send-hook))

;; Infoの追加。
(setq Info-default-directory-list
      (append Info-default-directory-list
	      (list
       (expand-file-name
	"~/.emacs.d/public_repos/wanderlust/doc/info"))))

;;
(defvar wl-message-truncate-lines t)

;; この値よりサマリの交信数が多い場合。一部分だけ更新するか確認する。
;; 初期設定は500。
(defvar elmo-folder-update-threshold 100000)

;; Non-nilの値を設定すると、elmo-folder-update-thresholdによる更新を行
;; うか質問する。
;; nilの値だと質問しない。
(defvar elmo-folder-update-confirm nil)

;; どうにか500だか5000だかの壁を超える。
(defvar elmo-message-fetch-threshold 100000)
(defvar elmo-message-fetch-confirm 100000)
