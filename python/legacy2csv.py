#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Oct  6 21:59:53 2019

@author: shane
"""

import sys

score_dir = sys.argv[1]
singles_file = f'{score_dir}/scores_singles.txt'
doubles_file = f'{score_dir}/scores_doubles.txt'

lines = []
with open(singles_file, 'r') as f:
    for line in f.readlines():
        lines.append(line.rstrip())

print(lines)
