function gpp
    if test (count $argv) -eq 0
        echo "Usage: gpp <filename.cpp>"
        return 1
    end

    set filename (basename $argv[1] .cpp)
    g++ -o $filename "$filename.cpp" && ./$filename 
end

