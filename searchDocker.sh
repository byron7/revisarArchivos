#!/bin/bash

echo $1
fileDocker="find / -name '${1}'* > /home/osboxes/Documents/archivosDocker"
buscar="find / -name *'${1}'*"
archivos=$(eval "$buscar")
eval "$fileDocker"
echo "$archivos"

for n in ${archivos}
do
	if [[ -d $n ]]; then
		dirtype="echo '$n is a directory' >> /home/osboxes/Documents/typeOfFiles"
		eval "$dirtype"
		echo "$n is a directory"
		subDirectorios=$(eval "ls -ltR $n >> /home/osboxes/Documents/archivosDocker")
		tree=$(eval "tree $n >> ${n//\//.}")
	elif [[ -f $n ]]; then
                filetype="echo '$n is a file' >> /home/osboxes/Documents/typeOfFiles"
		eval "$filetype"
		echo "$n is a file"
	else
                othertype="echo '$n is another type' >> /home/osboxes/Documents/typeOfFiles"
		eval "$othertype"
		echo "$n is not valid"
#		exit 1
	fi
done
