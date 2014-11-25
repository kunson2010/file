;; Red Hat Linux default .emacs initialization file  ; -*-  mode: emacs-lisp -*-

;; Set up the keyboard so the delete key on both the regular keyboard
;; and the keypad delete the character under the cursor and to the right
;; under X, instead of the default, backspace behavior.
(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)


;; �﷨����
(global-font-lock-mode t)
;; ѡȡ�ı������
(setq-default transient-mark-mode t)
;; �ļ�����һ���н�β:--��--
(setq require-final-newline nil)
;; �ƶ����ı�ĩβʱ, ����������
(setq next-line-add-newlines nil)

(when window-system
  ;; enable wheelmouse support by default
  (mwheel-install)
  ;; use extended compound-text coding for X clipboard
  (set-selection-coding-system 'compound-text-with-extensions))

;; �ر�Emacs��"��������"
(setq inhibit-startup-message t)

;; �ر�C-g ֮�������, ������Ч��
(setq ring-bell-function 'ignore)

;; ֻ��һ��
(setq scroll-step 1
      scroll-margin 0
      scroll-conservatively 10000)

;; �к�,�к�
(setq line-number-mode t)
(setq column-number-mode t)

;; ����ƥ��ʱ��ʾ����һ�ߵ����ţ������Ƿ��˵�������һ�����š�
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; �Զ��Ű�
(auto-fill-mode)

;; �ʼ�����
(define-mail-alias "laub" "lengkunvenly@163.com")

;; �ʼ�����
(setq mail-user-agent 'message-user-agent)

;;ʱ�����ڸ�ʽ 
(setq display-time-format "%c %p")

;; M-C-z ��Ϊ������һ������ 
(global-set-key  "\e\C-z" 'scroll-other-window-down)

;; ֱ����ʾͼƬ, X����Ч, ���frambufer��Ҳ��Ч�ͺ���
(auto-image-file-mode)

;; ����.emacsʱ, �Զ�λ����  -û������ 2006��08��17�� ������ 23ʱ24��52��
;; (add-hook 'after-save-hook (lambda ()
;; 			     (when (string = buffer-file-name (expand-file-name "~/.emacs"))
;; 			       (emacs-lisp-byte-compile))))


;; M-p  ��Ϊ�����ı���
(global-set-key "\ep" 'set-mark-command)

;; F3 display-time-mode
(global-set-key [f3] 'display-time-mode)

;; F4 ���ڴ�
(global-set-key [f4]
		(lambda()
		  (interactive)
		  (insert
		   (format-time-string "%c"))))

;; F5 ����
(global-set-key [f5] (function (lambda()
				   (interactive)
				   (calendar)
				   (setq diary-file "~/emacs/diary")  ;�ռ��ļ�
				   (mark-diary-entries))))

;; F6 ������
(global-set-key [f6] 'calculator)

;; F7 ����
(global-set-key [f7] 'compile)

;; F12 ��ǩ�б�
(global-set-key [f12] 'bookmark-bmenu-list)

;; ��ǩ�ļ�
(setq bookmark-file "~/emacs/.emacs.bmk")

;; todo�ļ� 
(setq todo-file-do "~/emacs/todo/do")
(setq todo-file-done "~/emacs/todo/done")
(setq todo-file-top "~/emacs/todo/top")

;; rmail�ļ�
(setq rmail-file-name "~/emacs/RMAIL")

;; �ҵľ�γ��, ���Լ��㱾���ճ�����ʱ��, 
;; (setq calendar-latitude 22.526116)         ;;γ�� ������γ
;; (setq calendar-longitude 114.02859)        ;;���� ��������
;; (setq calendar-location-name "������ɳ") ;;����
(setq calendar-latitude 22.563166)         ;;γ�� ������γ
(setq calendar-longitude 113.970573)        ;;���� ��������
(setq calendar-location-name "����������") ;;����

;; ������һΪÿ�ܵĿ�ʼ
(setq calendar-week-start-day 1) 

;; apptÿ1����, ���һ��
(setq appt-display-interval 0.017)

;; appt��ʾ��Ϣ����30��
(setq appt-display-duration 30)

;; appt û������, �������, Ҫ������M-appt-delete, ���ܼ���, �о�appt-
;; ����
(appt-add "16:26" "test6")
(appt-add "16:27" "test7")
(appt-add "16:28" "test8")
(appt-add "16:29" "test9")

(appt-add "00:00" "�µ�һ��, ��ӭ��ҹ!")
(appt-add " 8:00" "�� ")
(appt-add "10:00" "�Ȳ� ")
(appt-add "11:30" "���緹")
(appt-add "12:00" "���緹")
(appt-add "12:30" "��Ϣ ")
(appt-add "13:30" "���� ")
(appt-add "15:55" "����� ")
(appt-add "17:30" "���,���� ")
(appt-add "18:50" "�� ")
(appt-add "19:30" "�������ȥ��")
(appt-add "20:15" "���� ")
(appt-add "23:15" "ˢ��")
(appt-add "23:20" "ˢ��")
(appt-add "23:30" "ˢ��")
(appt-add "23:40" "ˢ��")
(appt-add "23:50" "��! ����ˢ��?")

;; ����������ʾ���� calendar ���� pC ��ʾ����
(setq chinese-calendar-celestial-stem
  ["��" "��" "��" "��" "��" "��" "��" "��" "��" "��"])
(setq chinese-calendar-terrestrial-branch
  ["��" "��" "��" "î" "��" "��" "��" "δ" "��" "��" "��" "��"])

;; �й�����, �е�����
;; (add-to-list 'load-path "~/tools/chinese/chinese-calendar.elc")
;; (require 'chinese-calendar.elc)
;;(load-file "~/tools/chinese/chinese-calendar.elc")

;; �Զ�����, û��������
(setq adaptive-fill-regexp "[ \t]+\\|[ \t]*\\([0-9]+\\.\\|\\*+\\)[ \t]*")

;; ��������ʱ, ��������
(add-hook 'comint-output-filter-functions
	  'comint-watch-for-password-prompt)

;; �³�������
(defun spell-key-seq (key)
  "spell key sequence and add it to kill ring"
  (interactive "kInput your key seq:")
  (let ((keystr (format "%S" key)))
        (message "key `%S' is in your kill ring, Use C-y to yank it" key)
        (kill-new keystr)))


;;AUCTex & preview-latex


;; w3m ����û�и㶨��
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
;; ;(require 'mime-w3m)  ;;  %/2??bk-0 ���������û���� (B :(  
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

;; c����
(add-hook 'c-mode-hook 'linux-c-mode)
(add-hook 'c++-mode-hook 'linux-cpp-mode)
;; ����imenu������ʽΪ����������
(setq imenu-sort-function 'imenu--sort-by-name)
(defun linux-c-mode()
;; ���س�����C-j�Ĺ��ܣ����е�ͬʱ����
  (define-key c-mode-map [return] 'newline-and-indent)
  (interactive)
;; ����C����Ķ�����
  (c-set-style "K&R")
;; �Զ�ģʽ���ڴ���ģʽ�µ������{ʱ�����Զ����������õĶ��������
  (c-toggle-auto-state)
;; ��ģʽ�£�����Backspaceʱ��ɾ�����Ŀո�
  (c-toggle-hungry-state)
;; TAB���Ŀ������Ϊ8
  (setq c-basic-offset 4)
;; �ڲ˵��м��뵱ǰBuffer�ĺ�������
  (imenu-add-menubar-index)
;; ��״̬������ʾ��ǰ������ĸ��������ڲ�
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
