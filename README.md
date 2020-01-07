# Leggings

Keyboard control using custom wearable flex sensor (in the leggings).

This project was originally made to control the slides of this presentation:

https://www.kobakant.at/DIY/?p=7737

Video:

<a href="https://media.ccc.de/v/Camp2019-10375-make_your_tech_and_wear_it_too">
  <img src="https://static.media.ccc.de/media/conferences/camp2019/10375-hd_preview.jpg" width="600"/>
</a>

## What?

The system uses:
 - a stretch sensor connected to a WiFi-MCU board
 - a program that analyses the received data to emulate key controls accordingly.

### Sensor

The full wearable sensor is documented here:

https://www.kobakant.at/DIY/?p=7823


You can also create a simpler custom sensor circuit using suggestions documented here:

https://www.kobakant.at/DIY/?p=6063


### Board

The WiFi-MCU board used here is an X-OSC:

http://x-io.co.uk/x-osc/

Connecting to this board in WiFi can be tricky for some, check at their
documentation.


## How?

To use this program, you need processing, it can be downloaded here:

http://processing.org

...and once you're connected to the X-OSC board, run the code in this file:

    leggings.pde


## Alternative

If a wireless control breaks, it's always good to have a connected version.
The teensy code in the following folder does exactly that:

    teensy_alternative/

To use it, the following page should help:

https://www.pjrc.com/teensy/td_keyboard.html


## Inspirations

- X-OSC oscilloscope by Sebastian Madgwick:
https://github.com/xioTechnologies/OSC-illoscope/

- A Java-Robot keystroke example by Alvin Alexander:
https://alvinalexander.com/java/java-robot-class-example-mouse-keystroke

