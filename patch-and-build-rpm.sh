#!/bin/bash

set -e
set -x

SRCRPM=$1
SPECDIR=`rpm -E '%_specdir'`
SPEC=$SPECDIR/${SRCRPM/-[0-9]*/.spec}

rpm -i $SRCRPM
sed -i 's@Requires: /usr/bin/gdb-add-index@#\0@' $SPEC
sed -i 's@Requires: pkgconfig >= 1:0.24@Requires: pkgconfig@' $SPEC
rpmbuild --define "_rpmdir rpm/" -bb $SPEC

