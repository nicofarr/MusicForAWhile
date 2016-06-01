#!/usr/bin/python
import sys
import os

print 'Number of arguments:', len(sys.argv), 'arguments.'
print 'Argument List:', str(sys.argv)

def get_transposed(file):
   print "Processing "+file
   newfile = file.split(".")[0]+"_transposed.ly"
   print "Outputing on "+newfile

   f = open(file, "r")
   l = f.read().split("\n")

   k = ''
   for a in l:
      if a.find("key") != -1:
         for (i,b) in enumerate(a.split(" ")):
            if i != 0 and b != '':
               k = b
               break
   f.close()
   print "Key: "+str(k)

  
   ff = open(newfile, "w")

   to_w = []
   m = 0
   for a in l:
      to_w.append(a)
      if a.find("upper = {") != -1:
         to_w.append("\\displayLilyMusic \\transpose "+k+" c {")
      if a.find("lower = {") != -1:
         to_w.append("\\transpose "+k+" c {")
      if a.find(">>") != -1 and m < 2:
         to_w.append("}")
         m+=1

   for a in to_w:
      ff.write(a)
      ff.write("\n")
   ff.close()

   os.system("lilypond "+newfile+" > tmp_transpo")

for i in range(1, len(sys.argv)):
   get_transposed(str(sys.argv[i]))