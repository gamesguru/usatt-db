#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Oct 18 23:13:48 2019

@author: shane
"""

meta_info = {

}

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
            ]
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
            ]
        }
    ]
}

back_comps = {
    "name": 'Backhanded Compliments',
    "id": 2,
    "divisions": [
        {
            "name": 'Shadow Dancers',
            "type": 1,
            "games": [],
            "members": [
                    'yhu60',
                    'rramac21',
                    'hmiriyam',
                    'choope20',
                    'ychen310',
            ]
        },
        {
            "name": 'Orange Dots',
            "type": 2,
            "games": [],
            "members": [
                    'aahir',
                    'achintar',
                    'dvasamse',
                    'sdeshmu2',
                    'vtalasan',
            ]
        }
    ]
}


def main():
    print(
        f'[Smash Bros] -- Blind Assassins  .. {len(smash_bros["divisions"][0]["members"])} members')
    print(
        f'[Smash Bros] -- Raspberry Berets .. {len(smash_bros["divisions"][1]["members"])} members')
    print(
        f'[Back Comps] -- Shadow Dancers   .. {len(back_comps["divisions"][0]["members"])} members')
    print(
        f'[Back Comps] -- Orange Dots      .. {len(back_comps["divisions"][1]["members"])} members\n')

    # Create games
    # sb_games = []
    # for i in range(0, len(league["smash_bros"])):
    #     for j in range(i + 1, len(league["smash_bros"])):
    #         if i != j:
    #             sb_games.append(
    #                 f'{league["smash_bros"][i].ljust(8)} vs {league["smash_bros"][j]}')
    # bc_games = []
    # for i in range(0, len(league["back_comps"])):
    #     for j in range(i + 1, len(league["back_comps"])):
    #         if i != j:
    #             bc_games.append(
    #                 f'{league["back_comps"][i].ljust(8)} vs {league["back_comps"][j]}')
    # mix_games = []
    # for i in range(0, len(league["smash_bros"])):
    #     for j in range(0, len(league["back_comps"])):
    #         mix_games.append(
    #             f'{league["smash_bros"][i].ljust(8)} vs {league["back_comps"][j]}')

    # # Print games
    # print(f'==> Super Smash bros [3-GAME MATCHES] ({len(sb_games)})')
    # for g in sb_games:
    #     print(g)

    # print(f'\n==> Backhanded Compliments [3-GAME MATCHES] ({len(bc_games)})')
    # for g in bc_games:
    #     print(g)

    # print(f'\n==> Mixed league [1 GAME DUELS] ({len(mix_games)})')
    # for g in mix_games:
    #     print(g)

    # games = sb_games.append(bc_games).append(mix_games)
    games = []
    return games


if __name__ == '__main__':
    main()
