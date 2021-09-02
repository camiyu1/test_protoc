#include "test.pb.h"
#include <stdio.h>

int main(int argc, char** argv) {
  aix::TestMessage a;
  a.add_test(1);
  a.add_test(5);
  a.add_test(10);

  uint8_t* p_a = (uint8_t*)a.test().data();
  for (int i = 0; i < 10; ++i)
    printf("%d\n", p_a[i]);
}
