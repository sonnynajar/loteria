//import processing.sound.*;
import ddf.minim.*;

Minim minim;
AudioPlayer leftCardAudio, rightCardAudio;
//SoundFile leftCardAudio, rightCardAudio;
String[] imageFileNames, audioFileNames;
int leftW, rightW, ranL, ranR, row, col, pair;
boolean isFirst, isPaused;
int[] chosenCards;
int[][][] recCoors;

void setup() {
  background(255);
  //size(900, 450); //1920x1080
  fullScreen();
  leftW = width/6;
  rightW = 5*width/6;
  pair = 1;
  chosenCards = new int[] {};
  recCoors = new int[18][3][4];
  isFirst = true;
  isPaused = false;
  minim = new Minim(this);
  imageNames();
  audioNames();
  squareCoor();
  drawPauseButton();
  //addAllImages(); //NOT WORKING
  println("Done Setup");
}

void draw() {
  
  if(!isPaused){
    
    if(isFirst){
      leftCardAudio = minim.loadFile("audios/intro.mp3");
      rightCardAudio = minim.loadFile("audios/nothing.mp3");
    }
    
    leftCardAudio.play();
    delay(3000);
    rightCardAudio.play();
    //delay(500);
    
    if(chosenCards.length <= 53){
      isFirst = false;
      println("Drawing...");
      rectMode(CORNERS); 
      imageMode(CORNERS);
      //background(255); to not overwrite side cards
      
      ranL = chooseCard();
      chosenCards = sort(append(chosenCards, ranL));
      ranR = chooseCard();
      chosenCards = sort( append(chosenCards, ranR));
  
      PImage leftCardImage = loadImage("images/" + imageFileNames[ranL] + ".jpg");
      PImage rightCardImage = loadImage("images/" + imageFileNames[ranR] + ".jpg");
      
      leftCardAudio = minim.loadFile("audios/" +  audioFileNames[ranL] + ".mp3");
      rightCardAudio = minim.loadFile("audios/" +  audioFileNames[ranR] + ".mp3");
      //leftCardAudio = new SoundFile(this, "C:\\Users\\rodav\\Documents\\Processing\\loteria\\audios\\" + audioFileNames[ranL] + ".mp3");
      //rightCardAudio = new SoundFile(this, "C:\\Users\\rodav\\Documents\\Processing\\loteria\\audios\\" + audioFileNames[ranR] + ".mp3");
     
      println("Pair: " + pair);
      println("Left Card -- name: " +  imageFileNames[ranL] + ", audio: " +audioFileNames[ranL]);
      println("Right Card -- name: " +  imageFileNames[ranR] + ", audio: " +audioFileNames[ranR]);
      println("----------------");
      
      image(leftCardImage, width/6 + 50, 0 + 50, width/2 - 25, height - 50);
      row = ranL/3;
      col = ranL - (row * 3);
      image(leftCardImage, recCoors[row][col][0],recCoors[row][col][1],recCoors[row][col][2],recCoors[row][col][3]);
     
      image(rightCardImage, width/2 + 25, 0 + 50, 5*width/6 - 50, height - 50);
      row = ranR/3;
      col = ranR - (row * 3);
      image(rightCardImage, recCoors[row][col][0],recCoors[row][col][1],recCoors[row][col][2],recCoors[row][col][3]);
      
      delay(4000);
      pair++;
    }
  }
}

boolean alreadyChosen(int x){
   for(int i = 0; i < chosenCards.length; i++){
    if(chosenCards[i] == x){
      return true;
     }
   }
   return false;
}

int chooseCard(){
  int r = int(random(imageFileNames.length));
  if(!alreadyChosen(r)){
    return r;
  }
  return chooseCard();
}

void drawPauseButton(){
  fill(255,0,0);
  rect(width/2 - 20, height - 50, 40, 40);
}

boolean overSquare(int x, int y, int w, int h) {
  if (mouseX >= x && mouseX <= x+w && 
    mouseY >= y && mouseY <= y+h) {
    return true;
  } else {
    return false;
  }
}

boolean shouldPause(boolean p){
  return !p;
}

void mousePressed() {
  if (overSquare(width/2 - 20, height - 50, 40, 40)) {
    isPaused = shouldPause(isPaused);
    println("pause = " + isPaused);
  }
}

void keyPressed(){
  if (keyPressed == true) {
    if (key == 'p' || key == 'P') {
    isPaused = shouldPause(isPaused);
    println("pause = " + isPaused);
    }
  }
}
 
