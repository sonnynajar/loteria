import processing.sound.*;
SoundFile leftCardAudio, rightCardAudio;
String[] imageFileNames, audioFileNames;
int leftW, rightW, ranL, ranR, row, col;
int[] chosenCards;
int[][][] recCoors;



void setup() {
  background(255);
  size(900, 450); //1920x1080
  leftW = width/6;
  rightW = 5*width/6;
  chosenCards = new int[] {};
  recCoors = new int[18][3][4];
  imageNames();
  audioNames();
  squareCoor();
  //addAllImages(); //NOT WORKING
  println("Done Setup");
}

void draw() {
  println("Drawing...");
  if(chosenCards.length <= 53){
    rectMode(CORNERS); 
    imageMode(CORNERS);
    //background(255);
    //fill(255);
    
    ranL = chooseCard();
    chosenCards = sort(append(chosenCards, ranL));
    ranR = chooseCard();
    chosenCards = sort( append(chosenCards, ranR));

    PImage leftCardImage = loadImage("images/" + imageFileNames[ranL] + ".jpg");
    PImage rightCardImage = loadImage("images/" + imageFileNames[ranR] + ".jpg");
    leftCardAudio = new SoundFile(this, "C:\\Users\\rodav\\Documents\\Processing\\loteria\\audios\\" + audioFileNames[ranL] + ".mp3");
    rightCardAudio = new SoundFile(this, "C:\\Users\\rodav\\Documents\\Processing\\loteria\\audios\\" + audioFileNames[ranL] + ".mp3");
    leftCardAudio.rate(1);
    rightCardAudio.rate(1);
    
    println("Left Card " + ranL + ", name: " +  imageFileNames[ranL] + ", audio: " +audioFileNames[ranL]);
    println("Right Card " + ranR + ", name: " +  imageFileNames[ranR] + ", audio: " +audioFileNames[ranR]);
    image(leftCardImage, width/6 + 50, 0 + 50, width/2 - 25, height - 50);
    row = ranL/3;
    col = ranL - (row * 3);
    image(leftCardImage, recCoors[row][col][0],recCoors[row][col][1],recCoors[row][col][2],recCoors[row][col][3]);
    leftCardAudio.play();
    
    delay(5000);
   
    image(rightCardImage, width/2 + 25, 0 + 50, 5*width/6 - 50, height - 50);
    rightCardAudio.play();
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
