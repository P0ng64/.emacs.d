;;; Commentary:
;;
;; pyim configurations.
;;

;;; Code:


(use-package pyim
  :ensure nil
  :demand t
  :config
  ;; active basedict pinyin dictionary
  (use-package pyim-basedict
    :ensure nil
    :config (pyim-basedict-enable))

  (setq default-input-method "pyim")

  ;; I use quanpin
  (setq pyim-default-scheme 'quanpin)

  (setq-default pyim-english-input-switch-functions
                '(pyim-probe-dynamic-english
                  pyim-probe-isearch-mode
                  pyim-probe-program-mode
                  pyim-probe-org-structure-template))

  (setq-default pyim-punctuation-half-width-functions
                '(pyim-probe-punctuation-line-beginning
                  pyim-probe-punctuation-after-punctuation))

  ;; active pyim-isearch-mode
  (pyim-isearch-mode 1)

  (setq pyim-page-tooltip 'posframe)

  ;; display 5 candidates
  (setq pyim-page-length 5)

  :bind
  (("C-;" . pyim-convert-string-at-point)
   ("C-:" . pyim-delete-word))) ; conbine with pyim-probe-dynamic-english


(provide 'init-pyim)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; init-pyim.el ends here
