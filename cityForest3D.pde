float rotation=0;
int count;
//ArrayList<Building> buildings;
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

  population = new Population(mutationRate, initPopulation, blue, groundX, groundY);
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

  for (Building b: population.buildings) {
    b.isColliding(population.buildings);
    b.run(population.buildings);
  }
  for (int i = 0; i < population.buildings.size(); i++) {
    if (population.buildings.get(i).dead) {
      population.buildings.remove(i);
    }
  }
}

