# string_utils.py

def capitalize_words(sentence):
    return ' '.join(word.capitalize() for word in sentence.split())

def reverse_string(s):
    return s[::-1]

def count_vowels(s):
    return sum(1 for char in s.lower() if char in 'aeiou')

def is_palindrome(s):
    s = ''.join(char.lower() for char in s if char.isalnum())
    return s == s[::-1]