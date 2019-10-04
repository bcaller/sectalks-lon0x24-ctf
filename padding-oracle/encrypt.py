from os import environ

from Crypto.Cipher import DES3
from Crypto.Util.Padding import pad


BLOCK_SIZE = 8
KEY = environ["ORACLE_KEY"].encode()
assert len(KEY) == 24
FLAG = environ["ORACLE_FLAG"].encode()
assert FLAG.startswith(b"flag{")

PLAINTEXTS = [
    b'Sir, ' + FLAG + b' is the flag you are looking for',
    b'Yes, ' + FLAG + b' is the flag which you are seeking, sir',
]
for p in PLAINTEXTS:
    assert b'g{' in p[8:], "Unable to decrypt with padding oracle as flag too close to start"

def encrypt(bs):
    cipher = DES3.new(KEY, DES3.MODE_CBC)
    return cipher.iv, cipher.encrypt(pad(bs, BLOCK_SIZE))


for p in PLAINTEXTS:
    iv, ciphertext = encrypt(p)
    print(f"IV: {iv.hex()} MESSAGE: {ciphertext.hex()}")
