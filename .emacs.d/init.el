;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

(when (< emacs-major-version 23)
  (defvar user-emacs-directory "~/.emacs.d/"))

(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
              (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

(add-to-load-path "elisp" "conf" "public_repos" "auto-install")

(setq custom-file (locate-user-emacs-file "custom.el"))

(unless (file-exists-p custom-file)
  (write-region "" nil custom-file))

(load custom-file)

(require 'init-loader)
(setq init-loader-show-log-after-init t)
(init-loader-load "~/.emacs.d/conf")
(init-loader-show-log)

;; 文字コードを指定する。
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)


; ;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
; 
; ;; Common Lispライブラリを利用する。
; (require 'cl)
; 
; ;; Emacsからの質問をy/nで回答する。
; (fset 'yes-or-no-p 'y-or-n-p)
; 
; ;; スタートアップメッセージの表示/非表示。tは非表示、0は表示。
; (setq inhibit-startup-screen t)
; 
; (when window-system
;   ;; tool-barの表示/非表示。tは表示、0は非表示。
;   (tool-bar-mode 0)
; 
;   ;; Scroll-barの表示/非表示。tは表示、0は非表示。
;   (scroll-bar-mode 0))
; 
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;; Emacs実践入門
; ;; 4.1 効率的な設定ファイルの作り方と管理方法
; ;; P61 ロードパスを追加する
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 
; (when (< emacs-major-version 23)
;   (defvar user-emacs-directory "~/.emacs.d/"))
; 
; ;; load-pathを追加する関数を定義。
; (defun add-to-load-path (&rest paths)
;   (let (path)
;     (dolist (path paths paths)
;       (let ((default-directory
;               (expand-file-name (concat user-emacs-directory path))))
;         (add-to-list 'load-path default-directory)
;         (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
;             (normal-top-level-add-subdirs-to-load-path))))))
; 
; ;; 引数のディレクトリとそのサブディレクトリをload-pathに追加。
; (add-to-load-path "elisp" "conf" "public_repos")
; 
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;; Emacs実践入門
; ;; 4.1 効率的な設定ファイルの作り方と管理方法
; ;; P63 init-loader.elを利用する
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 
; ;; init-loader
; ;; インストール方法
; ;;
; ;;     $ cd ~/.emacs.d/public_repos
; ;;     $ git clone https://github.com/emacs-jp/init-loader
; ;;
; 
; (require 'init-loader)
; (init-loader-load "~/.emacs.d/conf")
; 
; ;; init-loader.elで読み込む設定ファイルは、~/.emacs.d/conf/に置く。
; 
; ;; (1) 2けたの数字から始まる設定ファイルを数字の順番に読み込む。
; ;;         00-env.el、10-perl.el
; ;; (2) Meadowの場合、「meadow」から始まる名前の設定ファイルを読み込む。
; ;;         meadow-config.el
; ;; (3) CarbonEmacsの場合、「carbon-emacs」から始まる設定ファイルを読み込む。
; ;;     CarbonEmacsはEmacs 22までのEmacs.appのこと。
; ;;         carbon-emacs-config.el
; ;; (4) CocoaEmacsの場合、「cocoa-emacs」から始まる設定ファイルを読み込む。
; ;;     CocoaEmacsはEmacs 23以降のEmacs.appのこと。
; ;;         cocoa-emacs-config.el
; ;; (5) ターミナルの場合、「nw」から始まる設定ファイルを読み込む。
; ;;         nw-config.el
; 
; ;; init-loader.elは、設定ファイルにエラーが含まれている場合でも、ス
; ;; キップして次の設定ファイルの読み込みを行う。
; 
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;; Emacs実践入門
; ;; 4.1 効率的な設定ファイルの作り方と管理方法
; ;; P64 OSの違いによる分岐
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 
; ;; 変数system-typeの値
; ;;     Windowsの場合 windows-nt あるいは cygwin
; ;;     Macの場合     darwin
; ;;     Linuxの場合   gnu/linux
; 
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;; Emacs実践入門
; ;; 4.1 効率的な設定ファイルの作り方と管理方法
; ;; P65 CUIとGUIによる分岐
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 
; ;; 変数window-systemの値
; ;;     Windowsの場合   w32 あるいは pc
; ;;     Macの場合       ns
; ;;     Linuxの場合     x
; ;;     ターミナルの場合 nil
; 
; ;; CocoaEmacs以外はメニューバーを非表示。
; (unless (eq window-system 'ns)
;   ;; menu-barを非表示。
;   (menu-bar-mode 0))
; 
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;; Emacs実践入門
; ;; 4.1 効率的な設定ファイルの作り方と管理方法
; ;; P66 Emacsのバージョンによる分岐
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 
; ;; 変数emacs-version
; ;;     "24.4.1"
; ;; 変数emacs-major-version
; ;;     24
; 
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;; Emacs実践入門
; ;; 5.3 環境変数の設定
; ;; P85 文字コードを指定する
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 
; (set-language-environment "Japanese")
; (prefer-coding-system 'utf-8)
; 
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;; Emacs実践入門
; ;; 5.4 フレームに関する設定
; ;; P88 行番号/カラム番号を表示する
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 
; ;; カラム番号を表示。tならば表示、0ならば表示しない。
; (column-number-mode t)
; 
; ;; 行番号を表示させる。tならば表示、0ならば表示しない。
; (line-number-mode t)
; 
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;; Emacs実践入門
; ;; 5.4 フレームに関する設定
; ;; P89 ファイルサイズ、時計、バッテリー残量を表示する
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 
; ;; ファイルサイズを表示。tならば表示、0ならば表示しない。
; (size-indication-mode t)
; 
; ;; 時計を表示。曜日・月・日の表示。tは表示、0は表示しない。
; (setq display-time-day-and-date 0)
; 
; ;; 時計を表示。24時間表示。tは表示、0は表示しない。
; (defvar display-time-24hr-format 0)
; 
; ;; 時計を表示。tは表示、0は表示しない。
; (display-time-mode 0)
; 
; ;; バッテリー残量を表示。tは表示、0は表示しない。
; (display-battery-mode t)
; 
; ;; リージョン内の行数と文字数をモードラインに表示する(範囲指定時のみ)。
; (defun count-lines-and-chars ()
;   (if mark-active
;       (format "%d lines, %d chars "
;               (count-lines (region-beginning) (region-end))
;               (- (region-end) (region-beginning)))
;     ;; これだとエラーエリアがちらつく。
;     ;; (count-lines-region (region-beginning) (region-end))
;     ""))
; 
; (add-to-list 'default-mode-line-format
;              '(:eval (count-lines-and-chars)))
; 
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;; Emacs実践入門
; ;; 5.4 フレームに関する設定
; ;; P90 タイトルバーにファイルのフルパスを表示
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 
; ;; タイトルバーにファイルのフルパスを表示。
; (setq frame-title-format "%f")
; 
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;; Emacs実践入門
; ;; 5.4 フレームに関する設定
; ;; P90 ウィンドウの左に行番号を表示
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 
; ;; linum-mode
; ;;     常に行番号をウィンドウの左側に表示する。バッファローカルのコ
; ;;     マンド。
; ;;     tは行番号を左側に表示する。0は行番号を左側に表示しない。
; (linum-mode 0)
; 
; ;; global-linum-mode
; ;;     常に行番号をウィンドウの左側に表示する。すべのバッファが対象と
; ;;     なるコマンド。
; ;;     tは行番号を左側に表示する。0は行番号を左側に表示しない。
; (global-linum-mode 0)
; 
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;; Emacs実践入門
; ;; 5.5 インデントの設定
; ;; P92 タブ文字の表示幅
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 
; ;; Emacsでは、変数tab-widthの値を見てタブ文字の表示幅を決定している。
; ;; TABの表示幅を設定する。デフォルト値は8。
; ;(setq-default tab-width 8)
; (setq-default tab-width 4)
; 
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;; Emacs実践入門
; ;; 5.5 インデントの設定
; ;; P92 タブ文字の利用
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 
; ;; Emacsは標準ではタブ文字を使っている。
; ;; 変数indent-tabs-modeにnilを設定することで、タブ文字ではなく空白を用
; ;; いるようになる。
; ;; 変数indent-tabs-modeはバッファローカル変数である。すべてのバッファ
; ;; で有効にするにはset-defaultを使用する。
; ;; 変数indent-tabs-modeがtの場合、タブ文字を使う。
; ;; 変数indent-tabs-modeがnilの場合、空白を使う。
; (setq-default indent-tabs-mode nil)
; 
; ;; php-modeのみタブ文字を使用しない。
; (add-hook 'php-mode-hook
;           (lambda () (setq indent-tabs-mode nil)))
; 
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;; Emacs実践入門
; ;; 5.6 表示・装飾に関する設定
; ;; P96 表示テーマの設定
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 
; ;; color-theme
; ;; インストール方法
; ;;
; ;;     $ cd ~/.emacs.d/elisp
; ;;     $ wget "http://download.savannah.gnu.org/releases/color-theme/color-theme-6.6.0.tar.gz"
; ;;     $ tar xfz color-theme-6.6.0.tar.gz
; ;;
; 
; (when (require 'color-theme nil t)
;   ;; テーマを読み込むための設定。
;   (color-theme-initialize)
;   ;; 初期テーマをDark Laptopにする。
;   (color-theme-arjen))
; 
; ;; M-x color-theme-select RET
; ;;     - カラーテーマ選択画面が表示される。
; ;;     - iキーで、選択したカラーテーマを適用する。
; ;;     - qキーで、カラーテーマ選択画面を終了させる。
; 
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;; Emacs実践入門
; ;; 6.1 Elispをインストールしよう
; ;; P113 拡張機能のインストール
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;; Emacs24のパッケージ管理システムをproxy経由で使う
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 
; ;; ~/.emacs.d/init.elに、以下の設定を追加する。
; ;;
; ;;     (setq url-proxy-services
; ;;           '(("http"  . "プロキシサーバホスト名:ポート番号")
; ;;             ("https" . "プロキシサーバホスト名:ポート番号")))
; ;;
; ;; 認証の必要なProxyの場合、*scratch*などで事前に
; ;;
; ;;     (base64-encode-string "ユーザー名:パスワード")
; ;;
; ;; を実行して、ユーザ名、パスワードをBase64に変換した文字列を作成する。
; ;; その文字列を使って以下のように設定する。
; ;;
; ;;     (setq url-http-proxy-basic-auth-storage
; ;;           '(("proxyhostname:port" ("Proxy" . "base64string"))))
; ;;
; ;; あとは普通に、M-x package-list-packages でパッケージ一覧を表示できるよう
; ;; になる。
; 
; (setq url-http-proxy-basic-auth-storage
;       '(("proxy.intra.oki.co.jp:8080"
;            ("Proxy" . "YTExNDcxNzpubFhMdW9TNQ=="))))
;          ; ("Proxy" . "YTExNDcxNzp4TmNneDFCWA=="))))
;          ; ("Proxy" . "YTExNDcxNzptREVZdUg4eQ=="))))
;          ; ("Proxy" . "YTExNDcxNzpkTU82Qjh2aA=="))))
;          ; ("Proxy" . "YTExNDcxNzp4TmNneDZCWA=="))))
;          ; ("Proxy" . "YTExNDcxNzp4TmNneDVCWA=="))))
; 
; (setq url-proxy-services
;       '(("http"  . "proxy.intra.oki.co.jp:8080")
;         ("https" . "proxy.intra.oki.co.jp:8080")))
; 
; ;; auto-install
; ;; インストール方法
; ;;
; ;;     $ cd ~/.emacs.d/elisp
; ;;     $ wget http://www.emacswiki.org/emacs/download/auto-install.el
; ;;     $ emacs --batch -Q -f batch-byte-compile auto-install.el
; ;;
; 
; ;; auto-installの設定
; (when (require 'auto-install nil t)
;   (setq auto-install-directory "~/.emacs.d/elisp/")
;   (auto-install-update-emacswiki-package-name t)
;   ;; (setq url-proxy-services '(("http" . "localhost:8339")))
;   (auto-install-compatibility-setup))
; 
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;; Emacs実践入門
; ;; 6.1 Elispをインストールしよう
; ;; P116 Emacs24へpackage.elをインストールする
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 
; ;; package.elの設定
; (when (require 'package nil t)
;   (add-to-list 'package-archives
;                '("marmalade" . "http://marmalade-repo.org/packages/"))
;   (add-to-list 'package-archives
;                '("ELPA" . "http://tromey.com/elpa/"))
;   (add-to-list 'package-archives
;                '("melpa" . "http://melpa.milkbox.net/packages/"))
;   (add-to-list 'package-archives
;                '("e6h" . "http://www.e6h.org/packages/"))
;   (add-to-list 'package-archives
;                '("melpa-stable" .
;                  "http://melpa-stable.milkbox.net/packages/"))
;   ;; インストールしたパッケージにロードパスを通して読み込む。
;   (package-initialize))
; 
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;; exec-path-from-shell
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; (when (memq window-system '(mac ns))
;   (exec-path-from-shell-initialize))
; (put 'narrow-to-region 'disabled nil)
; 
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;; タブ、無駄なホワイトスペースを入力したくないときの設定
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 
; ;; 行末の空白をハイライト。tだとハイライト、0だとハイライトしない。
; (setq-default show-trailing-whitespace t)
; 
; ;; タブをハイライト。
; ;(add-hook 'font-lock-mode-hook
; ;          (lambda ()
; ;            (font-lock-add-keyboards
; ;             nil
; ;             '(("¥t" 0 'trailing-whitespace prepend)))))
; 
; ;; C-l (recenter-top-button)で真ん中に表示する。他にtopとbuttomがある。
; (setq recenter-positions '(middle))
; 
; (put 'set-goal-column 'disabled nil)
; 
; (put 'narrow-to-region 'disabled nil)
; 
; ;; 折り返しトグルコマンド。一行がウィンドウの横幅より大きいときに、折
; ;; り返して表示するか、折り返さずに画面の外にはみ出すか。
; (define-key global-map (kbd "C-c l") 'toggle-truncate-lines)
; 
; (put 'upcase-region 'disabled nil)
; (put 'downcase-region 'disabled nil)
; 
