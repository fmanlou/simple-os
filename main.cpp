extern "C" void kernel_main() {
  unsigned char *vidmem = (unsigned char *)0xb8000;

  vidmem[0] = 'c';
  vidmem[1] = 0x0f;
}
