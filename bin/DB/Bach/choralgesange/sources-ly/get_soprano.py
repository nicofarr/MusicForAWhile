#!/usr/bin/python
import sys

print 'Number of arguments:', len(sys.argv), 'arguments.'
print 'Argument List:', str(sys.argv)

def get_soprano(file):
   print "Processing "+file
   newfile = file.split(".")[0]+"_soprano.ly"
   print "Outputing on "+newfile

   f = open(file, "r")
   l = f.read().split("\n")
   ll = []
   com = 0
   found = 0
   for a in l:
      if a.find("\\new Staff = \"lower\" \\lower") != -1:
         ll.append("%"+a)
      elif a.find("\unfoldRepeats") != -1:
         ll.append('\unfoldRepeats { << \\guidemidi \\upper >> }')
      elif a.find("{ \\voiceTwo") != -1 and not found:
         com = 1
         found = 1
         ll.append("%"+a)
      elif a.find("} >>") != -1 and com:
         com = 0
         ll.append("%"+a+"\n >>")
      else:
         if com == 1:
            ll.append("%"+a)
         else:
            ll.append(a)
   ff = open(newfile, "w")
   for a in ll:
      ff.write(a)
      ff.write("\n")
   ff.close()
   f.close()

   remember = newfile
   k = 0
   if newfile.find('transposed') != -1:
      newfile = 'tmp_transpo'
      k = 1

   f = open(newfile, 'r')
   ff = open(remember.split('.')[0]+".in", "w")
   print "Outputing on " + remember
   l = f.read().split("\n")

   if k == 0:
      on = 0
      found = 0
      to_keep = []
      for a in l:
         if a.find("fin de relative") != -1:
            on = 0
         if on:
            to_keep.append(a)
         if a.find("\\relative") != -1 and not found:
            on = 1
            found = 1
      f.close()

      for (i,a) in enumerate(to_keep):
         if a.find("\\repeat") == -1:
            ff.write(a)
            if i < len(to_keep)-1:
               ff.write("\n")
   else:
      on = 0
      found = 0
      to_keep = []
      for a in l:
         if on:
            to_keep.append(a)
         if a.find("\\bar") != -1:
            on = 0
         if a.find("acoustic grand") != -1 and not found:
            on = 1
            found = 1
      f.close()

      for (i,a) in enumerate(to_keep):
         if a.find("\\repeat") == -1:
            ff.write(a)
            if i < len(to_keep)-1:
               ff.write("\n")
      return



   ff.close()

for i in range(1, len(sys.argv)):
   get_soprano(str(sys.argv[i]))
