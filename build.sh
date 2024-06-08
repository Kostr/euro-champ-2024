#!/usr/bin/env bash
# exit on error
set -o errexit

pip install --upgrade pip

poetry install

pip install --upgrade pip
pip install --force-reinstall -U setuptools

if [[ -z $CREATE_SUPERUSER ]];
then
  python euro_champ_2024/manage.py createsuperuser --no-input
fi
python euro_champ_2024/manage.py makemessages -l ru --symlinks
python euro_champ_2024/manage.py compilemessages -l ru
python euro_champ_2024/manage.py collectstatic --no-input
python euro_champ_2024/manage.py showmigrations
python euro_champ_2024/manage.py migrate
