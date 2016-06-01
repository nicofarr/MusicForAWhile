#!/usr/bin/python
import collections
from os import listdir
from os.path import isfile, join
from math import *

def my_len(w):
   i = 0
   for a in w:
      if a == "0":
         return i
      i += 1
   assert(False)

onlyfiles = [f for f in listdir("EffectiveDataset/major") if isfile(join("EffectiveDataset/major", f))]

alphabet = {}
words = []
curr = 4
for fn in onlyfiles:
   print "Processing "+fn
   f = open("EffectiveDataset/major/"+fn, "r")
   l = f.read()
   #print(l)
   l = l.replace('\n', '')
   l = l.replace('|', '')
   s = l.split("\\")
   for (i,a) in enumerate(s):
      ss = a.split(" ")
      found = 0
      for b in ss:
         if b != '':
            if not found:
               found = 1
               words.append([])
            words[-1].append(b)
      if found:
         words[-1].append("0")
      if i == (len(s)-1):
         words[-1].append("1")
   #if len(words) >= 1003:
      #exit(0)
   f.close()
      #print words[-1]

print("\n\n")
print("#Words in positive dataset: "+str(len(words)))

m = 0.0
for w in words:
   m += float(my_len(w))
m /= float(len(words))
print("Mean size: " + str(m))

v = 0.0
for w in words:
   v += (float(my_len(w))-m)**2
v /= float(len(words))
v = sqrt(v)
print("Standard derivation: " + str(v))

print("Normalizing words and extracting alphabet...")
for i in range(len(words)):
   #print words[i]
   curr = 4
   for (j,c) in enumerate(words[i]):
      if c == "0":
         break
      #print c
      p = [int(s) for s in c if s.isdigit()]
      if c == '~':
         continue
      if p == []:
         words[i][j] += str(curr)
      else:
         curr = p[0]
   #print words[i]
for (i,w) in enumerate(words):
   for c in w:
      if c == "0":
         break
      alphabet[c] = True

for c in sorted(alphabet):
   print c

print("Alphabet length: "+str(len(alphabet)))

state = {}
max_state = 0

for w in words:
   curr_state = 0
   for c in w:
      if c == "0":
         state[curr_state] = {}
         break
      if not curr_state in state:
         state[curr_state] = {}
      if c in state[curr_state]:
         curr_state = state[curr_state][c]
      else:
         max_state += 1
         state[curr_state][c] = max_state
         curr_state = max_state
term = 0
for s in state:
   if len(state[s]) == 0:
      term+=1
print("Automata has "+str(len(state))+" states and "+str(term)+" terminals")

def output_automata(fn):
   global state
   f = open(fn+".dot", "w")
   f.write("digraph { \n")

   for s in state:
      for v in state[s]:
         f.write(str(s)+" -> "+str(state[s][v])+'[label="'+v+'",weight="'+v+'"];\n')
   f.write("}");
   f.close()

print("Outputing current automata on first.dot")
output_automata("first")

