#!/bin/dash

B='#00000000'  # blank
C='#ffffff22'  # clear ish
D='#ff121e3a'  # default
T='#ff8B86B9'  # text
W='#880000bb'  # wrong
V='#ff8b86b9'  # verifying

i3lock \
--insidevercolor=$C   \
--ringvercolor=$V     \
\
--insidewrongcolor=$C \
--ringwrongcolor=$W   \
\
--insidecolor=$B      \
--ringcolor=$D        \
--linecolor=$B        \
--separatorcolor=$D   \
\
--verifcolor=$T        \
--wrongcolor=$T        \
--timecolor=$T        \
--datecolor=$T        \
--layoutcolor=$T      \
--keyhlcolor=$W       \
--bshlcolor=$W        \
\
--screen 1            \
--blur 5              \
--clock               \
--indicator           \
--timestr="%H:%M:%S"  \
--datestr="%A, %m %Y" \
--keylayout 2         \
\
--veriftext="Hmmmm..." \
--wrongtext="Nope!"   \
# --textsize=20
# --modsize=10
# --timefont=comic-sans
# --datefont=monofur
# etc
