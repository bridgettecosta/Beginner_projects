
import ddf.minim.*;  // Load the audio engine
import ddf.minim.ugens.*;
Minim minim;
AudioOutput out;
Oscil fm;

AudioPlayer sound1;  // AudioPlayer is for long sounds
AudioSample sound2;  // AudioSample is for short sounds

int numimages = 7;
PImage[] images;

int imagealpha = 30;
int currentimage = 0;

PImage image1;

int imageindex1 = 0;
int imageindex2 = 0;
int imageindex3 = 0;


int linesx1 = 640;
int linesx2 = 1280;

int time = 0;
int timedelay = 2;

// Array of delay time options
int[] delays = { 30, 80, 200, 500, 1000,6000};

void setup() {
  background (255,163,41,120);
  size(600,600, P2D);
  noCursor();

image1 = loadImage("flower3.jpg");
image1.loadPixels();


imageindex1 = int(random(0, image1.pixels.length));
imageindex2 = int(random(0, image1.pixels.length));
imageindex3 = int(random(0, image1.pixels.length));


  // Register the audio engine
  minim = new Minim(this);
out   = minim.getLineOut();
fm = new Oscil(10, 2, Waves.SINE);
fm.offset.setLastValue(200);
Oscil wave = new Oscil(200, 0.8, Waves.TRIANGLE);
fm.patch(wave.frequency);
wave.patch(out);

frameRate(24);

  // Load all sounds in setup(), images must be in the "data" folder
  sound1 = minim.loadFile("56364__suonho__ambienta-soundtrack-crystal-airlines-c4-100bpm.wav");
  sound1.loop(); // Start the audio, loop when stopped

  // Load the short samples
  sound2 = minim.loadSample("smb_bowserfire.wav", 512);

  String path = sketchPath() + "/data/";

  // List the files inside the folder
  String[] filenames = listFileNames(path);
  printArray(filenames);

  StringList imagefilenames = new StringList();
  for (int i = 0; i < filenames.length; i++) {
    if (filenames[i].contains(".jpg") || filenames[i].contains(".png")) {
      imagefilenames.append(filenames[i]);
    }
  }

  images = new PImage[imagefilenames.size()];

  for (int i = 0; i < images.length; i++) {
    images[i] = loadImage(imagefilenames.get(i));
  }

  time = millis();

}
 
void draw() {
  
  strokeWeight(3);
    stroke( 255,120 );
    
    for(int i = 0; i < sound1.bufferSize() - 1; i++)
{
    float x1 = map( i, 600, sound1.bufferSize(), 0, height);
    float x2 = map( i+20, 600,sound1.bufferSize(), 0, height);
    line( x1, 30 + sound1.left.get(i)*500, x2, 50 + sound1.left.get(i+1)*100 );
    line( x1, 150 + sound1.right.get(i)*5, x2, 150 + sound1.right.get(i+1)*50 );
  }
  
  imageMode(CENTER);
   tint(255,180,255,100);
  image(images[currentimage],300,300);
  
    // Color Index 1
  color c1 = image1.pixels[imageindex1];
  imageindex1++;
  if (imageindex1 >= image1.pixels.length) {
    imageindex1 = 0;
  }

  // Color Index 2
  color c2 = image1.pixels[imageindex2];
  imageindex2++;
  if (imageindex2 >= image1.pixels.length) {
    imageindex2 = 0;
  }
 
  
  // Modify the audio
  float modulateAmount = map(hue(c1), 0, 255, 220, 1);
  float modulateFrequency = map(brightness(c2), 0, 255, 0.1, 100);
  fm.setFrequency(modulateFrequency);
  fm.setAmplitude(modulateAmount);
  

float diameter =  sound1.left.get(0) * 2000;

    // Draw Shape 1
   imageMode(CENTER);
  noStroke();
  tint(206,15,111,100);
  fill(c1,200);
  ellipse(300, 300, diameter, diameter);

 if (millis() > time + timedelay) {
    currentimage = int(random(0, images.length));
    int index = int(random(0, delays.length));
  }
    if (timedelay < 500) {
      imagealpha = 255;
      sound2.trigger();} 
      else {
      imagealpha = 30;}
    time = millis();
  

 }
 
