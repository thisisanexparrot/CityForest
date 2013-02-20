/* Acknowledgements: 
 *  http://en.wikipedia.org/wiki/Brahmagupta's_formula
 *  http://forum.processing.org/topic/rotating-a-camera-around-global-axis
 */

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
int numBreedingYears;

void setup() {
  //smooth();
  size(850, 850, P3D);
  groundX = 5000;
  groundY = 5000;
  blue = color(#3648D6); 
  
  breedingAge = 80;
  breedingFreq = 40;
  numBreedingYears = 0;

  population = new Population(mutationRate, 
                              initPopulation, 
                              blue, 
                              groundX, 
                              groundY,
                              breedingAge,
                              breedingFreq);
}

void draw() {
  backgroundAndCamera();
  population.live();
  if(numBreedingYears > breedingFreq) {
    population.calcFitness();
    population.naturalSelection();
    population.generate();
    numBreedingYears = 0;
  }
  numBreedingYears++;
}

void backgroundAndCamera() {
  background(#A6A6A6);

  float orbitRadius= 4000+50;
  float ypos= -1000;
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
}
