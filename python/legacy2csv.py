#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Oct  6 21:59:53 2019

@author: shane
"""

import sys


# My ID, used as reporter_id
admin_id = 1


# Gets players username and user_id for converting legacy *.txt game-stores
player_lines = []
players = {}
with open('./data/players.csv', 'r') as f:
    for line in f.readlines():
        player_lines.append(line.rstrip())
for i, p in enumerate(player_lines[1:]):
    username = p.split(',')[1]
    players[username] = {'user_id': i + 1}


# Gets scores_*.txt directory and files
score_dir = '../legacy'
singles_file = f'{score_dir}/scores_singles.txt'
doubles_file = f'{score_dir}/scores_doubles.txt'

singles_lines = []
with open(singles_file, 'r') as f:
    for line in f.readlines():
        if not line.startswith('#') and len(line) > 3:
            singles_lines.append(line.rstrip())
doubles_lines = []
with open(doubles_file, 'r') as f:
    for line in f.readlines():
        if not line.startswith('#') and len(line) > 3:
            doubles_lines.append(line.rstrip())


# Writes the modified data to *.csv files, which are SQL ready
with open('data/scores_singles.csv', 'w+') as f:
    f.write('reporter_id,player1_id,player2_id,points,player1_score,player2_score,timestamp,notes,tournament_game\n')
    for l in singles_lines:
        winner_username = l.split()[0]
        loser_username = l.split()[1]

        winner = players[winner_username]['user_id']
        loser = players[loser_username]['user_id']

        f.write(f'{admin_id},{winner},{loser},21,21,,,,\n')

with open('data/scores_doubles.csv', 'w+') as f:
    f.write('reporter_id,player1_id,player2_id,player3_id,player4_id,points,team1_score,team2_score,timestamp,notes,tournament_game\n')
    for l in doubles_lines:
        winner1_username = l.split()[0].split('&')[0]
        winner2_username = l.split()[0].split('&')[1]
        loser1_username = l.split()[1].split('&')[0]
        loser2_username = l.split()[1].split('&')[1]

        winner1 = players[winner1_username]['user_id']
        winner2 = players[winner2_username]['user_id']
        loser1 = players[loser1_username]['user_id']
        loser2 = players[loser2_username]['user_id']

        f.write(f'{admin_id},{winner1},{winner2},{loser1},{loser2},21,21,,,,\n')
