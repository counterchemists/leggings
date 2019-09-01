# Leggings

Keyboard control using custom wearable sensor (leggings).

This project was originally made to control the slides of this presentation:

https://www.kobakant.at/DIY/?p=7737


## What?

The system uses a stretch sensor connected to a WiFi-MCU board, and
a program that analyses the received data to emulate key controls accordingly.


### Sensor

You can create your own custom sensor circuit using suggestions documented here:

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


## Inspirations

- X-OSC oscilloscope by Sebastian Madgwick:
https://github.com/xioTechnologies/OSC-illoscope/

- A Java-Robot keystroke example by Alvin Alexander:
https://alvinalexander.com/java/java-robot-class-example-mouse-keystroke

