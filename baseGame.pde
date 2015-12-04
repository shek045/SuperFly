
PVector v, v1;
int positionx[] = new int[10]; //Array List of ints that determine x location of obstacles
PVector vectors[] = new PVector[10];//Array List of PVectors located at bottom of top obstacle
PVector vectors0[] = new PVector[10];//Array List of PVectors located at bottom of top obstacle
float randseed[] = new float[10];
boolean runGame;
PImage gOver;
float initX, initX2;
void setup(){
  v = new PVector(10,150);  //Location of superman hitbox
  size(600,400);
  for(int i = 0; i < 10; i++) //Creates the locations for the x array list
    positionx[i] = 400 + 300 * i;
  runGame = true;
  for(int i = 0; i < 10; i++) //fills randseed with randomized values
    randseed[i] = random(50,200);
  println(randseed);
  gOver = loadImage("Gotham.jpg");
  initX = 0;
  initX2 = 1000;
}
void draw(){
  background(255,100);
  image(gOver,initX,0);
  image(gOver,initX2,0);
  fill(0);
  if(runGame){
    fill(255);
    ellipse(v.x, v.y, 10, 10);
    fill(0);
    for(int i = 0; i < 10; i++){ //Goes through every x value, draws a rectangle, and then adjusts location
      vectors[i] = new PVector(positionx[i], randseed[i]); //CREATES THE VECTOR TO TOP BLOCK
      vectors0[i] = new PVector(positionx[i], 400 - (300 - randseed[i])); //CREATES THE VECTOR TO BOTTOM BLOCK
      rect(positionx[i],0,100,randseed[i]); //MAKES TOP BLOCK
      fill(#FEFF05);
      rect(positionx[i]+randseed[i]/8,randseed[i]/4,randseed[i]/4,randseed[i]/4);
      rect(positionx[i]+randseed[i]/8,((400 - (300 - randseed[i]))/4),randseed[i]/4,randseed[i]/4);
      fill(0);
      //rect(positionx[i],0,100,randseed[i]);
      rect(positionx[i],400 - (300 - randseed[i]), 100,400); //MAKES BOTTOM BLOCK 
      //line(v.x,v.y,vectors[i].x,vectors[i].y);
      //line(v.x,v.y,vectors0[i].x,vectors0[i].y);
      positionx[i] = positionx[i] - 4;
      //println(v.x - vectors[0].x);
      if(v.y - vectors[i].y <= 0 && v.x - vectors[i].x >= 0 && v.x - vectors[i].x <= 100)
        runGame = false;
      if(v.y - vectors0[i].y >= 0 && v.x - vectors[i].x >= 0 && v.x - vectors[i].x <= 100)
        runGame = false;
    }
    
    v = new PVector(v.x, v.y + (v.y+100)/100);
    /*if(v.y < 100) //RUDIMENTARY ACCELERATION
      v = new PVector(v.x, v.y + 1);
    else if(v.y < 200)
      v = new PVector(v.x, v.y + 2);
    else if(v.y < 300)
      v = new PVector(v.x, v.y + 4);
    else if(v.y < 400)
      v = new PVector(v.x, v.y + 8);*/
    /*if(v.x - vectors[9].x > 100) //TEST CODE, DO NOT IMPLEMENT
      background(0);*/
  }
  /*if(!runGame){
      background(255);
      image(gOver,87,166);
  }*/
  //v = new PVector(mouseX, mouseY);
  initX-=5;
  initX2-=5;
  if(initX == -1000) //RESETS 
    initX = 1000;
  if(initX2 == -1000)
    initX2 = 1000;
}
void mousePressed(){
  if(mousePressed)
    v = new PVector(v.x, v.y - 20);
}
