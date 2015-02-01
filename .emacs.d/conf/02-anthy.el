;; Anthyの設定                                                                  
(when (eq system-type 'darwin)
  (add-to-list 'exec-path "/Users/masa/util/anthy/anthy-9100h/bin"))

(load-library "anthy")
(when (eq system-type 'darwin)
  (load-file "/Users/masa/.emacs.d/elisp/anthy/leim-list.el"))
(setq default-input-method 'japanese-anthy)

;; かな入力の設定。                                                             
(anthy-kana-map-mode)

;; C-oで日本語の入力モードをtoggle                                              
(define-key global-map (kbd "C-o") 'toggle-input-method)

;; かな漢字入力モードでSpaceを押したとき、半角空白が挿入されるようにする。      
(setq anthy-wide-space " ")

(anthy-change-hiragana-map "4@" "ヴ")

(anthy-change-hiragana-map "¥" "ー")
(anthy-change-hiragana-map "\\" "ー")

; (if (eq system-type 'darwin)
;    (anthy-change-hiragana-map "¥¥" "ー")
;  (anthy-change-hiragana-map "\\" "ー"))

(anthy-change-hiragana-map "`"  "ろ")
(anthy-change-hiragana-map "|"  "ー")
(anthy-change-hiragana-map "{"  "「")
(anthy-change-hiragana-map "}"  "」")
(anthy-change-hiragana-map "?"  "・")
