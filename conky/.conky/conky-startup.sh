#!/bin/sh

if [ "$DESKTOP_SESSION" = "pop" ]; then 
   sleep 3s
   killall conky
   cd "$HOME/.conky/Quotes"
   conky -c "$HOME/.conky/Quotes/quote.conf" &
   cd "$HOME/.conky/SysInfo"
   conky -c "$HOME/.conky/SysInfo/SysInfo.conf" &
   cd "$HOME/.conky/Time"
   conky -c "$HOME/.conky/Time/week.conf" &
   exit 0
fi
