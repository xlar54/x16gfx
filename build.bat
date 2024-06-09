64tass --m65c02 -m -a ./src/x16_demo1.asm -l ./target/x16_demo1.lbl -L ./target/x16_demo1.lst -o ./target/demo1
64tass --m65c02 -m -a ./src/x16_demo2.asm -l ./target/x16_demo2.lbl -L ./target/x16_demo2.lst -o ./target/demo2
del F:\Software\Emulation\X16\demo1
del F:\Software\Emulation\X16\demo2
copy .\target\demo1 F:\Software\Emulation\X16\demo1
copy .\target\demo2 F:\Software\Emulation\X16\demo2
