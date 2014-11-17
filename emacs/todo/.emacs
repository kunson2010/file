;; Red Hat Linux default .emacs initialization file  ; -*-  mode: emacs-lisp -*-

;; Set up the keyboard so the delete key on both the regular keyboard
;; and the keypad delete the character under the cursor and to the right
;; under X, instead of the default, backspace behavior.
(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)


;; 语法加亮
(global-font-lock-mode t)
;; 选取文本块加亮
(setq-default transient-mark-mode t)
;; 文件总是一新行结尾:--否--
(setq require-final-newline nil)
;; 移动到文本末尾时, 不加入新行
(setq next-line-add-newlines nil)

(when window-system
  ;; enable wheelmouse support by default
  (mwheel-install)
  ;; use extended compound-text coding for X clipboard
  (set-selection-coding-system 'compound-text-with-extensions))

;; 关闭Emacs的"开机动画"
(setq inhibit-startup-message t)

;; 关闭C-g 之类的声音, 终于有效了
(setq ring-bell-function 'ignore)

;; 只翻一行
(setq scroll-step 1
      scroll-margin 0
      scroll-conservatively 10000)

;; 行号,列号
(setq line-number-mode t)
(setq column-number-mode t)

;; 括号匹配时显示另外一边的括号，而不是烦人的跳到另一个括号。
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; 自动排版
(auto-fill-mode)

;; 邮件假名
(define-mail-alias "laub" "lengkunvenly@163.com")

;; 邮件附件
(setq mail-user-agent 'message-user-agent)

;;时间日期格式 
(setq display-time-format "%c %p")

;; M-C-z 绑定为倒翻下一个窗口 
(global-set-key  "\e\C-z" 'scroll-other-window-down)

;; 直接显示图片, X中有效, 如果frambufer中也有效就好了
(auto-image-file-mode)

;; 保存.emacs时, 自动位编译  -没起作用 2006年08月17日 星期四 23时24分52秒
;; (add-hook 'after-save-hook (lambda ()
;; 			     (when (string = buffer-file-name (expand-file-name "~/.emacs"))
;; 			       (emacs-lisp-byte-compile))))


;; M-p  绑定为设置文本块
(global-set-key "\ep" 'set-mark-command)

;; F3 display-time-mode
(global-set-key [f3] 'display-time-mode)

;; F4 日期戳
(global-set-key [f4]
		(lambda()
		  (interactive)
		  (insert
		   (format-time-string "%c"))))

;; F5 日历
(global-set-key [f5] (function (lambda()
				   (interactive)
				   (calendar)
				   (setq diary-file "~/emacs/diary")  ;日记文件
				   (mark-diary-entries))))

;; F6 计算器
(global-set-key [f6] 'calculator)

;; F7 编译
(global-set-key [f7] 'compile)

;; F12 书签列表
(global-set-key [f12] 'bookmark-bmenu-list)

;; 书签文件
(setq bookmark-file "~/emacs/.emacs.bmk")

;; todo文件 
(setq todo-file-do "~/emacs/todo/do")
(setq todo-file-done "~/emacs/todo/done")
(setq todo-file-top "~/emacs/todo/top")

;; rmail文件
(setq rmail-file-name "~/emacs/RMAIL")

;; 我的经纬度, 用以计算本地日出日落时间, 
;; (setq calendar-latitude 22.526116)         ;;纬度 正数北纬
;; (setq calendar-longitude 114.02859)        ;;经度 正数东经
;; (setq calendar-location-name "深圳上沙") ;;地名
(setq calendar-latitude 22.563166)         ;;纬度 正数北纬
(setq calendar-longitude 113.970573)        ;;经度 正数东经
(setq calendar-location-name "深圳龙井村") ;;地名

;; 设置周一为每周的开始
(setq calendar-week-start-day 1) 

;; appt每1分钟, 检查一次
(setq appt-display-interval 0.017)

;; appt提示消息保持30秒
(setq appt-display-duration 30)

;; appt 没起作用, 真他妈怪, 要先来个M-appt-delete, 才能激活, 研究appt-
;; 变量
(appt-add "16:26" "test6")
(appt-add "16:27" "test7")
(appt-add "16:28" "test8")
(appt-add "16:29" "test9")

(appt-add "00:00" "新的一天, 欢迎熬夜!")
(appt-add " 8:00" "起床 ")
(appt-add "10:00" "喝茶 ")
(appt-add "11:30" "做午饭")
(appt-add "12:00" "吃午饭")
(appt-add "12:30" "休息 ")
(appt-add "13:30" "看书 ")
(appt-add "15:55" "下午茶 ")
(appt-add "17:30" "买菜,做晚饭 ")
(appt-add "18:50" "晚饭 ")
(appt-add "19:30" "带其其出去玩")
(appt-add "20:15" "拉琴 ")
(appt-add "23:15" "刷牙")
(appt-add "23:20" "刷牙")
(appt-add "23:30" "刷牙")
(appt-add "23:40" "刷牙")
(appt-add "23:50" "日! 还不刷牙?")

;; 设置阴历显示，在 calendar 上用 pC 显示阴历
(setq chinese-calendar-celestial-stem
  ["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"])
(setq chinese-calendar-terrestrial-branch
  ["子" "丑" "寅" "卯" "辰" "巳" "戊" "未" "申" "酉" "戌" "亥"])

;; 中国日历, 有点问题
;; (add-to-list 'load-path "~/tools/chinese/chinese-calendar.elc")
;; (require 'chinese-calendar.elc)
;;(load-file "~/tools/chinese/chinese-calendar.elc")

;; 自动缩进, 没有起作用
(setq adaptive-fill-regexp "[ \t]+\\|[ \t]*\\([0-9]+\\.\\|\\*+\\)[ \t]*")

;; 输入密码时, 总是隐藏
(add-hook 'comint-output-filter-functions
	  'comint-watch-for-password-prompt)

;; 吐出键序列
(defun spell-key-seq (key)
  "spell key sequence and add it to kill ring"
  (interactive "kInput your key seq:")
  (let ((keystr (format "%S" key)))
        (message "key `%S' is in your kill ring, Use C-y to yank it" key)
        (kill-new keystr)))


;;AUCTex & preview-latex


;; w3m 从来没有搞定过
;;  (require 'w3m)  
;; (setq w3m-use-mule-ucs t)  
;; (setq w3m-use-toolbar t)    
;; (setq w3m-use-cookies t)  
;; (setq w3m-display-inline-image t)  
;; (setq w3m-bookmark-file-coding-system 'chinese-gbk)  
;; (setq w3m-coding-system 'chinese-gbk)  
;; (setq w3m-default-coding-system 'chinese-gbk)  
;; (setq w3m-file-coding-system 'chinese-gbk)  
;; (setq w3m-file-name-coding-system 'chinese-gbk)  
;; (setq w3m-terminal-coding-system 'chinese-gbk)  
;; (setq w3m-input-coding-system 'chinese-gbk)  
;; (setq w3m-output-coding-system 'chinese-gbk)  
;; (setq w3m-tab-width 8)  
;; ;(setq w3m-home-page "file://home/homepage/index.html")  
;; (setq w3m-view-this-url-new-session-in-background t)  
;; ;(require 'mime-w3m)  ;;  %/2??bk-0 这个东西我没整好 (B :(  
;; (add-hook 'w3m-fontify-after-hook 'remove-w3m-output-garbages)  
;; (defun remove-w3m-output-garbages ()  
;;   (interactive)  
;;   (let ((buffer-read-only))  
;;     (setf (point) (point-min))  
;;     (while (re-search-forward "[\200-\240]" nil t)  
;;       (replace-match " "))  
;;     (set-buffer-multibyte t))  
;;   (set-buffer-modified-p nil))  
    
;;     ;;; Load mule-gbk
;;     (add-to-list 'load-path "/home/laub/tools/mule-gbk/")
;;     (require 'mule-gbk)

;;     ;; Setup GBK environment
;;     (set-terminal-coding-system 'chinese-gbk)
;;     (set-keyboard-coding-system 'chinese-gbk)
;;     (set-language-environment 'chinese-gbk)
;;     (setq locale-coding-system 'chinese-gbk)
;;     (setq current-language-environment "Chinese-GBK")

;;     ;; Setup X Selection for mule-gbk
;;     ;;(mule-gbk-selection-setup)

;; c程序
(add-hook 'c-mode-hook 'linux-c-mode)
(add-hook 'c++-mode-hook 'linux-cpp-mode)
;; 设置imenu的排序方式为按名称排序
(setq imenu-sort-function 'imenu--sort-by-name)
(defun linux-c-mode()
;; 将回车代替C-j的功能，换行的同时对齐
  (define-key c-mode-map [return] 'newline-and-indent)
  (interactive)
;; 设置C程序的对齐风格
  (c-set-style "K&R")
;; 自动模式，在此种模式下当你键入{时，会自动根据你设置的对齐风格对齐
  (c-toggle-auto-state)
;; 此模式下，当按Backspace时会删除最多的空格
  (c-toggle-hungry-state)
;; TAB键的宽度设置为8
  (setq c-basic-offset 4)
;; 在菜单中加入当前Buffer的函数索引
  (imenu-add-menubar-index)
;; 在状态条上显示当前光标在哪个函数体内部
  (which-function-mode) )
(defun linux-cpp-mode()
  (define-key c++-mode-map [return] 'newline-and-indent)
  (define-key c++-mode-map [(control c) (c)] 'compile)
  (interactive)
  (c-set-style "K&R")
  (c-toggle-auto-state)
  (c-toggle-hungry-state)
  (setq c-basic-offset 4)
  (imenu-add-menubar-index)
  (which-function-mode) )
