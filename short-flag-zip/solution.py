#!/usr/bin/env python3
import string
import zipfile
import zlib

from itertools import product


# Since the flag file is short, and the CRC is of the unencrypted file, we can brute force the flag


def crack():
    crc_prefix = zlib.crc32(b"flag{")
    alphabet = string.ascii_letters + string.digits

    with zipfile.ZipFile("short-flag.zip") as z:
        flag_info = z.getinfo("flag.txt")
        crc = flag_info.CRC
        print("CRC", crc)
        n_guess = flag_info.file_size - len("flag{}")
        print("Guess length", n_guess)
        for content in product(alphabet, repeat=n_guess):
            attempt = ("".join(content) + "}").encode()
            if zlib.crc32(attempt, crc_prefix) == crc:
                print(b"flag{" + attempt)
                return
    raise Exception("FAIL")


crack()
