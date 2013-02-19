float rotation=0;
int count;
ArrayList<Building> buildings;
int groundX;
int groundY;
color blue;

Population population; 
int initPopulation = 300;
float mutationRate = 0.05;

int breedingAge;
int breedingFreq; 

void setup() {
  //smooth();
  size(850, 850, P3D);
  groundX = 5000;
  groundY = 5000;
  blue = color(#3648D6); 
  
  breedingAge = 40;
  breedingFreq = 10;

  population = new Population(mutationRate, initPopulation, blue);



  buildings = new ArrayList<Building>();

  PVector v = new PVector(0, height-20, 0);
  Building b = new Building(v, 100, 40, 80, 300, true);

  PVector v1 = new PVector(100, height-20, 50);
  Building b1 = new Building(v1, 100, 40, 80, 300, false);
  
  buildings.add(b);
  buildings.add(b1);
}

void draw() {
  background(#A6A6A6);

  float orbitRadius= 4000+50;
  float ypos= -300;
  float xpos= cos(radians(rotation))*orbitRadius;
  float zpos= sin(radians(rotation))*orbitRadius;

  if (count > 4) {
    rotation++;
    count = 0;
  }
  count++;

  camera(xpos, ypos, zpos, 0, 0, 0, 0, 1, 0);

  pushMatrix();
  translate(0, height, 0);
  noStroke();
  fill(blue);
  box(groundX, 20, groundY);
  popMatrix();

  //fill(255);
  //box(200);

  int numBuilding = 0;
  for (Building b: buildings) {
    //println("Building number " + numBuilding);
    numBuilding++;
    b.isColliding(buildings);
    b.run(buildings);
  }
  for (int i = 0; i < buildings.size(); i++) {
    if (buildings.get(i).dead) {
      buildings.remove(i);
    }
  }
}

