[flags]

- Can combine commands flags as long as they don't take an argument
- Separate them if they take arguments 




[networking]

# ss
- shows open sockets and connections


# ssh

## -t
- use when need interactive shell for htop 

      -t fish 
- use specified shell 





[file management]

# borg

### examples 

    borg list /mnt/windows//Users/Daniel/Documents/linux_backup
- List borg snapshots in repo 

      borg info /mnt/windows//Users/Daniel/Documents/linux_backup::version-0.01
- List files in a snapshot 

# ln

## -s 
- create symbolic links

### examples
    ln -s <source path> <link name>
- creates link to directory 





[network file management]
# scp

- File destination must have sshd running
- scp (source) (destination)
- source is always first

### examples

    scp user@ip:path destination 
- copy file from source to destination


      scp path ip:destination
- copy file from source to destination

# git
    

### examples

    git add . -> git commit -m "description" -> git push 
- Add all files in current directory to commit and then push 

        git clone url.git
- copy repo  




[audio]

# ffmpeg

### examples 

    ffmpeg -i {{path/to/video.mp4}} -vn {{path/to/sound.mp3}}
- Extract the sound from a video and save it as MP3


        ffmpeg -i {{path/to/input_video.mp4}} -ss {{mm:ss}} -to {{mm2:ss2}} {{[-c|-codec]}} copy {{path/to/output_video.mp4}}
- Trim a video from a given start time mm:ss to an end time mm2:ss2 (omit the -to flag to trim till the end)


        ffmpeg -i {{path/to/input_video}}.avi {{[-c|-codec]}}:a aac -b:a 128k {{[-c|-codec]}}:v libx264 -crf 23 {{path/to/output_video}}.mp4
- Convert AVI video to MP4. AAC Audio @ 128kbit, h264 Video @ CRF 23





[packages]

# pacman 

### examples 


    pacman -Qet
- To list all packages explicitly installed and not dependencies 





[text search]
# rg
- recursively search directory for every matching word

# grep 
- find word in file 

## -x

    Select only those matches that exactly match the whole line.
    Can be used to find sections like Synopsis on man Pages

## -A num
- After grep finds line print the give argument number of lines




[file search]

# find
- By default has no maxdepth 

## -iname 
- case insenitive search

## cmin (+/-)num
- find files creation time
- + and - arguments say less than or greater than give number of minutes

## ctime (+/-)num
- same as cmin but uses days for num

## mtime / mmin
- like ctime/cmin but last modified time

## -or
- use multiple separate parameters
- put after -name

## -and
- like or but both expressions must be true

## -not
- like and but both are false

### examples
    
    find Downloads/ -type f -name "*.md" -or -type f -name "*.rar"
- find all .rar and .md files 

      find . -maxdepth 1 -type f ! -name "*.mp4" -exec mv "{}" "{}.mp4" \; 
- finds all files in current directory that don't have the .mp4 extension and appends .mp4 onto the





[disk]

# df
- shows total disk usage 

# which
- shows given exe path 

[users]

# su 
- switch to another user 





[proceses]

# ps

## --sort
- Sorts from low to high of specifier

--sort specifier

Specifiers : 

    %cpu
    %mem

# jobs
- list active jobs

# pstree
- list process tree

# jobs
- command & 

## fg %num
- takes job number and puts it into the foreground (like without &)

## bg %num
- puts jobs back into background 




