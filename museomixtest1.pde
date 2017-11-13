// Maryam Chaib De Mares
// Very helpful suggestions by Matthieu Borgognon (FabLab)
// Museomix-CH Novembre 2017
// Theme Nature Connect

// Original example by Daniel Shiffman
// http://shiffman.net/p5/kinect/

// Assigning four different landscape areas based on y axis to trigger different reactions - This test triggers different color shapes - the aim is to trigger different audios. 

import org.openkinect.freenect.*;
import org.openkinect.processing.*;
import ddf.minim.*;

// Audio files should be dropped to the Processing IDE to be able to play them 
 
AudioPlayer s1;
AudioPlayer s2;
AudioPlayer s3;
AudioPlayer s4;
AudioPlayer s5;
AudioPlayer play;
Minim minim;//audio context

// store current hand positions
ArrayList<PVector> handPositions;
PVector currentHand;

// The kinect stuff is happening in another class
KinectTracker tracker;
Kinect kinect;


void setup() {
  //size(640, 520);
  size(640, 520);
  kinect = new Kinect(this);
  tracker = new KinectTracker();
  //frameRate(20);
  minim = new Minim(this);
  s1 = minim.loadFile("montagne.wav", 5048);
  s2 = minim.loadFile("lac.wav", 2048);
  s3 = minim.loadFile("plante.wav", 2048);
  s4 = minim.loadFile("terre.wav", 2048);
  s5 = minim.loadFile("1.aiff", 2048);
}

void draw() {
  background(255);

  // Load image
  PImage img = kinect.getDepthImage();
  
  
  // Run the tracking analysis
  tracker.track();
  // Show the image
  tracker.display();

  // Let's draw the raw location
  // PVector v1 = tracker.getPos();
  // fill(50, 100, 250, 200);
  // noStroke();
  // ellipse(v1.x, v1.y, 20, 20);

  // Let's draw ranges instead of ellipse?
  PVector v1 = tracker.getPos();
  fill(50, 100, 250, 200);
  noStroke();
  ellipse(v1.x, v1.y, 20, 20);
  
  // Let's draw the "lerped" location
  PVector v2 = tracker.getLerpedPos();
  fill(100, 250, 50, 200);
  noStroke();
  ellipse(v2.x, v2.y, 20, 20);

  // Display some info
  //int t = tracker.getThreshold();
  fill(0);
  text("vector1: " + v1 + "    " , 10, 500);
  
  // Draw lines to define horizons
  stroke(255);
  line(0,(height/4)+60,width,(height/4)+60); // montagne vs lac
  line(0,height/2+10,width,height/2+10); // lac vs plante
  line(0,(height/2)+97.5,width,(height/2)+97.5); // plante vs terre
  
  // HEREEEEEEEEEEEEEEEEEE
  //for (int i = 1; i < handPositions.size(); i++) {
  //currentHand = handPositions.get(i);

  // Default song playing
  //if 
  //s5.play();
  //s5.play();
  //play.setVolume(0.5);
  
  // Defining landscape areas based on movement Y values and accordingly playing non-overlapping sound files
  if(v2.y < (height/4+60)) {
    
    if(!s1.isPlaying()){ // if s2 OR s3 OR s4 is playing
    //fill(0, 255, 0);
   //rectMode(CENTER);
   //rect(50, 50, height/4, height/4);
       s1.play();
       s1.rewind();
       s2.pause();
       s3.pause();
       s4.pause();
       s5.pause();
       //delay(60000);
    }
  }
  
  
  else if(v2.y < height/2+10) {
   if(!s2.isPlaying()) { 
     s2.play();
     s2.rewind();
     s1.pause();
     s3.pause();
     s4.pause();
     s5.pause();
       //fill(0, 0, 255);
   //rectMode(CENTER);
   //rect(150, 150, height/2, height/2);
   }
  }
  
  else if(v2.y < (height/2)+97.5) {
   if(!s3.isPlaying()){ 
       s3.play();
       s3.rewind();
       s1.pause();
       s2.pause();
       s4.pause();
       s5.pause();
   //fill(255, 0, 0);
   //rectMode(CENTER);
   //ellipse(400, 400, height/2+67.5, height/2+67.5);
   }
  }
  
  else if(v2.y > (height/2)+90) {
   if(!s4.isPlaying()){ 
       s4.play();
       s4.rewind();
       s1.pause();
       s2.pause();
       s3.pause();
       s5.pause();
   //fill(100, 10, 210);
   //rectMode(CENTER);
   //ellipse(200, 200, height/2+67.5, height/2+67.5);
   }
  }
  //currentHand = handPositions.get(handPositions.size()-1);
}

//void stop() {
  //super.stop();
//}