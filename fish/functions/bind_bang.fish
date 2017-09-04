# Defined in /Users/mo-watanabe/.config/fish/config.fish @ line 40
function bind_bang
	switch (commandline -t)[-1]
        case "!"
            commandline -t $history[1]; commandline -f repaint
        case "*"
            commandline -i !
    end
end
