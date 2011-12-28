#!/bin/bash

function failed()
{
  echo "Failed $*: $@" >&2
  exit 1
}

export OUTPUT=$WORKSPACE/output
rm -rf $OUTPUT
mkdir -p $OUTPUT

/Developer/usr/bin/xcodebuild -target JSONKit -configuration Release build || failed build;

cd $WORKSPACE/build/Release-iphoneuniversal || failed output;
rm JSONKit
zip -r -y -9 $OUTPUT/JSONKit.framework.zip JSONKit.framework
