#!/bin/bash

# Initial movement parameters
speed=5        # Number of pixels to move each step
delay=0.1      # Delay in seconds between updates

# Get the initial cursor position
cursor_pos=$(hyprctl cursorpos)
x=$(echo $cursor_pos | cut -d',' -f1)
y=$(echo $cursor_pos | cut -d',' -f2)

# Function to get updated cursor position
get_cursor_pos() {
    cursor_pos=$(hyprctl cursorpos)
    x=$(echo $cursor_pos | cut -d',' -f1)
    y=$(echo $cursor_pos | cut -d',' -f2)
}

# Main loop to track keypresses
while true; do
    get_cursor_pos

    # Check if the Super key combined with any arrow key is pressed
    if hyprctl keypress SUPER+LEFT; then
        # Move cursor left
        new_x=$((x - speed))
        hyprctl dispatch movecursor $new_x $y
        x=$new_x
        sleep $delay
    elif hyprctl keypress SUPER+RIGHT; then
        # Move cursor right
        new_x=$((x + speed))
        hyprctl dispatch movecursor $new_x $y
        x=$new_x
        sleep $delay
    elif hyprctl keypress SUPER+UP; then
        # Move cursor up
        new_y=$((y - speed))
        hyprctl dispatch movecursor $x $new_y
        y=$new_y
        sleep $delay
    elif hyprctl keypress SUPER+DOWN; then
        # Move cursor down
        new_y=$((y + speed))
        hyprctl dispatch movecursor $x $new_y
        y=$new_y
        sleep $delay
    fi

    # Sleep before the next check to avoid using too much CPU
    sleep 0.05
done
