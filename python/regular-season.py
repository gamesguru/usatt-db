#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Oct 18 23:13:48 2019

@author: shane
"""

# Two conferences
smash_bros = [
        'pmathai',
        'tmechine',
        'rarora13',
        'ychen310',
        'sjaroch',
        'gabhinav',
        'adejans',
        'achintar',
        'gnurushe',
        'vtalasan'
        ]
back_comps = [
        'yhu60',
        'rramac21',
        'hmiriyam',
        'choope20',
        'eruff2',
        'awhiten1',
        'aahir',
        'dvasamse',
        'sdeshmu2',
        'kkesmia']

# Create games
sb_games = []
for i in range(0, len(smash_bros)):
    for j in range(i + 1, len(smash_bros)):
        if i != j:
            sb_games.append(f'{smash_bros[i].ljust(8)} vs {smash_bros[j]}')
bc_games = []
for i in range(0, len(back_comps)):
    for j in range(i + 1, len(back_comps)):
        if i != j:
            bc_games.append(f'{back_comps[i].ljust(8)} vs {back_comps[j]}')

# Print games
print('==> Super Smash bros')
for g in sb_games:
    print(g)

print('\n==> Backhanded Compliments')
for g in bc_games:
    print(g)
