;; Red Hat Linux default .emacs initialization file  ; -*-  mode: emacs-lisp -*-
;; Set up the keyboard so the delete key on both the regular keyboard
;; and the keypad delete the character under the cursor and to the right
;; under X, instead of the default, backspace behavior.
(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)

(global-set-key "\C-ck" 'kill-this-buffer)

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

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" system-name))

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
(auto-fill-mode t)

;; �������buffer�л� 
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; ��ʾ�к�
(require 'setnu)


;; ʶ��C�ļ���typedef
(require 'ctypes)
(ctypes-auto-parse-mode 1)

;; shell�ǲ���������
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; to fill paragraphs with a single space after each period
(setq sentence-end "[.?!][]\"')}]*\\($\\|[ \t]\\)[ \t\n]*")
(setq sentence-end-double-space nil)
;; �ʼ�����
(define-mail-alias "laub" "lengkunvenly@163.com")

;; �ʼ�����
(setq mail-user-agent 'message-user-agent)

;; ��д��չ
(setq-default abbrev-mode t)
(read-abbrev-file "~/.abbrev_defs")
(setq save-abbrevs t)

;;ʱ�����ڸ�ʽ 
(setq display-time-format "%c %p")

;; M-C-z ��Ϊ������һ������ 
(global-set-key  "\e\C-z" 'scroll-other-window-down)

(global-set-key  "\e\C-m" 'man)
;; ֱ����ʾͼƬ, X����Ч, �����frambufer��Ҳ��Ч�ͺ���
(auto-image-file-mode)

;; ��ָ���еļ�����
(global-set-key "\C-xg" 'goto-line)
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
				   (calendar-unmark)	     ;ˢ�����
				   (calendar-unmark)	     ;ˢ�����
				   (mark-diary-entries)	     ;���±��
				   (message "�����ռ�, ^_^")))) 

;; F8 ��������
(global-set-key [f8] (function (lambda()
				   (interactive)
				   (calendar)
				   (setq diary-file "~/emacs/diary_work")  ;�ռ��ļ�
				   (calendar-unmark)	     ;ˢ�����
				   (mark-diary-entries)	     ;���±��
				   (message "�����ʼ�")))) 


;; F11 ��������
(global-set-key [f11] (function (lambda()
				   (interactive)
				   (calendar)
				   (setq diary-file "~/emacs/diary_tech")  ;�ռ��ļ�
				   (calendar-unmark)	     ;ˢ�����
				   (mark-diary-entries)	     ;���±��
				   (message "�����ʼ�")))) 

;; F6 ������
(global-set-key [f6] 'calculator)

;; F7 ����
(global-set-key [f7] 'compile)

;; F9 �Զ�����
(global-set-key [f9] 'auto-fill-mode)

;; F12 ��ǩ�б�
(global-set-key [f12] 'bookmark-bmenu-list)
;; C-x r C-n ����ǩ��
(global-set-key "\C-xr\C-n" 'bookmark-rename)

;; ��ǩ�ļ�
(setq bookmark-file "~/emacs/.emacs.bmk")

;; todo�ļ� 
(setq todo-file-do "~/emacs/todo/do")
(setq todo-file-done "~/emacs/todo/done")
(setq todo-file-top "~/emacs/todo/top")

;; rmail�ļ�
(setq rmail-file-name "~/emacs/RMAIL")

;; �ҵľ�γ��, ���Լ��㱾���ճ�����ʱ�䣬��γ����googleEarth��á� 

;; ������ɳ, 22.526116, 114.02859
;; ������Դ��, 22.563166��113.970573
;; ����Ӣ�ۼ�� 39.903267 116.391631

(setq calendar-latitude 39.854896)           ;;γ�� ������γ
(setq calendar-longitude 116.367545)         ;;���� ��������
(setq calendar-location-name "������������") ;;����


;; ������һΪÿ�ܵĿ�ʼ
(setq calendar-week-start-day 1) 

;; apptÿn����, ���һ��
(setq appt-display-interval 5)

;; appt��ʾ��Ϣ���ֵ�����
(setq appt-display-duration 10)

;; appt ��������, �о���appt-����
;; (appt-add "16:26" "test6")
;; (appt-add "16:27" "test7")
;; (appt-add "16:28" "test8")
;; (appt-add "16:29" "test9")

(appt-add "00:00" "�µ�һ��, ��ӭ��ҹ!")
(appt-add " 8:00" "�� ")
(appt-add "10:00" "�Ȳ� ")
(appt-add "10:59" "��Ҫ����")
(appt-add "11:30" "���緹")
(appt-add "12:00" "���緹")
(appt-add "12:30" "��Ϣ ")
(appt-add "13:30" "���� ")
(appt-add "15:55" "����� ")
(appt-add "17:30" "���,���� ")
(appt-add "18:50" "�� ")
(appt-add "19:30" "�������ȥ��")
;; (appt-add "20:15" "���� ")
;; (appt-add "23:15" "ˢ��")
;; (appt-add "23:20" "ˢ��")
;; (appt-add "23:30" "ˢ��")
;; (appt-add "23:40" "ˢ��")
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
(setq adaptive-fill-first-line-regexp "\\  ")
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
;; (add-hook 'c++-mode-hook 'linux-cpp-mode)
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

;; TAGS�ļ�����·��
(setq tags-file-name "/home/laub/job/src/rskit")


;; �ҵ��º���, case�����ôд? if�����ôд?  
(defun set-diary-type (diary-type)
"�����ռ�����, Ŀǰ�и���, ����, ��������������. �Ժ󻹿�������С����, 
��ѧ, ��ѧ��, ��.

�뷨����, ͨ���˺���, �����ռ�����(Ҳ�����ռ��ļ�), Ȼ��, ��������, ��
���ľ��Ǹ����ù����ռ�, �������Է�����ÿ����¶���.  

δ�����Կ���, ���⼸���ռ��ļ�����һ���ļ���, ��todo�е�, ͨ��Category 
���, ��ͬһ�ļ��м�¼���ɸ�����.  

-���㣬���� 2006��11��05�� ������ 22ʱ43��04��"

  (interactive "s��ѡ����Ҫװ����ռ����� (d-����, w-����, t-����):") ;;  ��֪Ϊ��, ����Ҫ��"k",
                                                                      ;;  ���򴮻��ҵ�
  (format "%s" 'diary-type)
  (if  (string-equal diary-type "D") 
      (message "��ѡ���� `%s' ����" diary-type)) )

(put 'narrow-to-region 'disabled nil)



;; ���Ը��������ļ��ȵ�
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

;; �ò�ͬ�����ļ��ȵ���ɫ��ͬ��������ls --color ��Ч��
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


;; Ӣ���ʵ�
(defun my-sdcv ()
   (interactive)
   (message (shell-command-to-string (concat "sdcv " (current-word)))))
(global-set-key  "\C-c\C-d" 'my-sdcv)


;; pluskid�� sdcv-mode
;; author: pluskid
;; ���� stardict �������г��� sdcv ����ǵ�
;; ���ѡ���� region �Ͳ�ѯ region �����ݣ������ѯ��ǰ������ڵĵ���
;; ��ѯ�����һ������ *sdcv* �� buffer ������ʾ����������� buffer ����
;; �� q ���԰���� buffer �ŵ� buffer �б�ĩβ���� d ���Բ�ѯ����
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
