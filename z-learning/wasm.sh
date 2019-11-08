#!/bin/sh
####################################################################
#
# create sicp scheme program for rust-elisp/wasmlistp
#
# https://github.com/hidekuno/rust-elisp/tree/master/wasmlisp
#
####################################################################
error() {
  echo $1
  exit 1
}

TARGET=$HOME/picture-language/sicp
[ -d $TARGET ] || error "No Exstis Directory";

for FILE in $TARGET/*.scm
do
  IMAGE=`basename $FILE`
  [ $IMAGE = "roger.scm" ] && continue
  sed -e '/^\;/d' -e '/^[ 	]*$/d' $FILE
done

exit 0
