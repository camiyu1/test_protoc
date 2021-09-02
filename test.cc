#include "test.pb.h"
#include <stdio.h>

int main(int argc, char** argv) {
  test::TestMessage a;
  a.add_bval(1);
  a.add_bval(5);
  a.add_bval(10);

  printf("%d\n", a.bval_size());
  uint8_t* p_a = (uint8_t*)a.bval().data();
  for (int i = 0; i < 9; ++i)
    printf("%d\n", p_a[i]);
}
