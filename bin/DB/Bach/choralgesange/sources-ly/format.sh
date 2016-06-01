./get_transposed.py *.ly
rm *.pdf
rm *.midi
./get_soprano.py *.ly
sed -i s/}//g *.in
sed -i s/{//g *.in
sed -i s/\\fermata/\\\ /g *.in
sed -i s/%.*//g *.in
sed -i -e 's/^[ \t]*//' *.in
sed -i '/^$/d' *.in
sed -i 's/\\fermata/ \\/g' *.in
sed -i 's/\\bar.*//g' *.in
mkdir visual
lilypond *.ly > /dev/null
mv *.pdf visual
mv *.midi visual
mkdir ly
mv *.ly ly
rm tmp_transpo