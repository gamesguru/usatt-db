#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Oct 18 23:13:48 2019

@author: shane
"""
import json


#
# The league
#

# First conference
smash_bros = {
    "name": 'Super Smash Bros',
    "id": 1,
    "divisions": [
        {
            "name": 'Blind Assassins',
            "type": 1,
            "games": [],
            "members": [
                'rarora13',
                'pmathai',
                'tmechine',
                'bwang55',
                'sjaroch',
            ],
            # Divisional games
            "games": [],
        },
        {
            "name": 'Raspberry Berets',
            "type": 2,
            "games": [],
            "members": [
                'eruff2',
                'adejans',
                'gabhinav',
                'gnurushe',
                'awhiten1',
                'kkesmia',
            ],
            # Divisional games
            "games": [],
        }
    ],
    # Conference games
    "games": [],
}

# Second conference
back_comps = {
    "name": 'Backhanded Compliments',
    "id": 2,
    "divisions": [
        {
            "name": 'Shadow Dancers',
            "type": 1,
            "members": [
                'yhu60',
                'rramac21',
                'hmiriyam',
                'choope20',
                'ychen310',
            ],
            # Divisional games
            "games": [],
        },
        {
            "name": 'Orange Dots',
            "type": 2,
            "members": [
                'aahir',
                'achintar',
                'dvasamse',
                'sdeshmu2',
                'vtalasan',
            ],
            # Divisional games
            "games": [],
        }
    ],
    # Conference games
    "games": [],
}

# Inter-conference games
games = []


#
# Functions
#

# Creates games
def create_games():
    print('''
====================
==> DIVISIONAL GAMES
====================
        ''')
    # Combine the divisions from both conferences
    divisions = smash_bros["divisions"].copy()
    divisions.extend(back_comps["divisions"])
    # Add the games for players inside a division
    for division in divisions:
        members = division["members"]
        print(f'\n--> {division["name"]} ({len(members)} members)')  # Print header
        # Match up only new pairs
        for i, m1 in enumerate(members):
            for j in range(i + 1, len(members)):
                m2 = members[j]
                print(f'{m1.ljust(8)} vs. {m2}')  # Print game
                # Add game
                division["games"].append({"player1": m1, "player2": m2})

    print('''
====================
==> CONFERENCE GAMES
====================
    ''')
    # Add games for players in one division vs. players in another
    for i, d1 in enumerate(smash_bros["divisions"]):
        for j in range(i + 1, len(smash_bros["divisions"])):
            d2 = smash_bros["divisions"][j]
            print('\n--> ' + d1["name"] + ' vs. ' + d2["name"])  # Print header
            for x, m1 in enumerate(d1["members"]):
                for m2 in d2["members"]:
                    print(f'{m1.ljust(8)} vs. {m2}')  # Print game
                    smash_bros["games"].append({"player1": m1, "player2": m2})
    # Same for second conference
    for i, d1 in enumerate(back_comps["divisions"]):
        for j in range(i + 1, len(back_comps["divisions"])):
            d2 = back_comps["divisions"][j]
            print('\n--> ' + d1["name"] + ' vs. ' + d2["name"])  # Print header
            for x, m1 in enumerate(d1["members"]):
                for m2 in d2["members"]:
                    print(f'{m1.ljust(8)} vs. {m2}')  # Print game
                    back_comps["games"].append({"player1": m1, "player2": m2})

    print('''
======================
==> X-CONFERENCE GAMES
======================
    ''')
    # Add games for players in one conference vs. players in another
    s_mems = []
    for d in smash_bros["divisions"]:
        s_mems.extend(d["members"])
    b_mems = []
    for d in back_comps["divisions"]:
        b_mems.extend(d["members"])
    for m1 in s_mems:
        for m2 in b_mems:
            print(f'{m1.ljust(8)} vs {m2}')
            games.append({"player1": m1, "player2": m2})

    return games


#
# Main func
#
def main():
    xgames = create_games()
    games = json.dumps({
        "smash_bros": smash_bros['games'],
        "back_comps": back_comps['games'],
        "xgames": xgames,
    })
    # print(games)
    return games


if __name__ == '__main__':
    main()
