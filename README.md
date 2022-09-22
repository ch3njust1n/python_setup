# python_setup
Automatically setup Python environment

### Setup
1. Place your requirements.txt in this directory if you have one
2. `chmod +x setup.sh`
3. `./setup.sh`

### What does it do?
1. Removes current pyenv
2. Install a fresh pyenv
3. Install the lateste version of Python
4. Create and activate a pyenv environment called base
5. Download the latest Python .gitignore from Github
6. Install pipenv, pipreqs, pre-commit, black, and flake8
7. Install requirements.txt
8. Create pre-commit-config.yaml, which contains hooks for 
- [black](https://github.com/ambv/black)
- [pre-commit hooks](https://github.com/pre-commit/pre-commit-hooks) 
- [python import sorting](https://github.com/asottile/reorder_python_imports)
- [flake8](https://github.com/PyCQA/flake8)
- [pyupgrade](https://github.com/asottile/pyupgrade)

9. Lastly, soureces the `.zshrc`
