import os


def c2h(c):
    ordinal = ord(c)
    initial_consonant = ordinal // 21
    assert initial_consonant <= 18
    medial_vowel = ordinal % 21
    return chr(initial_consonant * 588 + medial_vowel * 28 + 44032)


def h2c(c):
    hangul = ord(c) - 44032
    initial_consonant = hangul // 588
    medial_vowel = (hangul % 588) // 28
    return chr(initial_consonant * 21 + medial_vowel)


def to_hangul(s):
    return "".join(c2h(c) for c in s)


def from_hangul(s):
    return "".join(h2c(c) for c in s)


def make_flag():
    with open("blah.txt") as f:
        return to_hangul(f.read() + os.environ["HANGUL_FLAG"])


if __name__ == '__main__':
    print(make_flag(), end='')
