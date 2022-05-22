local tmr = require("timer");

-- Documentation
-- http://www.unifiedremote.com/api

-- Keyboard Library
-- http://www.unifiedremote.com/api/libs/keyboard


function showCurrentSong (timer)

	layout.currentSong.text = os.script("rhythmbox-client --print-playing");

	tid = tmr.timeout(function ()
		layout.currentSong.text = "Tap here to display artist and song title..."
	end, timer);
end


--@help First line : Song name
actions.currentSong = function ()
	showCurrentSong(5000);
end

--@help Second line : Previous song / Next song
actions.previous = function ()
	os.script("rhythmbox-client --previous");

	showCurrentSong(5000);
end


actions.next = function ()
	os.script("rhythmbox-client --next");
	layout.currentSong.text = os.script("rhythmbox-client --print-playing");

	showCurrentSong(5000);

end


--@help Third line : Play/Pause / Quit
actions.playpause = function ()
	os.script("rhythmbox-client --play-pause");

	showCurrentSong(15000);
end


actions.quit = function ()
	os.script("rhythmbox-client --quit");
end

--@help Fourth line : Volume down and up
actions.volumeDown = function ()
	os.script("rhythmbox-client --volume-down");
end


actions.volumeUp = function ()
	os.script("rhythmbox-client --volume-up");
end