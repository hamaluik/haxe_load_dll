# haxe_load_dll

Sample showing creating a dynamic library (with [Rust](https://www.rust-lang.org/)) and loading and using it in [Haxe](https://haxe.org/) (for the CPP target).

## Instructions

1. Compile the dynamic library `my_library` (using rust):
    ```bash
    $ cd my_library && cargo build --release && cd ..
    ```
2. Compile the haxe program `testapp`:
    ```bash
    $ cd testapp && haxe build.hxml
    ```
3. Run it!:
    ```bash
    $ ./build/Main ../my_library/target/release/libmy_libary.so
    src/Main.hx:16: Adding two...
    src/Main.hx:18: 0 -> 2
    src/Main.hx:18: 1 -> 3
    src/Main.hx:18: 2 -> 4
    src/Main.hx:18: 3 -> 5
    src/Main.hx:18: 4 -> 6
    src/Main.hx:18: 5 -> 7
    src/Main.hx:18: 6 -> 8
    src/Main.hx:18: 7 -> 9
    src/Main.hx:18: 8 -> 10
    src/Main.hx:18: 9 -> 11
    src/Main.hx:21: Calculating the sum of the first 10 numbers in the Fibonacci sequence:
    src/Main.hx:22: 88
    ```