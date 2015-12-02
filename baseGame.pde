PVector v, v1;
int positionx[] = new int[10]; //Array List of ints that determine x location of obstacles
PVector vectors[] = new PVector[10];//Array List of PVectors located at bottom of top obstacle
PVector vectors0[] = new PVector[10];//Array List of PVectors located at bottom of top obstacle
float randseed[] = new float[10];
boolean runGame;
PImage gOver;
void setup(){
  v = new PVector(10,150);  //Location of superman hitbox
  size(600,400);
  for(int i = 0; i < 10; i++) //Creates the locations for the x array list
    positionx[i] = 400 + 300 * i;
  runGame = true;
  for(int i = 0; i < 10; i++) //fills randseed with randomized values
    randseed[i] = random(50,200);
  println(randseed);
  gOver = loadImage("snapshot1.png");
}
void draw(){
  background(200);
  fill(100,200,100);
  if(runGame){
    ellipse(v.x, v.y, 10, 10);
    for(int i = 0; i < 10; i++){ //Goes through every x value, draws a rectangle, and then adjusts location
      vectors[i] = new PVector(positionx[i], randseed[i]);
      vectors0[i] = new PVector(positionx[i], 400 - (300 - randseed[i]));
      rect(positionx[i],0,100,randseed[i]);
      //rect(positionx[i],400 - (300 - randseed[i]), 100,400 - (300 - randseed[i])); 
      rect(positionx[i],400 - (300 - randseed[i]), 100,400); 
      line(v.x,v.y,vectors[i].x,vectors[i].y);
      line(v.x,v.y,vectors0[i].x,vectors0[i].y);
      positionx[i] = positionx[i] - 4;
      //println(v.x - vectors[0].x);
      if(v.y - vectors[i].y <= 0 && v.x - vectors[i].x >= 0 && v.x - vectors[i].x <= 100)
        runGame = false;
      if(v.y - vectors0[i].y >= 0 && v.x - vectors[i].x >= 0 && v.x - vectors[i].x <= 100)
        runGame = false;
    }
    
    v = new PVector(v.x, v.y + 1);
    if(v.x - vectors[9].x > 100)
      background(0);
  }
  if(!runGame){
      background(255);
      image(gOver,87,166);
  }
  //v = new PVector(mouseX, mouseY);

}
void mousePressed(){
  if(mousePressed)
    v = new PVector(v.x, v.y - 20);
}
