# Kimberly Wilber - Advent of Code 2024 entry
# Day 1: Historian Hysteria
# (spark the electric jester 3: Nighttime Phenomena reference ...?)

import std/streams
import std/sequtils
import std/strutils
import std/re
import std/tables
import algorithm
import fusion/matching
import sugar
import math

var list_a: seq[int]
var list_b: seq[int]
var line: string

while stdin.readLine(line):
    case line.split(re"\s+"):
    of [@a, @b]:
        list_a.add parseInt(a)
        list_b.add parseInt(b)
    else:
        echo line
        quit 1

list_a.sort()
list_b.sort()

var res = zip(list_a, list_b).mapIt(abs(it[0] - it[1]))
echo "Sum (part 1): ", res.sum

var counts_b = list_b.toCountTable()
var res2 = list_a.mapIt(counts_b.getOrDefault(it) * it)
echo "Similarity score (part 2): ", res2.sum

