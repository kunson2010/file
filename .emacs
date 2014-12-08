;; Ctrl-减号  为undo
;; (global-set-key "\C--" 'undo)


;; 企图在org-agenda中显示中文日期
(add-to-list 'load-path "~/.emacs.d/")
(require 'cal-china-x)

(defalias 'org-agenda-format-date-aligned 'lawlist-org-agenda-format-date-aligned)

(defun lawlist-org-agenda-format-date-aligned (date)
  "Format a date string for display in the daily/weekly agenda, or timeline.
   This function makes sure that dates are aligned for easy reading."
  (require 'cal-iso)
  (print date)
  (let* ((dayname (calendar-day-name date))
	 (day (cadr date))
	 (day-of-week (calendar-day-of-week date))
	 (month (car date))
	 (monthname (calendar-month-name month))
	 (year (nth 2 date))
	 (iso-week (org-days-to-iso-week
		    (calendar-absolute-from-gregorian date)))
	 (weekyear (cond ((and (= month 1) (>= iso-week 52))
			  (1- year))
			 ((and (= month 12) (<= iso-week 1))
			  (1+ year))
			 (t year)))
	 (weekstring (if (= day-of-week 1)
			 (format " W%02d" iso-week)
		       "")))
    (format "%s" (calendar-date-string date))))


;;时间日期格式 
(setq display-time-format "%c")
;; 设置时间格式
(setq format-time-string "%c")

(setq-default org-display-custom-times t)
(setq org-time-stamp-custom-formats '("<%Y-%m-%d %A>" . "<%Y-%m-%d %A %H:%M>"))




;; MobileOrg
(setq org-directory "~/org")
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/org/laub.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")



;; 导出脑图
;; (require 'ox-freemind)



;; mew 邮件客户端
(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)
 
;; Optional setup (Read Mail menu for Emacs 21):
(if (boundp 'read-mail-command)
        (setq read-mail-command 'mew))
 
;; Optional setup (e.g. C-xm for sending a message):
(autoload 'mew-user-agent-compose "mew" nil t)
(if (boundp 'mail-user-agent)
        (setq mail-user-agent 'mew-user-agent))
(if (fboundp 'define-mail-user-agent)
        (define-mail-user-agent
          'mew-user-agent
          'mew-user-agent-compose
          'mew-draft-send-message
          'mew-draft-kill
          'mew-send-hook))





;; ;; 微博，没成功
;; (add-to-list 'load-path "/home/laub/emacs/weibo/weibo.emacs-1.0/")
;; (require 'weibo)


;; 增加软件包
(require 'package)
(add-to-list
 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list
 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list
 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

;; 自动补齐
(require 'auto-complete-config)
(ac-config-default)

;; org mode, agenda 快捷键
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; 议程文件
(setq org-agenda-files (list "~/org/laub.org"))

;; org 中的状态
(setq org-todo-keywords
      '((sequence "TODO(t)" "WAIT(w)" "STRT(s)" "|"
		  "DONE(d)" "CANL(c)")))
;; (setq org-todo-keywords
;;       '((sequence "将要做(t)" "等待中(w)" "已开始(s)" "|"
;;                   "已完成(d)" "已取消(c)")))

;; org 使用
(require 'org-agenda-property)

;; org 中使用日历
(setq org-agenda-include-diary t)



;; org中时间戳的格式，中文格式，放开了报错，所以直接改了org.el
;; (defcustom org-time-stamp-custom-formats
;;   '("<%Y年%m月%d日 %A>" . "<%Y年%m月%d日 %A %H时%M分%S秒>") 

;; 项目完成时计入时间戳和输入记录
(setq org-log-done 'time)
(setq org-log-done 'note)

;; 本地时间格式
;; (add-hook 'org-mode-hook
;;           (lambda ()
;;             (set (make-local-variable 'system-time-locale) "C")))

;; iimage mode，加入图片
(autoload 'iimage-mode "iimage" "Support Inline image minor mode." t)
(autoload 'turn-on-iimage-mode "iimage" "Turn on Inline image minor mode." t)
(setq org-startup-with-inline-images 1) ;; will inlined display image when you open a file


;; org 导出html的美化
;; (setq home-path (expand-file-name "~")) 
(defvar my-emacs-path "/home/laub/emacs/static/css/stylesheet.css")
(setq org-html-head-extra (concat "<link rel=\"stylesheet\" href=" my-emacs-path " type=\"text/css\" />")) 

;; org中的时间统计
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)


;; 深色背景的主题
(load-theme 'afternoon t)

;; 色彩主题
(add-to-list 'load-path "/home/laub/.emacs.d/elpa/color-theme-20080305.34/")
(require 'color-theme)
(setq color-theme-is-global t)
(color-theme-initialize)
;; (color-theme-dark-laptop-hood)

;; 自定义主题, have no effect
;; (add-to-list 'custom-theme-load-path "/home/laub/.emacs.d/theme/")
;; (setq molokai-theme-kit t)
;; (load-theme molokai)


;; -----------------------  老的配置
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify))))
(custom-set-faces)


;; 设置英文字体
;; (set-face-attribute  
;; 'default nil :font "ubuntu mono-13")

;; 中文字体
;; (dolist (charset '(kana han symbol cjk-misc bopomofo))  
;;   (set-fontset-font (frame-parameter nil 'font)  
;;                     charset  
;;                     (font-spec :family "AR PL UKai CN" :size 18)))


;; 初始大小
;; (setq default-frame-alist 
;; '((height . 55) (width . 180) (menu-bar-lines . 20) (tool-bar-lines . 0))) 

;; Red Hat Linux default .emacs initialization file  ; -*-  mode: emacs-lisp -*-
;; Set up the keyboard so the delete key on both the regular keyboard
;; and the keypad delete the character under the cursor and to the right
;; under X, instead of the default, backspace behavior.
(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)

(global-set-key "\C-ck" 'kill-this-buffer)

(setq make-backup-files nil)
(setq-default make-backup-files nil)

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

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" system-name))

;; 关闭C-g 之类的声音, 终于有效了
(setq ring-bell-function 'ignore)

;; 只翻一行
(setq scroll-step 1
      scroll-margin 3                   ; 留3行开始滚动
      scroll-conservatively 10000)

;; 行号,列号
(global-linum-mode 1) ;; 显示行号


(setq line-number-mode t)
(setq column-number-mode t)

;; 括号匹配时显示另外一边的括号，而不是烦人的跳到另一个括号。
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; ;; 进行括号匹配的跳跃
;; (global-set-key "\C%" 'match-paren)

;; (defun match-paren (arg)
;;   "在撇配的括号间跳跃，或者输入 %"
;;   (interactive "p")
;;   (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
;;      ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
;;      ;; (t (self-insert-command (or arg 1)))
;;   )
;; ) 

;; 自动排版
(auto-fill-mode t)

;;鼠标自动避开指针，如当你输入的时候，指针到了鼠标的位置，鼠标有点挡住视线了   
(mouse-avoidance-mode 'animate)   
;;允许自动打开图片，如wiki里面   
(auto-image-file-mode)   


;; 更方便的buffer切换 
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)


;; 识别C文件的typedef
;; (require 'ctypes)
;; (ctypes-auto-parse-mode 1)

;; shell是不出现乱码
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; to fill paragraphs with a single space after each period
(setq sentence-end "[.?!][]\"')}]*\\($\\|[ \t]\\)[ \t\n]*")
(setq sentence-end-double-space nil)
;; 邮件假名
(define-mail-alias "laub" "lengkunvenly@163.com")

;; 邮件附件
(setq mail-user-agent 'message-user-agent)

;; 简写扩展
(setq-default abbrev-mode t)
;;(read-abbrev-file "~/.abbrev_defs")
(setq save-abbrevs t)

;; M-C-z 绑定为倒翻下一个窗口 
(global-set-key  "\e\C-z" 'scroll-other-window-down)

(global-set-key  "\e\C-m" 'man)
;; 直接显示图片, X中有效, 如果在frambufer中也有效就好了
(auto-image-file-mode)

;; 到指定行的键合弦
(global-set-key "\C-xg" 'goto-line)
;; 保存.emacs时, 自动位编译  -没起作用 2006年08月17日 星期四 23时24分52秒
;; (add-hook 'after-save-hook (lambda ()
;;                           (when (string = buffer-file-name (expand-file-name "~/.emacs"))
;;                             (emacs-lisp-byte-compile))))


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

;; ;; F5 日历
;; (global-set-key [f5] (function (lambda()
;;                                 (interactive)
;;                                 (calendar)
;;                                 (setq diary-file "~/emacs/diary")  ;日记文件
;;                                 (calendar-unmark)         ;刷掉标记
;;                                 (mark-diary-entries)      ;重新标记
;;                                 (mark-calendar-holidays)  ;标记节日
;;                                 (message "个人日记, ^_^")))) 


;; F5 多功能日历
(defun load_diary(arg)
  (interactive "c请选择您要装配的日记类型: p-个人, w-工作, t-技术, l-感情, f-摄影， v-小提琴")
  (progn
    (calendar)    
    
    (cond ((char-equal ?p arg)
           (setq diary-file "~/emacs/diary"))
          ((char-equal ?w arg)
           (setq diary-file "~/emacs/diary_work"))
          ((char-equal ?t arg)
           (setq diary-file "~/emacs/diary_tech"))
          ((char-equal ?l arg)
           (setq diary-file "~/emacs/diary_love"))
          ((char-equal ?f arg)
           (setq diary-file "~/emacs/diary_film"))
          ((char-equal ?v arg)
           (setq diary-file "~/emacs/diary_violin")))
    
    (calendar-unmark)                   ;刷掉标记
    (mark-diary-entries)                ;重新标记
    (mark-calendar-holidays)            ;标记节日

    (cond ((char-equal ?p arg)
           (message "个人日记, ^_^"))
          ((char-equal ?w arg)
           (message "工作记录, T_T"))
          ((char-equal ?t arg)
           (message "技术笔记, ^O^"))
          ((char-equal ?l arg)
           (message "感情日记, ^_*"))
          ((char-equal ?f arg)
           (message "摄影日记, ^_*"))
          ((char-equal ?v arg)
           (message "小提琴, ^_^")))))


(global-set-key [f5] 'load_diary)




;; F6 计算器
(global-set-key [f6] 'calculator)

;;C-f7 
;;f7 
(defun du-onekey-compile ()
  "保存并编译"
  (interactive)
  (save-some-buffers t)
  (switch-to-buffer-other-window "*compilation*")
  (compile compile-command))
(global-set-key [C-f7] 'compile)
(global-set-key [f7] 'du-onekey-compile)


;; F7 编译
;; (global-set-key [f7] 'compile)
;; '(compile-command "make")


;; F8 调试
;; (defun du-gdb-many-windows ()
;;   "调入gdb并且进入多窗口"
;;   (interactive)
;;   (gdb)
;;   (gdb-many-windows))
(global-set-key [f8] 'gdb)

;; F9 用空格填写tab制表符，希望先加上全buffer的自动选取。
(global-set-key [f9] 'untabify)

;; F11 agenda模式
(global-set-key [f11] 'org-agenda)

;; F12 书签列表
(global-set-key [f12] 'bookmark-bmenu-list)
;; C-x r C-n 改书签名
(global-set-key "\C-xr\C-n" 'bookmark-rename)

;; 书签文件
(setq bookmark-file "~/emacs/.emacs.bmk")

;; todo文件 
(setq todo-file-do "~/emacs/todo/do")
(setq todo-file-done "~/emacs/todo/done")
(setq todo-file-top "~/emacs/todo/top")



(add-to-list
 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list
 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list
 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)
(require 'package)

;; rmail文件
(setq rmail-file-name "~/emacs/RMAIL")

;; 我的经纬度, 用以计算本地日出日落时间，经纬度用googleEarth获得。 

;; 深圳上沙, 22.526116, 114.02859
;; 深圳桃源村, 22.563166，113.970573
;; 人民英雄纪念碑 39.903267 116.391631
;; JAIST  36.442981 136.593370

;;(setq calendar-latitude 42.402440)           ;;纬度 正数北纬
;;(setq calendar-longitude 117.261489)         ;;经度 正数东经
;;(setq calendar-location-name "赛罕坝上") ;;地名

 (setq calendar-latitude 36.442981 )           ;;纬度 正数北纬
 (setq calendar-longitude 136.593370)          ;;经度 正数东经
 (setq calendar-location-name "北陆先端科学技术大学院大学")  ;;地名

;; (setq calendar-latitude 39.5)           ;;纬度 正数北纬
;; (setq calendar-longitude 115)         ;;经度 正数东经
;; (setq calendar-location-name "小五台东台顶") ;;地名

;; (setq calendar-latitude  -27.598)           ;;纬度 正数北纬
;; (setq calendar-longitude 153.085)         ;;经度 正数东经
;; (setq calendar-location-name "布里斯班") ;;地名

;; (setq calendar-latitude  45.7716)           ;;纬度 正数北纬
;; (setq calendar-longitude 126.5622)         ;;经度 正数东经
;; (setq calendar-location-name "哈尔滨") ;;地名

;; (setq calendar-latitude   22.566239)           ;;纬度 正数北纬
;; (setq calendar-longitude 113.973828)         ;;经度 正数东经
;; (setq calendar-location-name "深圳桃源村") ;;地名


;; 日历相关的设置
(setq mark-holidays-in-calendar t)          ; 标记节假日  
(setq view-calendar-holidays-initially nil)   ; 不显示节日列表  

(setq general-holidays '((holiday-fixed 1 1   "元旦")  
                         (holiday-fixed 2 14  "情人节")  
                         (holiday-fixed 4 1   "愚人节")  
                         (holiday-fixed 12 25 "圣诞节")  
                         (holiday-fixed 10 1  "国庆节")  
                         (holiday-float 5 0 2 "母亲节")	;5月的第二个星期天  
                         (holiday-float 6 0 3 "父亲节")  
                         ))  
  
(setq local-holidays '((holiday-chinese 12 30  "春节除夕 (腊月三十)")  
                       (holiday-chinese 1 1    "大年初一 (正月初一)")  
                       (holiday-chinese 1 15  "元宵节 (正月十五)")  
                       (holiday-chinese 5 5   "端午节 (五月初五)")  
                       (holiday-chinese 9 9   "重阳节 (九月初九)")  
                       (holiday-chinese 8 15  "中秋节 (八月十五)")  
                       ;; 生日  
                       (holiday-fixed 2 28  "爸爸生日(1939)")  
                       (holiday-fixed 3 8  "妈妈生日(1953)")  
                       (holiday-fixed 7 12  "哥哥生日(1975)")  
                       (holiday-fixed 7 18  "琪琪生日(2005)")  
                       (holiday-fixed 7 18 "我的生日(1977）"))) 




;; 设置周一为每周的开始
(setq calendar-week-start-day 1) 


;; appt每n分钟, 检查一次
(setq appt-display-interval 1)
;; appt提示消息保持的秒数
(setq appt-display-duration 30)
;; appt 起作用了, 研究下appt-变量
;; (appt-add "00:00" "新的一天, 最好睡觉")
;; (appt-add " 7:00" "起床")
;; (appt-add " 7:30" "早饭")
;; (appt-add " 8:24" "学习")
;; (appt-add " 9:25" "休息眼睛5分钟")
;; (appt-add "11:30" "做午饭")
;; (appt-add "12:00" "吃午饭")
;; (appt-add "12:30" "休息 ")
;; (appt-add "13:30" "工作 ")
;; (appt-add "18:50" "做晚饭 ")
;; (appt-add "19:30" "吃晚饭 ")
;; (appt-add "20:30" "学习")
;; (appt-add "23:20" "刷牙")
;; (appt-add "23:50" "日! 还不刷牙?")

;; 设置阴历显示，在 calendar 上用 pC 显示阴历
(setq chinese-calendar-celestial-stem
  ["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"])
(setq chinese-calendar-terrestrial-branch
  ["子" "丑" "寅" "卯" "辰" "巳" "戊" "未" "申" "酉" "戌" "亥"])



;; 自动缩进, 没有起作用
(setq adaptive-fill-regexp "[ \t]+\\|[ \t]*\\([0-9]+\\.\\|\\*+\\)[ \t]*")
(setq adaptive-fill-first-line-regexp "\\  ")
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



;; c程序
(add-hook 'c-mode-hook 'linux-c-mode)
;; (add-hook 'c++-mode-hook 'linux-cpp-mode)
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

;; TAGS文件所在路径
(setq tags-file-name "/home/laub/job/src/rskit")


;; 我的新函数, case语句怎么写? if语句怎么写?  
(defun set-diary-type (diary-type)
"设置日记类型, 目前有个人, 工作, 技术等三个类型. 以后还可以增加小提琴, 
文学, 哲学等, 嘿.

想法就是, 通过此函数, 设置日记类型(也就是日记文件), 然后, 在日历中, 打
开的就是刚设置过的日记, 这样可以分类在每天记下东西.  

未来可以考虑, 把这几个日记文件合在一个文件中, 象todo中的, 通过Category 
标记, 在同一文件中记录若干个类型.  

-孔毅，北京 2006年11月05日 星期日 22时43分04秒"

  (interactive "s请选择您要装配的日记类型 (d-个人, w-工作, t-技术):") ;;  不知为何, 句首要加"k",
                                                                      ;;  否则串会乱掉
  (format "%s" 'diary-type)
  (if  (string-equal diary-type "D") 
      (message "你选择了 `%s' 类型" diary-type)) )

(put 'narrow-to-region 'disabled nil)



;; 忽略各种隐含文件等等
(setq dired-backup-overwrite 'always)
(setq dired-listing-switches "-Aol")
(setq dired-omit-files-p t)
(setq dired-no-confirm
      '(byte-compile chgrp chmod chown compress copy delete hardlink load
    move print shell symlink uncompress))
(defun dired-load-dired-x ()
  (load "dired-x" nil t)
  (setq dired-omit-extensions '(".svn/" "CVS/" ".o" "~" ".bin" ".bak" ".obj"
                ".map" ".ico" ".pif" ".lnk" ".a" ".ln" ".blg" ".bbl" ".dll" ".drv"
                ".vxd" ".386" ".elc" ".lof" ".glo" ".idx" ".lot" ".fmt" ".tfm"
                ".class" ".fas" ".lib" ".mem" ".x86f" ".sparcf" ".fasl" ".ufsl"
                ".fsl" ".dxl" ".pfsl" ".dfsl" ".lo" ".la" ".gmo" ".mo" ".toc"
                ".aux" ".cp" ".fn" ".ky" ".pg" ".tp" ".vr" ".cps" ".fns" ".kys"
                ".pgs" ".tps" ".vrs" ".pyc" ".pyo" ".idx" ".lof" ".lot" ".glo"
                ".blg" ".bbl" ".cps" ".fn" ".fns" ".ky" ".kys" ".pg" ".pgs" ".tp"
                ".tps" ".vr" ".vrs" ".pdb" ".ilk"))
  (setq dired-omit-files "^\\.?#\\|^\\.$\\|^\\.\\.$\\|^\\.\\|^~")
  )
;;(add-hook 'dired-load-hook 'dired-load-dired-x)

;; 让不同类型文件先的颜色不同，类似于ls --color 的效果
(add-hook 'dired-mode-hook
      (lambda ()
          (font-lock-add-keywords
           'dired-mode
           `((,dired-re-exe
              (".+" (dired-move-to-filename) nil (0 font-lock-type-face)))) t)))
(add-hook 'dired-load-hook
          (lambda ()
            (setq dired-font-lock-keywords
                  (append dired-font-lock-keywords
                          (list
                           (list dired-re-exe
                                 '(".+" (dired-move-to-filename) nil (0 font-lock-type-face))))))))


;; 英汉词典
(defun my-sdcv ()
   (interactive)
   (message (shell-command-to-string (concat "sdcv " (current-word)))))
(global-set-key  "\C-c\C-d" 'my-sdcv)


;; pluskid的 sdcv-mode
;; author: pluskid
;; 调用 stardict 的命令行程序 sdcv 来查辞典
;; 如果选中了 region 就查询 region 的内容，否则查询当前光标所在的单词
;; 查询结果在一个叫做 *sdcv* 的 buffer 里面显示出来，在这个 buffer 里面
;; 按 q 可以把这个 buffer 放到 buffer 列表末尾，按 d 可以查询单词
(global-set-key (kbd "C-c d") 'kid-sdcv-to-buffer)
(defun kid-sdcv-to-buffer ()
  (interactive)
  (let ((word (if mark-active
          (buffer-substring-no-properties (region-beginning) (region-end))
          (save-excursion
            (backward-word 1)
            (mark-word 1)
            (buffer-substring-no-properties (region-beginning) (region-end))))))
    (setq word (read-string (format "Search the dictionary for (default %s): " word)
                nil nil word))
    (set-buffer (get-buffer-create "*sdcv*"))
    (buffer-disable-undo)
    (erase-buffer)
    (let ((process (start-process-shell-command "sdcv" "*sdcv*" "sdcv" "-n" word)))
      (set-process-sentinel
       process
       (lambda (process signal)
     (when (memq (process-status process) '(exit signal))
       (unless (string= (buffer-name) "*sdcv*")
         (setq kid-sdcv-window-configuration (current-window-configuration))
         (switch-to-buffer-other-window "*sdcv*")
         (local-set-key (kbd "d") 'kid-sdcv-to-buffer)
         (local-set-key (kbd "q") (lambda ()
                    (interactive)
                    (bury-buffer)
                    (unless (null (cdr (window-list))) ; only one window
                      (delete-window)))))
       (goto-char (point-min))))))))





;; mew 作为邮件客户端，一如所有的 emacs 的插件，强大和无穷的定制性。
;; 可以自给自足，不依赖于 MTA 和 MDA，因此 mutt 的跨平台要好的多，可以在 windows 上使用。
;; 强大的过滤器定制，在 mew 中称为 refile。而且 mew 自动 refile 还是比较准确和人性化的。
;; mew 为来自日本的作品。因此相比 gnus 对 cjk 的支持要完善。
;; mew 内建的丰富模式，一共六种，有 summary, virtual meaaage, draft, header, edit, addrbook mode。
;; mew 的配色相比 gnus 实在是非常的舒服，也是最初吸引自己的原因。
;; mew 内建的无处不在的强大的补全机制，使得撰写处理阅读邮件很便捷。

(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)
 
;; Optional setup (Read Mail menu for Emacs 21):
(if (boundp 'read-mail-command)
    (setq read-mail-command 'mew))
 
;; Optional setup (e.g. C-xm for sending a message):
(autoload 'mew-user-agent-compose "mew" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'mew-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'mew-user-agent
      'mew-user-agent-compose
      'mew-draft-send-message
      'mew-draft-kill
      'mew-send-hook))


