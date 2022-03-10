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

(defun note-with-plain ()
  "Set Emacs theme and font to a note-taking-friendly style."
  (interactive)
  (progn
    (load-theme 'doom-plain t)
    (set-face-attribute 'default nil
                        :font "CMU Typewriter Text"
                        :height 160)
    (set-fontset-font t 'unicode
                      (font-spec :family "Songti TC"
                                 :size 16
                                 ))))

(defun back-to-code ()
  "Set Emacs theme and font to a programming-friendly style."
  (interactive)
  (progn
    (centaur-load-theme centaur-theme)
    (set-face-attribute 'default nil
                        :font "Monaco"
                        :height 140)
    (set-fontset-font t 'unicode
                      (font-spec :family "PingFang SC"
                                 :size 14
                                 ))))

(provide 'init-tricks)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-tricks.el ends here
