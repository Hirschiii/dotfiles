#!/bin/env bash 

# Gen tabele
echo "<ul>"
table=$(ls -A1 $HOME/Hirschiii.github.io/notes/note-* |\
        sed -nE "/.md/p" |\
        sed "s/.md/.html/" |\
        sed "s/.*\(note-\)/\1/" |\
        sed "s/\(.*--\(.*\)--.*\([ai]\).*\)/\<li\>\<a href='\1'>\2 \3\<\/a\>\<\/li\>/"
    )

# Generate Mathe

# mathe=`ls -A1 $HOME/Hirschiii.github.io/notes/note* |\
#         sed -nE "/.md/p" |\
#         sed "s/.*note-//" |\
#         sed -nE "/mathe/p"
        # sed "s/.*--\(.*\)--.*/\1/" # Get Topic
        # sed "s/\(....\)-..-..-\(..\)-\(.\).*/Jahr: \1; Klasse: \2; HJ: \3/"
        # `


echo "$table"
echo "</ul>"
