# museomix-2017-senscape

This repository describes the code used for creating a prototype called "Senscape" during the Museomix event that took place at the ArtLab of EPFL in Lausanne in 2017, under the topic "Nature Connect".

## Getting Started

The materials needed to get this preliminary project up and running include:
* A Kinect sensor version 1
* An adaptor for the kinect (to USB port)

## Prerequisites
You will need the Processing, the software sketchbook and language mainly eveloped in the context of the visual arts:
* Processing v3.3.6 (4 September 2017) -- downloaded for Linux 64 bit
The Processing libraries:
* Kinect v2 for Processing 0.7.8
* Open Kinect for Processing 1.0
* Minim 2.2.2 (Audio library)
And the audio files available in this repository:
* "montagne.wav"
* "lac.wav"
* "plante.wav"
* "terre.wav"
* "1.aiff" (obtained from the open license NASA files at https://soundcloud.com/nasa; under the file's orginal name "ear_campbell_2.aiff").

### Installing
Processing was installed on Ubuntu 16.04 following instructions described here: https://github.com/crazy-logic/Install-Processing-on-Ubuntu-16.04

Libraries were installed on Processing v3.3.6 by selecting "Add Library..." from the "Import Library..." submenu within the Sketch menu. 

Please *note* that you must drop the 

## The code files
Two code files are provided, both of which are modifications from Shiffman's examples for kinect v1 on average point tracking (available at https://github.com/shiffman/OpenKinect-for-Processing/tree/master/OpenKinect-Processing/examples/Kinect_v1/AveragePointTracking):

Both files should be available locally within the same directory. The directory name *must be* in this case "museomixtest1" (corresponding to the first script name).
* The first script is "museomixtest1.pde".
* The second script, which is an instance called by the first script, is named "KinectTracker.pde", as it was originally by the author.

### Important notes to consider
The script "museomixtest1.pde" was created in the context of a prototype developed to connect ArtLab and EPFL visitors to surrounding nature. The prototype is called "Senscape", aimed to be an interactive multi-sensorial space, providing scientific data/context and/or artistic information about particular objects/areas in the landscape around EPFL ArtLab. In the context of the prototype four areas were delimited: mountain, lake, plants and soil (which correspond to the audio files provided in this repo) to which users could point at while looking at the breath-taking landscape.

The code is far from optimal, but the general idea behind it is as follows:
1. Import the necessary libraries.
2. Initiate AudioPlayer (minim) for each song.
3. Track kinect (call second script): using a pre-defined threshold, calculate the centroid of the detected raw-depth area.
4. Run a tracking analysis in which raw location is stored in a vector.
5. Define areas of interest, based on Y-axis, and draw lines just for calibration purposes. These are currently drawn based on the tests performed during the show-off of the prototypes at the following coordinates, but should be modified depending on landscape/visitor:
  5. (0, height/4+60,width,(height/4)+60) // montagne vs lac
  5. (0,height/2+10,width,height/2+10) // lac vs plante
  5. (0,(height/2)+97.5,width,(height/2)+97.5) // plante vs terre
6. Based on average point location - y axis value only-, play non-overlapping sound files (using minim) using conditional clauses.
7. End.

Admittedly, there are far better ways to achieve these aims, and if you would like more info or would be willing to contribute to its improvement, please get in touch. Thanks for reading through :)

### Authors, contributors and Acknowledgments
* Original scripts from https://github.com/shiffman/OpenKinect-for-Processing/tree/master/OpenKinect-Processing/examples/Kinect_v1/AveragePointTracking
* Modified by myself, and at all times using helpful suggestions by Matthieu Borgognon and Christophe Cachin. Thanks!
* Audio files were created in both content and preparation by all members of Nature Connect team Museomix 2017. (I am unsure whether or not they are okay with having their names listed here, but if you are one of our member teams, please get in touch if you would like your name listed).


