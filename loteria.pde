//import processing.sound.*;
import ddf.minim.*;

//Declare audio
Minim minim;
AudioPlayer leftCardAudio, rightCardAudio;
AudioPlayer[] cardNames;
//SoundFile leftCardAudio, rightCardAudio;
String[] imageFileNames, audioFileNames;
int leftW, rightW, ranL, ranR, row, col, pair;
boolean isFirst;
int[] chosenCards;
int[][][] recCoors;



void setup() {
  background(255);
  size(900, 450); //1920x1080
  leftW = width/6;
  rightW = 5*width/6;
  pair = 0;
  chosenCards = new int[] {};
  recCoors = new int[18][3][4];
  cardNames = new AudioPlayer[54];
  isFirst = true;
  minim = new Minim(this);
  imageNames();
  audioNames();
  //voiceNames();
  squareCoor();

  //addAllImages(); //NOT WORKING
  println("Done Setup");
}

void draw() {
  if(isFirst){
    leftCardAudio = minim.loadFile("audios/intro.mp3");
    rightCardAudio = minim.loadFile("audios/nothing.mp3");
  }
  
  leftCardAudio.play();
  delay(2000);
  rightCardAudio.play();
  delay(500);
  
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
    pair++;
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
    
    delay(2000);
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
