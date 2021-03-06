#!/bin/bash
#
gfortran -c -g asa239_prb.f >& compiler.txt
if [ $? -ne 0 ]; then
  echo "Errors compiling asa239_prb.f"
  exit
fi
rm compiler.txt
#
gfortran asa239_prb.o -L$HOME/libf77/$ARCH -lasa239
if [ $? -ne 0 ]; then
  echo "Errors linking and loading asa239_prb.o"
  exit
fi
rm asa239_prb.o
#
mv a.out asa239_prb
./asa239_prb > asa239_prb_output.txt
if [ $? -ne 0 ]; then
  echo "Errors running asa239_prb"
  exit
fi
rm asa239_prb
#
echo "Test results written to asa239_prb_output.txt."
