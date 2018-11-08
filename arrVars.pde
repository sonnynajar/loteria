void imageNames(){
  fileNames = new String[] {"01 el gallo","02 el diablito", "03 la dama", "04 el catrin",
                            "05 el paraguas","06 la sirena","07 la escalera","08 la botella",
                            "09 el barril","10 el arbol","11 el melon","12 el valiente",
                            "13 el gorrito","14 la muerte","15 la pera","16 la bandera",
                            "17 el bandolon","18 el violoncello","19 la garza","20 el pajaro",
                            "21 la mano","22 la bota","23 la luna","24 el cotorro",
                            "25 el borracho","26 el negrito","27 el corazon","28 la sandia",
                            "29 el tambor","30 el camaron","31 las jaras","32 el musico",
                            "33 la araña","34 el soldado","35 la estrella","36 el cazo",
                            "37 el mundo","38 el apache","39 el nopal","40 el alacran",
                            "41 la rosa","42 la calavera","43 la campana","44 el cantarito",
                            "45 el venado","46 el sol","47 la corona","48 la chalupa",
                            "49 el pino","50 el pescado","51 la palma","52 la maceta",
                            "53 el arpa","54 la rana"
                        };
}

void squareCoor(){   
    for(int i = 0; i < 9; i++){ //row
      for(int j = 0; j < 3; j++){ //column
        recCoorsL[i][j][0] = leftW * j/3;
        recCoorsL[i][j][1] = height * i/9;
        recCoorsL[i][j][2] = leftW * (j+1)/3;
        recCoorsL[i][j][3] = height * (i+1)/9;
        
        recCoorsL[i+9][j][0] = rightW + (leftW * j/3);
        recCoorsL[i+9][j][1] = height * i/9;
        recCoorsL[i+9][j][2] = rightW + (leftW * (j+1)/3);
        recCoorsL[i+9][j][3] = height * (i+1)/9;
      }
    }
}

void addAllImages(){
  PImage[] temp = new PImage[54];
 for(int i = 0; i < 9; i++){
   for(int j = 0; j < 3; j++){
     temp[i] = loadImage("images/" + fileNames[i] + ".jpg");
     image(temp[i], recCoorsL[i][j][0],recCoorsL[i][j][1],recCoorsL[i][j][2],recCoorsL[i][j][3]);
     //rect(recCoorsL[i][j][0],recCoorsL[i][j][1],recCoorsL[i][j][2],recCoorsL[i][j][3]);
     delay(100);
     println("Drew card " + i );
   }
  }
}
  
String coorsToString(int x, int y){
  return  "Coors are " + recCoorsL[x][y][0] + "," + recCoorsL[x][y][1] + "," +recCoorsL[x][y][2] + "," + recCoorsL[x][y][3];
}