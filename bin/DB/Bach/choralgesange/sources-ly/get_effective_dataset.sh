i=0
j=0
for d in *;
do
if [ -d "${d}" ] ; then
   a=`echo $d | sed 's/\///g'`
   b="_transposed_soprano.in"
   c=".ly"
   e=$d"/ly/"$a$c
   a=$d"/"$a$b
   if grep "major" $e
   then
      i=$((i+1))
      cp $a ../../../../EffectiveDataset/major/
   else
      j=$((j+1))
      cp $a ../../../../EffectiveDataset/minor/
   fi
fi
done
echo $i" major"
echo $j" minor"
echo $((i+j))