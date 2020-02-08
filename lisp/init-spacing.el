;; init-spacing.el --- Initialize electric-spacing.

;; Commentary:
;;
;; electric-spacing init
;;
;; Remember to add new modes.


;;; Code:

(eval-when-compile
  (require 'init-custom))

(use-package electric-operator
  :commands electric-operator-mode
  :init
  (add-hook 'c-mode-hook #'electric-operator-mode)
  (add-hook 'c++-mode-hook #'electric-operator-mode)
  :config
  (electric-operator-mode 1))

(provide 'init-spacing)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-spacing.el ends here
