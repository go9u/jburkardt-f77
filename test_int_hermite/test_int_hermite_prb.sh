#!/bin/bash
#
gfortran -c -g test_int_hermite_prb.f >& compiler.txt
if [ $? -ne 0 ]; then
  echo "Errors compiling test_int_hermite_prb.f"
  exit
fi
rm compiler.txt
#
gfortran test_int_hermite_prb.o -L$HOME/libf77/$ARCH -ltest_int_hermite
if [ $? -ne 0 ]; then
  echo "Errors linking and loading test_int_hermite_prb.o"
  exit
fi
rm test_int_hermite_prb.o
#
mv a.out test_int_hermite_prb
./test_int_hermite_prb > test_int_hermite_prb_output.txt
if [ $? -ne 0 ]; then
  echo "Errors running test_int_hermite_prb"
  exit
fi
rm test_int_hermite_prb
#
echo "Test program output written to test_int_hermite_prb_output.txt."
