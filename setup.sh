#!/bin/bash
#
# Make this script executable:
# chmod +x setup.sh
#
# Show .git folder in VSCode on OSX for pre-commit
# 1. cmd + ,
# 2. search "files exclude"
# 3. remove "**/.git"

start=$SECONDS

yes | rm -r ~/.pyenv

curl https://pyenv.run | bash

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

pyenv update
pyenv install 3:latest
pyenv local 3:latest

pyenv virtualenv base
pyenv activate base

python -m venv .venv
source .venv/bin/activate

curl https://raw.githubusercontent.com/github/gitignore/main/Python.gitignore --output .gitignore

pip3 install pipenv
pipenv shell

pipenv install --dev pipreqs
pipenv install --dev pre-commit
pipenv install --dev black
pipenv install --dev flake8

pipreqs
pipenv install -r ./requirements.txt

precommitConfig = "repos:
-   repo: https://github.com/ambv/black
    rev: 22.8.0
    hooks:
    - id: black
      language_version: python3

repo: https://github.com/pre-commit/pre-commit-hooks
rev: v3.2.0
hooks:
- id: check-yaml
- id: check-added-large-files
- id: debug-statements
- id: detect-private-key
- id: detect-aws-credentials
- id: end-of-file-fixer
- id: mixed-line-ending
- id: name-tests-test
- id: pretty-format-json
- id: trailing-whitespace
  language_version: python3

repo: https://github.com/asottile/reorder_python_imports
rev: v3.8.2
hooks:
- id: reorder-python-imports

repo: https://github.com/PyCQA/flake8
rev: 5.0.4
hooks:
- id: flake8
  language_version: python3

repo: https://github.com/asottile/pyupgrade
rev: v2.38.0
- id: pyupgrade"

echo precommitConfig > pre-commit-config.yaml

pre-commit install

source ~/.zshrc

echo $(( SECONDS - start ))
