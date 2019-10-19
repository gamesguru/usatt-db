#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Oct 18 23:13:48 2019

@author: shane
"""
import requests
import json

# Two conferences
smash_bros_usernames = ["pmathai", "tmechine", "rarora13", "sjaroch", "gabhinav", "achintar", "gnurushe", "vtalasan"]
back_comps_usernames = ["yhu60", "rramac21", "hmiriyam", "choope20", "aahir", "dvasamse", "sdeshmu2", "kkesmia"]

# Get user_ids
users = {}
with open('./data/users.csv', 'r') as f:
    for l in f.readlines()[1:]:
        l = l.rstrip()
        user_id = l.split(',')[0]
        username = l.split(',')[1]
        users[username] = user_id

smash_bros_ids = set()
back_comps_ids = set()
for u in smash_bros_usernames:
    smash_bros_ids.add(int(users[u]))
for u in back_comps_usernames:
    back_comps_ids.add(int(users[u]))

smash_bros_ids = sorted(smash_bros_ids)
back_comps_ids = sorted(back_comps_ids)

# Get current ratings
rating_url = 'https://usatt-server.herokuapp.com/ratings'
print(f'GET {rating_url}')
ratings = json.loads(requests.get(rating_url).text)['data']['singles_ratings']

for p in ratings:
    print(p)
