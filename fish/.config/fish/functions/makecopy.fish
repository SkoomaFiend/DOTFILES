function makecopy
    if test (count $argv) -eq 0
        echo "Usage: copyfilewithid <path-to-file>"
        return 1
    end

    set file $argv[1]
    if not test -f "$file"
        echo "Error: '$file' is not a file."
        return 1
    end

    set dir (dirname "$file")
    set filename (basename "$file")
    set extension (string match -r '\.[^.]*$' -- "$filename")
    set base (string replace "$extension" "" -- "$filename")

    read -p "" identifier
    if test -z "$identifier"
        echo "Canceled."
        return 1
    end

    if test -n "$extension"
        set newfile "$dir/$base"_"$identifier""$extension"
    else
        set newfile "$dir/$base"_"$identifier"
    end

    cp "$file" "$newfile"
    echo "Copied to: $newfile"
end

