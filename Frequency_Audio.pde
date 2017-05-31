import processing.sound.*;

FFT fft;
AudioIn in;
int bands = 512;
float[] spectrum = new float[bands];

void setup() {
  size(400, 400);
  //fullScreen();
  background(255);
  colorMode(HSB);

  fft = new FFT(this, bands);
  in = new AudioIn(this, 1);
  
  in.start();
  fft.input(in);
  //bands/=4;
}      

void draw() 
{ 
  int effect = 1020;
  background(255);
  translate(width/2, height/2);
  fft.analyze(spectrum);
  noStroke();
  int k =  10;
  //fill(random(0, 255),random(0, 255) ,random(0, 255));
  int m = width/5;
  for(int i = 0; i < bands; i++)
  {
    fill(255*i/bands, 250, 200);
    //line(width/2, height/2, (100*cos(TWO_PI*i/bands) * spectrum[i] + width/2) + 50*cos(TWO_PI*i/bands), (100*sin(TWO_PI*i/bands)*spectrum[i] + height/2) + 50*sin(TWO_PI*i/bands));
    triangle(0, 0, (effect*cos(TWO_PI*i/bands) * spectrum[i]) + m*cos(TWO_PI*i/bands), (effect*sin(TWO_PI*i/bands)*spectrum[i]) + m*sin(TWO_PI*i/bands), (effect*cos((TWO_PI*i+k)/bands) * spectrum[i]) + m*cos((TWO_PI*i+k)/bands), (effect*sin((TWO_PI*i+k)/bands)*spectrum[i]) + m*sin((TWO_PI*i+k)/bands));
  } 
}