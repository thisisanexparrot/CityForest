//Thank you Daniel Shiffman

class Population { 
  float mutationRate;
  ArrayList<Building> population;
  ArrayList<Building> darwin;
  int generations;
 
  int order;
  color c1;
 
  Population(float m, int num, color c1_) {
    c1 = c1_;
    
    mutationRate = m;
    population = new ArrayList<Building>();
    darwin = new ArrayList<Building>();
    generations = 0;
    
    for(int i = 0; i < num); i++) {
      PVector location = new PVector();
      ExtrudeShape e = new ExtrudeShape(c1);
      DNA dna = new DNA(e);
      //add vertexes
      int nls = int(random(30, 200));
      
      Building b = new Building(location, dna, nls);
      population.add(b);
      
      //Building b = Building(location, w, int h_, int d_, int nls, boolean col)
    }
  }
  
  void live() {
    for(int i = 0; i < population.size(); i++) {
      
      //population[i].run();
    }
  }
  
  void calcFitness() {
    for(int i = 0; i < population.size(); i++) {
      //population[i].calcFitness(); 
    }
    order = 1; 
  }
  
  void naturalSelection() {
    darwin.clear();

    float totalFitness = getTotalFitness();

    for (int i = 0; i < population.size(); i++) {
      float fitnessNormal = population.get(i).fitness / totalFitness;
      int n = (int) (fitnessNormal * 50000);  // Arbitrary multiplier, consider mapping fix
      for (int j = 0; j < n; j++) {
        darwin.add(population.get(i));
      }
    }
  }
  
  void generate() {
    for (int i = 0; i < population.size(); i++) {
      int m = int(random(darwin.size()));
      int d = int(random(darwin.size()));
      Building mom = darwin.get(m);
      Building dad = darwin.get(d);

      DNA momgenes = mom.dna;
      DNA dadgenes = dad.dna;
      //DNA child = momgenes.crossover(dadgenes);
      //child.mutate(mutationRate);
      //PVector location = new PVector(start.r.x+start.r.width/2,start.r.y+start.r.height/2);
      //population[i] = new Building(location, child);
    }
    generations++;
  }

  int getGenerations() {
    return generations;
  }

  //compute total fitness for the population
  float getTotalFitness() {
    float total = 0;
    for (int i = 0; i < population.size(); i++) {
      total += population.get(i).fitness;
    }
    return total;
  }
  
}

/*
-symbiotic relationships
-build on dead buildings
*/
