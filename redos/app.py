#!/usr/local/bin/python -u

import os
import re
import sys


REGEXES = [
    r'^(.*)-L0Nd/(\d+)\.?(\d+)?.?(\d+)?.?(\d+)? SecTalks!',
    r'(CTF)/(?![0-9])\d\.[0-9]+\.[0-9]+ \([^,]*, *(L0)N *, *([^,]*) *,[^,]*,[^,]*,\)',
]


if __name__ == '__main__':
    REGEX = REGEXES[int(sys.argv[1])]
    if len(sys.argv) != 3:
        print(REGEX)
    else:
        attempt = os.environ["ATTEMPT"]
        print(">>>", attempt)
        if re.search(REGEX, attempt):
            print('Regex satisfied :)')
        else:
            print('Regex unsatisfied :(')
