#!/bin/bash

set -e
set -x

SRCRPM=$1
SPECDIR=`rpm -E '%_specdir'`
SPEC=$SPECDIR/${SRCRPM/-[0-9]*/.spec}

rpm -i $SRCRPM
sed -i 's@^%package utils@\0\nObsoletes: db4-utils@' $SPEC
rpmbuild --define "_rpmdir rpm/" -bb $SPEC

