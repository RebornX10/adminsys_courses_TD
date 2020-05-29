#!/bin/bash

for i in /tmp/in/*;
do tar -czf $i.tar.gz $i;
# for ii in /tmp/in/*;
mv /tmp/in/*.gz /tmp/out/;
done
for i in /tmp/in/*;
do  rm -rf /tmp/in/*;
done;
