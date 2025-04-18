#!/bin/bash

if pgrep pw-record
then 

    pkill -TERM pw-record
    notify-send "Finished recording!"

else

    deviceMonitor="alsa_output.pci-0000_00_1f.3.analog-stereo"

    rand=$(cat /dev/urandom | tr -dc 'A-Za-z0-9' | head -c 6)

    filename="/home/vam/Random/Anki/recording/out_${rand}.opus"

    notify-send "Recording to out_${rand}.opus"

    temp_raw_file=$(mktemp /tmp/raw_audio_XXXXXX.wav)
    

    # fix wireplumber/pipewire weirdness
    # https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/2731
    pw-record -P stream.capture.sink=true --target $deviceMonitor --latency 20ms --rate 48000 $temp_raw_file

    ffmpeg -ss 0.02 -i "$temp_raw_file" -b:a 128k "$filename"

    rm -f "$temp_raw_file"

    echo "file://${filename}" | wl-copy
fi

