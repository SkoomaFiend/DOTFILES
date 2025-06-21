# ffmpeg

> Video conversion tool.
> More information: <https://ffmpeg.org>.

- Extract the sound from a video and save it as MP3:

`ffmpeg -i {{path/to/video.mp4}} -vn {{path/to/sound.mp3}}`


- Trim a video from a given start time mm:ss to an end time mm2:ss2 (omit the -to flag to trim till the end):

`ffmpeg -i {{path/to/input_video.mp4}} -ss {{mm:ss}} -to {{mm2:ss2}} {{[-c|-codec]}} copy {{path/to/output_video.mp4}}`

- Convert AVI video to MP4. AAC Audio @ 128kbit, h264 Video @ CRF 23:

`ffmpeg -i {{path/to/input_video}}.avi {{[-c|-codec]}}:a aac -b:a 128k {{[-c|-codec]}}:v libx264 -crf 23 {{path/to/output_video}}.mp4`

