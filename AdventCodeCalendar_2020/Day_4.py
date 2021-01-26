# -*- coding: utf-8 -*-
"""
Created on Sun Jan 24 20:49:30 2021

@author: c-ba7
"""


# Open the input file
inputfile = open(r"C:\Users\c-ba7\Documents\Github\Challenges\AdventCodeCalendar_2020\Inputs\input_day4.txt", 'r')

# Parse lines
data = [x.strip() for x in inputfile.readlines()]

def part1(data):
    valid_passport_count = 0
    required_fields = ['byr' ,'iyr' ,'eyr' ,'hgt' ,'hcl' ,'ecl' ,'pid']

    # Variable to track number of required fields for current passport
    current = 0
    for line in data:
        if line == '':                              # Empty line indicates new passport
            if current == len(required_fields):
                valid_passport_count += 1
            current = 0
            continue

        for field in line.split():
            key, val = field.split(':')
            if key in required_fields:
                current += 1

    return valid_passport_count

print ("Solution part 1: %d" % part1(data))