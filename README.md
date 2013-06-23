# North American Music

> A telematic piece involving the University of Michigan, University of Illinois and University of Virginia. Performed on 2 April 2013 with special guest Elliot Sharp.

## About

_North American Music_ is the first work in an internet music composition series that involves groups of musical improvisors performing over the internet. The idea was spawned from members of the University of Michigan's Digital Music Ensemble class during the Winter of 2013.

This first iteration of the piece explores three groups improvising remotely from the following locations:

* University of Michigan - Ann Arbor, MI
* University of Illinois - Urbana, IL
* Rensselaer Polytechnic Institute - Troy, NY

When data (in this case, music) is transmitted over the internet, it travels nearly instantaneously. However, in this piece, sound travels at the speed of sound. When one sound is made in Ann Arbor, MI, it will travel at the speed of sound until it reaches Urbana, IL and Troy, NY (approximately 30 minutes and 60 minutes respectively).

A custom coding solution was needed to make this piece work properly. A simple delay object in Max/MSP works for short delays. When the delays are up to 60 minutes in length, that's when problems arise.

This repo contains the visual Processing code, a visual that would be seen by all 3 universities at the same time.
