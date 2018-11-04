PImage[] images;
String[] names;
String img, audios;
color bg;
color[] sqColors;
int leftW, rightW;

void setup() {
  background(255);
  bg = color(255, 0, 0);
  size(1760, 990); //1920x1080
  img = "image";
  audios = "audios";
  leftW = width/4;
  rightW = 3*width/4;
  sqColors = new color[] {color(255,0,0),color(0,255,0),color(0,0,255)}; 
}

void draw() {
  rectMode(CORNER); 
  background(255);
  fill(bg);
  //rect(0, 0, leftW, height);
  rect(rightW, 0, width, height);
  
  for(int i = 0; i < 10; i++){
    for(int j = 0; j < 3; j++){
      fill(sqColors[j]);
      //rect(leftW * j/3, height * i/9, leftW * (j+1)/3, height * (i+1)/9);
      //rect(rightW * (j+1)/3, height * i/9, rightW * (j+2)/3, height * (i+1)/9);
      println("i = " + i + " = " +
              "("  + leftW * j/3 +
              ","  + height * i/9 +
              ") - (" + leftW * (j+1)/3 +
              "," + height * (i+1)/9 + ")");
    }
  }
  
  fill(255,0,0);
  rect(0, 0, 146, 110);
  fill(0,255,0);
  rect(146, 0, 293, 110);
  fill(0,0,255);
  rect(293, 0, 440, 110);
}
