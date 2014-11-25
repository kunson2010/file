(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; ����Ӣ������
(set-face-attribute  
'default nil :font "Courier New-12")  
;; ��������
(dolist (charset '(kana han symbol cjk-misc bopomofo))  
(set-fontset-font (frame-parameter nil 'font)  
charset  
(font-spec :family "΢���ź�" :size 17))) 

(global-linum-mode 1) ;; ��ʾ�к�

(setq default-frame-alist ;; ��ʼ��С
'((height . 45) (width . 150) (menu-bar-lines . 20) (tool-bar-lines . 0))) 



;; Red Hat Linux default .emacs initialization file  ; -*-  mode: emacs-lisp -*-
;; Set up the keyboard so the delete key on both the regular keyboard
;; and the keypad delete the character under the cursor and to the right
;; under X, instead of the default, backspace behavior.
(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)

(global-set-key "\C-ck" 'kill-this-buffer)

(setq make-backup-files nil)
(setq-default make-backup-files nil)

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

;;����Զ��ܿ�ָ�룬�統�������ʱ��ָ�뵽������λ�ã�����е㵲ס������   
(mouse-avoidance-mode 'animate)   
;;�����Զ���ͼƬ����wiki����   
(auto-image-file-mode)   


;; �������buffer�л� 
;;(require 'ibuffer)
;;(global-set-key (kbd "C-x C-b") 'ibuffer)

;; ��ʾ�к�
;;(require 'setnu)


;; ʶ��C�ļ���typedef
;;(require 'ctypes)
;;(ctypes-auto-parse-mode 1)

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
;;(read-abbrev-file "~/.abbrev_defs")
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
				   (mark-calendar-holidays)  ;��ǽ���
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
(global-set-key [f7] 'gdb)

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
;; JAIST  36.442981 136.593370

;;(setq calendar-latitude 42.402440)           ;;γ�� ������γ
;;(setq calendar-longitude 117.261489)         ;;���� ��������
;;(setq calendar-location-name "��������") ;;����

 (setq calendar-latitude 36.442981 )           ;;γ�� ������γ
 (setq calendar-longitude 136.593370)          ;;���� ��������
 (setq calendar-location-name "��½�ȶ˿�ѧ������ѧԺ��ѧ")  ;;����

;; (setq calendar-latitude 39.5)           ;;γ�� ������γ
;; (setq calendar-longitude 115)         ;;���� ��������
;; (setq calendar-location-name "С��̨��̨��") ;;����

;; (setq calendar-latitude  -27.598)           ;;γ�� ������γ
;; (setq calendar-longitude 153.085)         ;;���� ��������
;; (setq calendar-location-name "����˹��") ;;����

;; (setq calendar-latitude  45.7716)           ;;γ�� ������γ
;; (setq calendar-longitude 126.5622)         ;;���� ��������
;; (setq calendar-location-name "������") ;;����

;; (setq calendar-latitude   22.566239)           ;;γ�� ������γ
;; (setq calendar-longitude 113.973828)         ;;���� ��������
;; (setq calendar-location-name "������Դ��") ;;����


;; ������ص�����
(setq mark-holidays-in-calendar t)          ; ��ǽڼ���  
(setq view-calendar-holidays-initially nil)   ; ����ʾ�����б�  

(setq general-holidays '((holiday-fixed 1 1   "Ԫ��")  
                         (holiday-fixed 2 14  "���˽�")  
                         (holiday-fixed 4 1   "���˽�")  
                         (holiday-fixed 12 25 "ʥ����")  
                         (holiday-fixed 10 1  "�����")  
                         (holiday-float 5 0 2 "ĸ�׽�")   ;5�µĵڶ���������  
                         (holiday-float 6 0 3 "���׽�")  
                         ))  
  
(setq local-holidays '((holiday-chinese 12 30  "���ڳ�Ϧ (������ʮ)")  
                       (holiday-chinese 1 1    "�����һ (���³�һ)")  
               	       (holiday-chinese 1 15  "Ԫ���� (����ʮ��)")  
                       (holiday-chinese 5 5   "����� (���³���)")  
                       (holiday-chinese 9 9   "������ (���³���)")  
                       (holiday-chinese 8 15  "����� (����ʮ��)")  
                       ;; ����  
                       ;; (birthday-fixed 2 28  "�ְ�����(1939)")  
                       ;; (birthday-fixed 3 8  "��������(1953)")  
                       ;; (holiday-chinese 6 4 "��������")           ;��������
                       ))  




;; ������һΪÿ�ܵĿ�ʼ
(setq calendar-week-start-day 1) 


;; apptÿn����, ���һ��
(setq appt-display-interval 1)
;; appt��ʾ��Ϣ���ֵ�����
(setq appt-display-duration 30)
;; appt ��������, �о���appt-����
(appt-add "00:00" "�µ�һ��, ���˯��")
(appt-add " 7:00" "��")
(appt-add " 7:30" "�緹")
(appt-add " 8:24" "ѧϰ")
(appt-add " 9:25" "��Ϣ�۾�5����")
(appt-add "11:30" "���緹")
(appt-add "12:00" "���緹")
(appt-add "12:30" "��Ϣ ")
(appt-add "13:30" "���� ")
(appt-add "18:50" "���� ")
(appt-add "19:30" "���� ")
(appt-add "20:30" "ѧϰ")
(appt-add "23:20" "ˢ��")
(appt-add "23:50" "��! ����ˢ��?")

;; ����������ʾ���� calendar ���� pC ��ʾ����
(setq chinese-calendar-celestial-stem
  ["��" "��" "��" "��" "��" "��" "��" "��" "��" "��"])
(setq chinese-calendar-terrestrial-branch
  ["��" "��" "��" "î" "��" "��" "��" "δ" "��" "��" "��" "��"])



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





;; mew ��Ϊ�ʼ��ͻ��ˣ�һ�����е� emacs �Ĳ����ǿ�������Ķ����ԡ�
;; �����Ը����㣬�������� MTA �� MDA����� mutt �Ŀ�ƽ̨Ҫ�õĶ࣬������ windows ��ʹ�á�
;; ǿ��Ĺ��������ƣ��� mew �г�Ϊ refile������ mew �Զ� refile ���ǱȽ�׼ȷ�����Ի��ġ�
;; mew Ϊ�����ձ�����Ʒ�������� gnus �� cjk ��֧��Ҫ���ơ�
;; mew �ڽ��ķḻģʽ��һ�����֣��� summary, virtual meaaage, draft, header, edit, addrbook mode��
;; mew ����ɫ��� gnus ʵ���Ƿǳ��������Ҳ����������Լ���ԭ��
;; mew �ڽ����޴����ڵ�ǿ��Ĳ�ȫ���ƣ�ʹ��׫д�����Ķ��ʼ��ܱ�ݡ�

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



