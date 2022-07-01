;; init-tricks.el --- Define utility functions.	-*- lexical-binding: t -*-

;; Copyright (C) 2019-2022 Zhipeng Bao

;; Author: Zhipeng Bao <p0ng.64@Yahoo.com>
;; URL: https://github.com/P0ng64/.emacs.d

;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;;

;;; Commentary:
;;
;; Define utility functions.
;;

;;; Code:

(require 'init-funcs)

(defun sis-enable ()
  "Enable smart-input-source"
  (interactive)
  (sis-global-respect-mode t)
  (sis-global-context-mode t)
  (sis-global-inline-mode t))

(defun sis-disable ()
  "Disable smart-input-source"
  (interactive)
  (sis-global-respect-mode 0)
  (sis-global-context-mode 0)
  (sis-global-inline-mode 0))

(defun note-with-light ()
  "Set Emacs theme and font to a note-taking-friendly style."
  (interactive)
  (progn
    (load-theme 'doom-one-light t)
    (sis-enable)
    (set-face-attribute 'default nil
                        :font "CMU Typewriter Text")
    (set-fontset-font t 'unicode
                      (font-spec :family "Songti TC"))))

(defun back-to-code ()
  "Set Emacs theme and font to a programming-friendly style."
  (interactive)
  (progn
    (centaur-load-theme centaur-theme)
    (sis-disable)
    (set-face-attribute 'default nil
                        :font "Monaco")
    (set-fontset-font t 'unicode
                      (font-spec :family "PingFang SC"))))

(when sys/macp
  (defun reveal-in-finder ()
    "Reveal current file or directory in finder"
    (interactive)
    (if (eq major-mode 'dired-mode)
        (shell-command (concat "open "
                               (expand-file-name default-directory)))
      (shell-command (concat "open -R "
                             (cond
                              (load-in-progress load-file-name)
                              ((and (boundp 'byte-compile-current-file) byte-compile-current-file)
                               byte-compile-current-file)
                              (:else (buffer-file-name)))))))

  (defun refresh-chrome-tab ()
    (do-applescript "tell application \"Chrome\" to tell the active tab \
                    of its first window to reload")))

(defun pandoc-convert-to-docx ()
  "Use pandoc to convert current file to Microsoft Word docx."
  (interactive)
  (shell-command (concat "pandoc "
                         (buffer-name)
                         " -o "
                         (concat (car (split-string (buffer-name) "\\."))
                                 ".docx"))))

(provide 'init-tricks)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-tricks.el ends here
