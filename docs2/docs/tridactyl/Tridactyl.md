# Video Control
vn js document.querySelector('video').playbackRate=1.0
vd js document.querySelector('video').playbackRate=2.0
vv js document.querySelector('video').volume=1

# Globals

Ctrl-, - Regain control to tridactyl 


## Go Url
gh tabopen https://github.com/SkoomaFiend/DOTFILES
gr tabopen reddit.com
gyt tabopen youtube.com
gyl tabopen https://www.youtube.com/playlist?list=LL
gm tabopen https://mangadex.org/titles/follows

## Close

D tabclose # - close previous tab

## Tab Control
e tab #
gj tabfirst
gl tablast
ti changelistjump -1 - Goes to last input field among tabs
tcu - close all tabs up
tcd - close all tabs down
tg fillcmdline tabgrab
n tabnext_gt - num + n = jump to numbered tab 

## Search
sy fillcmdline tabopen https://www.youtube.com/results?search_query=
sr fillcmdline tabopen search reddit
S fillcmdline tabopen search
ss fillcmdline open search
si fillcmdline open https://www.google.com/search?tbm=isch&q=

## Marks
m gobble 1 markadd - m + key = make mark a-z = local A-Z = global
` + letter - jump to local or global mark  


##  Modes
Qi  mode ignore
--mode=ignore Qn mode normal

## Hints

;c - open reddit comments hints
;i img - single click on images in current tab
;qi - quick click images like ;i
;th - open video thumbnail image in new tab



## Open

or - opens reddit.com/r/ in commandline for easy subreddit jump
O - opens command line to go to urls



