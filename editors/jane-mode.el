;;; jane-mode.el --- Defines a major mode for Jane -*- lexical-binding: t; -*-

;; Copyright (c) 2021 Chander Govindarajan
;; Version: 0.0.1

(defgroup jane nil
  "A mode for Jane"
  :group 'languages)

(defvar jane-mode-syntax-table
  (let ((table (make-syntax-table)))

    ;; Comments start with a '#' and end with a newline
    (modify-syntax-entry ?# "<" table)
    (modify-syntax-entry ?\n ">" table)

    table))

(defconst jane-symbol '(one-or-more (or (syntax word) (syntax symbol))))
(defconst jane-start-of-sexp '(sequence "(" (zero-or-more (or space "\n"))))
(defconst jane-var-decl-forms
  '("define"))
(defconst jane-func-decl-forms
  '("lambda"))
(defconst jane-variable-declaration-pattern
  (rx-to-string `(,@jane-start-of-sexp
                  (or ,@jane-var-decl-forms)
                  (one-or-more space) (group ,jane-symbol))))

(defcustom jane-special-forms
  `(
    "if"
    "do"
    "quote"
    ,@jane-var-decl-forms
    ,@jane-func-decl-forms
    )
  "List of Jane special forms."
  :type '(repeat string)
  :group 'jane)


(defconst jane-special-form-pattern
  (let ((builtins (cons 'or jane-special-forms)))
    (rx-to-string `(,@jane-start-of-sexp (group ,builtins) symbol-end))))

(defconst jane-function-pattern
  (rx-to-string `(,@jane-start-of-sexp (or ,@jane-func-decl-forms) (one-or-more space)
                  (group "(" (zero-or-more (or ,jane-symbol space)) ")" ))))

(defconst jane-var-decl-pattern
  (rx-to-string `(,@jane-start-of-sexp
                  (or ,@jane-var-decl-forms)
                  (one-or-more space) (group ,jane-symbol))))

(defconst jane-constant-pattern
  (rx-to-string `(group (or "()" "true" "false"))))

(defconst jane-highlights
  `((,jane-special-form-pattern . (1 font-lock-keyword-face))
    (,jane-function-pattern . (1 font-lock-function-name-face))
    (,jane-var-decl-pattern . (1 font-lock-variable-name-face))
    (,jane-constant-pattern . (1 font-lock-constant-face))
    ))

;;;###autoload
(define-derived-mode jane-mode prog-mode "jane"
  "Major mode for the Jane language"
  :syntax-table jane-mode-syntax-table
  (setq-local font-lock-defaults '(jane-highlights))
  (setq-local comment-start "#")
  (setq-local comment-start-skip "#+ *")
  (setq-local comment-use-syntax t)
  (setq-local comment-end "")
  )

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.jane\\'" . jane-mode))

;;;###autoload
(add-to-list 'interpreter-mode-alist '("jane" . jane-mode))

(provide 'jane-mode)
