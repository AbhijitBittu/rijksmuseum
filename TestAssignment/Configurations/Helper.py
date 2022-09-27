import json
import os
import re


def make_file_empty(filename=None):
    with open(file=filename, mode='w+', encoding='utf-8') as file:
        file.seek(0)
        file.truncate(0)
        file.close()