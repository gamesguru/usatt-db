#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Oct 18 23:13:48 2019

@author: shane
"""
import json


# Settings
NUM_GAMES_DIVISION = 1
NUM_GAMES_CONFERENCE = 1
NUM_GAMES_X_CONFERENCE = 0


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

# Total number of games
total_games = []


#
# Functions
#
def create_games():
    print('''
DIVISIONAL GAMES
        ''')
    # Combine the divisions from both conferences
    divisions = smash_bros["divisions"].copy()
    divisions.extend(back_comps["divisions"])

    # Add the games for players inside a division
    for division in divisions:
        members = division["members"]
        print('\n' + division["name"])  # Print header
        # Match up only new pairs
        for x, m1 in enumerate(members):
            # Create multiples of the same game
            for g in range(0, NUM_GAMES_DIVISION):
                for y in range(x + 1, len(members)):
                    m2 = members[y]
                    print(f'{m1.ljust(8)} vs. {m2}')  # Print game
                    # Add game
                    game = {"player1": m1, "player2": m2}
                    division["games"].append(game)
                    total_games.append(game)
        print(f'\nTotal: {len(division["games"])} games')

    print('''
CONFERENCE GAMES
    ''')
    # Add games for players in one division vs. players in another
    for i, d1 in enumerate(smash_bros["divisions"]):
        for j in range(i + 1, len(smash_bros["divisions"])):
            d2 = smash_bros["divisions"][j]
            print('\n' + d1["name"] + ' vs. ' + d2["name"])  # Print header
            for x, m1 in enumerate(d1["members"]):
                # Create multiples of the same game
                for g in range(0, NUM_GAMES_CONFERENCE):
                    for m2 in d2["members"]:
                        game = {"player1": m1, "player2": m2}
                        print(f'{m1.ljust(8)} vs. {m2}')  # Print game
                        smash_bros["games"].append(game)
                        total_games.append(game)
    print(f'\nTotal: {len(smash_bros["games"])} games')

    # Same for second conference
    for i, d1 in enumerate(back_comps["divisions"]):
        for j in range(i + 1, len(back_comps["divisions"])):
            d2 = back_comps["divisions"][j]
            print('\n' + d1["name"] + ' vs. ' + d2["name"])  # Print header
            for x, m1 in enumerate(d1["members"]):
                # Create multiples of the same game
                for g in range(0, NUM_GAMES_CONFERENCE):
                    for m2 in d2["members"]:
                        game = {"player1": m1, "player2": m2}
                        print(f'{m1.ljust(8)} vs. {m2}')  # Print game
                        back_comps["games"].append(game)
                        total_games.append(game)
    print(f'\nTotal: {len(back_comps["games"])} games')

    print('''
X-CONFERENCE GAMES
    ''')
    # Add games for players in one conference vs. players in another
    s_mems = []
    for d in smash_bros["divisions"]:
        s_mems.extend(d["members"])
    b_mems = []
    for d in back_comps["divisions"]:
        b_mems.extend(d["members"])

    for m1 in s_mems:
        # Create multiples of the same game
        for i in range(0, NUM_GAMES_X_CONFERENCE):
            for m2 in b_mems:
                print(f'{m1.ljust(8)} vs {m2}')
                game = {"player1": m1, "player2": m2}
                games.append(game)
                total_games.append(game)
    print(f'\nTotal: {len(games)} games')

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
    print(f'\nGrand total: {len(total_games)} games')
    return games


if __name__ == '__main__':
    main()
