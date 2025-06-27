function kitty-theme
    if test -f ~/.config/kitty/themes/$argv[1].conf
        kitty @ set-colors --all ~/.config/kitty/themes/$argv[1].conf
    else
        echo "Theme '$argv[1]' not found."
    end
end
