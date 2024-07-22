import SimpleFile;

external putchar: void(:cint);

contents :: read "input.txt";

cfor
  i :: 0;
  i < contents.size;
  i := i + 1; {
  putchar @contents.data[i];
};

-contents;
