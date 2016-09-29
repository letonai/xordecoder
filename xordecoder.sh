#!/bin/bash

#####################
#WebSphere XOR decoder
#
#Ricardo Letonai
#
#20160929
#####################

function ord {
        printf %d "'$1";
}
e=`echo $1 | base64 --decode` #HB8sK28tbns=
seq 0 $((${#e}-1)) | while read line
do
        #echo ${e:$line:1};done
        char=$((`ord ${e:$line:1}` ^ `ord _`))
        printf \\$(printf '%03o' $char)
done

