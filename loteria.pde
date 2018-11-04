//PImage temp;
String[] fileNames;
String img, audios;
int leftW, rightW, imgCount, ranL, ranR;
int[] chosenCards;
int[][] recCoors = new int[54][4];

void setup() {
  background(255);
  size(1760, 990); //1920x1080
  img = "image";
  audios = "audios";
  leftW = width/6;
  rightW = 5*width/6;
  chosenCards = new int[] {};
  imageNames();
  squareCoor();
}

void draw() {
  if(chosenCards.length <= 53){
    rectMode(CORNERS); 
    imageMode(CORNERS);
    background(255);
    //fill(255);
    
    ranL = chooseCard();
    chosenCards = sort(append(chosenCards, ranL));
    ranR = chooseCard();
    chosenCards = sort( append(chosenCards, ranR));

    PImage left = loadImage("images/" + fileNames[ranL] + ".jpg");
    PImage right = loadImage("images/" + fileNames[ranR] + ".jpg");
    image(left, width/6 + 50, 0 + 50, width/2 - 25, height - 50);
    image(left, recCoors[ranL][0],recCoors[ranL][1],recCoors[ranL][2],recCoors[ranL][3]);
    image(right, width/2 + 25, 0 + 50, 5*width/6 - 50, height - 50);
    image(right, recCoors[ranR][0],recCoors[ranR][1],recCoors[ranR][2],recCoors[ranR][3]);
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
