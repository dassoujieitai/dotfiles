;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;; Common Lispライブラリを利用する。
(require 'cl)

;; Emacsからの質問をy/nで回答する。
(fset 'yes-or-no-p 'y-or-n-p)

;; スタートアップメッセージの表示/非表示。tは非表示、0は表示。
(setq inhibit-startup-screen t)

(when window-system
  ;; tool-barの表示/非表示。tは表示、0は非表示。
  (tool-bar-mode 0)

  ;; Scroll-barの表示/非表示。tは表示、0は非表示。
  (scroll-bar-mode 0))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs実践入門
;; 4.1 効率的な設定ファイルの作り方と管理方法
;; P61 ロードパスを追加する
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(when (< emacs-major-version 23)
  (defvar user-emacs-directory "~/.emacs.d/"))

;; load-pathを追加する関数を定義。
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
	      (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))

;; 引数のディレクトリとそのサブディレクトリをload-pathに追加。
(add-to-load-path "elisp" "conf" "public_repos")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs実践入門
;; 4.1 効率的な設定ファイルの作り方と管理方法
;; P63 init-loader.elを利用する
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'init-loader)
(init-loader-load "~/.emacs.d/conf")

;; init-loader.elで読み込む設定ファイルは、~/.emacs.d/conf/に置く。

;; (1) 2けたの数字から始まる設定ファイルを数字の順番に読み込む。
;;         00-env.el、10-perl.el
;; (2) Meadowの場合、「meadow」から始まる名前の設定ファイルを読み込む。
;;         meadow-config.el
;; (3) CarbonEmacsの場合、「carbon-emacs」から始まる設定ファイルを読み込む。
;;     CarbonEmacsはEmacs 22までのEmacs.appのこと。
;;         carbon-emacs-config.el
;; (4) CocoaEmacsの場合、「cocoa-emacs」から始まる設定ファイルを読み込む。
;;     CocoaEmacsはEmacs 23以降のEmacs.appのこと。
;;         cocoa-emacs-config.el
;; (5) ターミナルの場合、「nw」から始まる設定ファイルを読み込む。
;;         nw-config.el

;; init-loader.elは、設定ファイルにエラーが含まれている場合でも、スキップして次の設定
;; ファイルの読み込みを行う。

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs実践入門
;; 4.1 効率的な設定ファイルの作り方と管理方法
;; P64 OSの違いによる分岐
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 変数system-typeの値
;;     Windowsの場合 windows-nt あるいは cygwin
;;     Macの場合     darwin
;;     Linuxの場合   gnu/linux

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs実践入門
;; 4.1 効率的な設定ファイルの作り方と管理方法
;; P65 CUIとGUIによる分岐
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 変数window-systemの値
;;     Windowsの場合   w32 あるいは pc
;;     Macの場合       ns
;;     Linuxの場合     x
;;     ターミナルの場合 nil

;; CocoaEmacs以外はメニューバーを非表示。
(unless (eq window-system 'ns)
  ;; menu-barを非表示。
  (menu-bar-mode 0))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs実践入門
;; 4.1 効率的な設定ファイルの作り方と管理方法
;; P66 Emacsのバージョンによる分岐
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 変数emacs-version
;;     "24.4.1"
;; 変数emacs-major-version
;;     24




