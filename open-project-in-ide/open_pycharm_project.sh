#!/bin/bash

###############
# Open a PyCharm window for the current folder
# (C) 2021 Natalie Clarius <natalie_clarius@yahoo.de>
# GNU General Public License v3.0
###############

projname=$(dirname $1)
pycharm $projname
