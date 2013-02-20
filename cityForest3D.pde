/* Acknowledgements: 
 *  http://en.wikipedia.org/wiki/Brahmagupta's_formula
 *  http://forum.processing.org/topic/rotating-a-camera-around-global-axis
 */
PFont boldFont;

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
int numberYears;
int generations;

void setup() {
  boldFont = loadFont("PlayfairDisplaySC-Bold-48.vlw");
  
  //smooth();
  size(850, 850, P3D);
  groundX = 5000;
  groundY = 5000;
  blue = color(#3648D6); 
  
  breedingAge = 80;
  breedingFreq = 40;
  numBreedingYears = 0;
  generations = 0;

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
    generations++;
  }
  numBreedingYears++;
  numberYears++;
}

void printText() {
  pushMatrix();
  translate(-2300, -1500, 0);
  textFont(boldFont);
  textSize(300);
  fill(255);
  text("City Forest", 30, 30);
  textSize(160);
  text("Time passed: " + numberYears, 60, 230);
  text("Generations: " + generations, 60, 400);
  text("Max height: " + population.getMaxHeight(), 60, 570);
  popMatrix();
}

void backgroundAndCamera() {

  background(200);

  float orbitRadius= 2500 + mouseY*3;
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
  
  stroke(255);
  strokeWeight(100);
  int offset = 80;

  line(groundX/2+offset, 0, groundY/2-offset, -groundX/2+offset, 0, groundY/2-offset);

  line(groundX/2-offset, 0, -groundY/2+offset, -groundX/2-offset, 0, -groundY/2+offset);

  line(groundX/2-offset, 0, -groundY/2-offset, groundX/2-offset, 0, groundY/2-offset);

  line(-groundX/2+offset, 0, groundY/2-offset, -groundX/2+offset, 0, -groundY/2-offset);

  //line(30, 20, 30, groundX-30, 20, groundY-30);
  
  popMatrix();  
  printText();

}
