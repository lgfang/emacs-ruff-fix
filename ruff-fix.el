;;; ruff-fix.el --- Ruff fix linting errors -*- lexical-binding: t; -*-

;; Copyright (C) 2025 Fang Lungang

;; Author: Fang Lungang
;; URL: https://github.com/lgfang/emacs-ruff-fix
;; Package-Requires: ((emacs "29") (reformatter "0.8"))
;; Version: 0.1

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;; Fix linting errors in Python source code using Ruff. It can be used as a
;; reformatter.

;;; Code:

(require 'reformatter)

(defcustom ruff-binary "ruff"
  "The Ruff binary to be used. Customize it if ruff is not in PATH."
  :type 'string
  :group 'ruff-fix)

(defcustom ruff-command '("check" "--fix")
  "The Ruff command to be used."
  :type '(repeat string)
  :group 'ruff-fix)

;;;###autoload (autoload 'ruff-fix-buffer "ruff-fix" nil t)
;;;###autoload (autoload 'ruff-fix-region "ruff-fix" nil t)
;;;###autoload (autoload 'ruff-fix-on-save-mode "ruff-format" nil t)
(reformatter-define ruff-fix
  :program ruff-binary
  :args (append ruff-command (list "--stdin-filename" (or (buffer-file-name) input-file)))
  :lighter " RuffFix"
  :group 'ruff-fix)

(provide 'ruff-fix)
;;; ruff-fix.el ends here
