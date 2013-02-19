//Thank you Daniel Shiffman

class Population { 
  float mutationRate;
  ArrayList<Building> buildings;
  ArrayList<Building> darwin;
  int generations;
 
  int order;
  color c1;
 
  Population(float m, int num, color c1_) {
    println("Hello");
    c1 = c1_;
    
    mutationRate = m;
    buildings = new ArrayList<Building>();
    darwin = new ArrayList<Building>();
    generations = 0;
    
    for(int i = 0; i < num; i++) {
      PVector location = new PVector(0, height-20, 0);
      ExtrudeShape e = new ExtrudeShape(c1);
      DNA dna = new DNA(e);
      e.addVertex(0, 0);
      e.addVertex(50, 0);
      e.addVertex(50, 50);
      e.addVertex(0, 50);
      //add vertexes
      int nls = int(random(30, 200));
      
      Building b = new Building(location, dna, nls);
      buildings.add(b);
      
      //Building b = Building(location, w, int h_, int d_, int nls, boolean col)
    }
  }
  
  void live() {
    for(int i = 0; i < buildings.size(); i++) {
      
      //buildings[i].run();
    }
  }
  
  void calcFitness() {
    for(int i = 0; i < buildings.size(); i++) {
      //buildings[i].calcFitness(); 
    }
    order = 1; 
  }
  
  void naturalSelection() {
    darwin.clear();

    float totalFitness = getTotalFitness();

    for (int i = 0; i < buildings.size(); i++) {
      float fitnessNormal = buildings.get(i).fitness / totalFitness;
      int n = (int) (fitnessNormal * 50000);  // Arbitrary multiplier, consider mapping fix
      for (int j = 0; j < n; j++) {
        darwin.add(buildings.get(i));
      }
    }
  }
  
  void generate() {
    for (int i = 0; i < buildings.size(); i++) {
      int m = int(random(darwin.size()));
      int d = int(random(darwin.size()));
      Building mom = darwin.get(m);
      Building dad = darwin.get(d);

      DNA momgenes = mom.dna;
      DNA dadgenes = dad.dna;
      //DNA child = momgenes.crossover(dadgenes);
      //child.mutate(mutationRate);
      //PVector location = new PVector(start.r.x+start.r.width/2,start.r.y+start.r.height/2);
      //buildings[i] = new Building(location, child);
    }
    generations++;
  }

  int getGenerations() {
    return generations;
  }

  //compute total fitness for the buildings
  float getTotalFitness() {
    float total = 0;
    for (int i = 0; i < buildings.size(); i++) {
      total += buildings.get(i).fitness;
    }
    return total;
  }
  
}

/*
-symbiotic relationships
-build on dead buildings
*/
