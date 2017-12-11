#!/bin/bash
# Configure emacs for terraform scrpts development
mkdir -p .emacs.d/lisp
rm -vf ~/.emacs.d/lisp/terraform-mode.el
echo "Downloading the latest version of terraform-mode.el from github."
curl -s -o ~/.emacs.d/lisp/terraform-mode.el 'https://raw.githubusercontent.com/syohex/emacs-terraform-mode/master/terraform-mode.el'
rm -vf ~/.emacs.d/lisp/hcl-mode.el
echo "Downloading the latest version of hcl-mode.el from github."
curl -s -o ~/.emacs.d/lisp/hcl-mode.el 'https://raw.githubusercontent.com/syohex/emacs-hcl-mode/master/hcl-mode.el'
if ! grep -s -H 'terraform-mode' ~/.emacs; then
    echo "Adding terraform-mode configuration path to ~/.emacs"
    echo '
;;; Set location for external packages.
(add-to-list '"'"'load-path "~/.emacs.d/lisp")
;;; Load terraform library
(load-library "terraform-mode")
' >>~/.emacs
else
    echo "The terraform-mode configuration is already present in the .emacs file."
fi
