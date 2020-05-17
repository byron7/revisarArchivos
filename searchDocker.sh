#!/bin/bash

echo $1
fileDocker="find / -name '${1}'* > ${pwd}/archivosDocker"
buscar="find / -name ${1}"
archivos=$(eval "$buscar")
eval "$fileDocker"
echo "$archivos"

for n in ${archivos}
do
	if [[ -d $n ]]; then
		dirtype="echo '$n is a directory' >> ${pwd}/typeOfFiles"
		eval "$dirtype"
		echo "$n is a directory"
		subDirectorios=$(eval "ls -ltR $n >> ${pwd}/archivosDocker")
		tree=$(eval "tree $n >> ${n//\//.}")
	elif [[ -f $n ]]; then
                filetype="echo '$n is a file' >> ${pwd}/typeOfFiles"
		eval "$filetype"
		echo "$n is a file"
	else
                othertype="echo '$n is another type' >> ${pwd}/typeOfFiles"
		eval "$othertype"
		echo "$n is not valid"
#		exit 1
	fi
done
