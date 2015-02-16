;; autoload の設定
;; (XEmacs の package としてインストールした場合は必要ありません)
(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)

;; アイコンを置くディレクトリ。
(setq wl-icon-directory "~/.emacs.d/elpa/wanderlust-20150127.2331/icons")

;; メールを送信するSMTPサーバ。初期値は'nil'。
(setq wl-smtp-posting-server (getenv "smtp_host"))
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

