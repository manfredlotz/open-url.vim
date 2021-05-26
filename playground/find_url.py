#! /usr/bin/env python3

# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2021 manfred <manfred.lotz@posteo.de>
#
# Distributed under terms of the MIT license.


import os
import re
import urls

def find_urls(line: str):
  regex = re.compile('((https?):((//)|(\\\\))+([\w\d:#@%/;$()~_?\+-=\\\.&](#!)?)*)', re.DOTALL)

  urls = re.findall(regex,line)
  if urls:
    # enclose found URLs in single quotes
    found = [f"'{x[0]}'" for x in urls]
    urls_str = ' '.join(found)
    return urls_str

def main() -> None:
    for url in urls.urls:
        found = find_urls(url)
        print(f'{url}:  {found}')


if __name__ == "__main__":
    main()

