//Project 1

float line=0;
float linespeed=10;
color linecolor= color(22, 58, 116, 90);
float lineweight =5;

float line1x = 0;
float line1speed =8;
color line1color = color(2,242,212,80);
float line1weight = 125;

//half Circles

float rightCirclex=0;
float rightCircley=300;
float leftCirclex=600;
float leftCircley=300;

float circlewidth=350;

boolean drawcircles =false;
int x = 300;
int diameter =60;
color circleColor1 =color(250, 130, 50, 80);
color circleColor2= color(225, 225, 225, 70);
float shapespeed=5;
float shapetime=0;
float shapedelay =20;

void setup() {
  size(600, 600, P2D);
}

void draw() {
  background(120, 67, 191, 70);


  // Draw Line 1
  stroke(line1color);
  strokeWeight(line1weight);
  line(line1x, 0, line1x, height);

  //Center line
  stroke(linecolor);
  strokeWeight(lineweight);
  line(300, 0, 300, height);

  //Variables create Line motion

  lineweight += 3;


  //Half Circles
  noStroke();
  fill(247, 225, 233, 80);
  ellipse(0, 300, circlewidth, 600);
  ellipse(600, 300, circlewidth, 600);


  if (drawcircles) {
    fill(circleColor2);

    ellipse (x, 0, diameter, diameter);
    ellipse (x, 100, diameter, diameter);
    ellipse (x, 200, diameter, diameter);
    ellipse (x, 300, diameter, diameter);
    ellipse (x, 400, diameter, diameter);
    ellipse (x, 500, diameter, diameter);
    ellipse (x, 600, diameter, diameter);

    fill (circleColor1);
    ellipse (x, 50, diameter, diameter);
    ellipse (x, 150, diameter, diameter);
    ellipse (x, 250, diameter, diameter);
    ellipse (x, 350, diameter, diameter);
    ellipse (x, 450, diameter, diameter);
    ellipse (x, 550, diameter, diameter);
    ellipse (x, 650, diameter, diameter);
  }
  line1x += line1speed;


  // If the shape leaves the right edge of
  // the screen, move back to the left edge
  if (line1x > width+line1weight) {
    line1x = -line1weight;
  }
  //lineweight

// Turn on and off with timer
if (millis() > shapetime + shapedelay) {
  drawcircles = !drawcircles; // true to false, false to true
  shapetime = millis(); }
  
  if (lineweight > width) {
    drawcircles =true;
  }
  //smaller circles change size
  diameter+= random(-shapespeed, shapespeed);


  //smaller circles change color

  float seconds =millis()/1000.0;
  if (seconds>9) {
    circleColor1= color(255, 255, 255);
    circleColor2= color(242, 7, 125, 90);
  }
  if (seconds>8) {
    fill(132, 122, 242, 60);
    circlewidth+= random(0, 8);
    lineweight=+random(0, 800);
  }
  println(seconds);
}
