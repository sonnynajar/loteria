String[] fileNames;
String img, audios;
int leftW, rightW, ranL, ranR, row, col;
int[] chosenCards;
int[][][] recCoorsL;

void setup() {
  background(255);
  size(900, 450); //1920x1080
  img = "image";
  audios = "audios";
  leftW = width/6;
  rightW = 5*width/6;
  chosenCards = new int[] {};
  recCoorsL = new int[18][3][4];
  imageNames();
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

    PImage left = loadImage("images/" + fileNames[ranL] + ".jpg");
    PImage right = loadImage("images/" + fileNames[ranR] + ".jpg");
    
    println("Left Card " + ranL);
    image(left, width/6 + 50, 0 + 50, width/2 - 25, height - 50);
    row = ranL/3;
    col = ranL - (row * 3);
    image(left, recCoorsL[row][col][0],recCoorsL[row][col][1],recCoorsL[row][col][2],recCoorsL[row][col][3]);
   
    println("Right Card " + ranR);
    image(right, width/2 + 25, 0 + 50, 5*width/6 - 50, height - 50);
    row = ranR/3;
    col = ranR - (row * 3);
    image(right, recCoorsL[row][col][0],recCoorsL[row][col][1],recCoorsL[row][col][2],recCoorsL[row][col][3]);
    
    delay(1000);
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
  int r = int(random(fileNames.length));
  if(!alreadyChosen(r)){
    return r;
  }
  return chooseCard();
}