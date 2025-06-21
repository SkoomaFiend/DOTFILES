function runasm
    set file $argv[1]
    set name (string replace -r '\.asm$' '' $file)

    nasm -f elf64 $file -o $name.o; or return
    ld $name.o -o $name; or return
    ./$name; or return
end
