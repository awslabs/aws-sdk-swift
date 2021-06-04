#!/bin/bash

OUTPUT_DIR = "../aws-models/"
mkdir newmodels
cd newmodels
git clone https://github.com/aws/aws-models.git
cd ..

for smithymodel in /newmodels/*/smithy/model.json; do
   # read file

   #get sdk id

   #get version

   #create new file name from sdk id and version

   # mv smithymodel to OUTPUT_DIR/newfilename
