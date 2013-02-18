//Thank you Daniel Shiffman

class Population { 
  float mutationRate;
  Building[] population;
  ArrayList<Building> darwin;
  int generations;
 
  int order;
 
  Population(float m, int num) {
    mutationRate = m;
    population = new Building[num];
    darwin = new ArrayList<Building>();
    generations = 0;
    
    for(int i = 0; i < population.length; i++) {
      PVector location = new PVector(); 
    }
  }
  
  void live() {
    for(int i = 0; i < population.length; i++) {
      
      //population[i].run();
    }
  }
  
  void calcFitness() {
    for(int i = 0; i < population.length; i++) {
      //population[i].calcFitness(); 
    }
    order = 1; 
  }
  
  void naturalSelection() {
    darwin.clear();

    float totalFitness = getTotalFitness();

    for (int i = 0; i < population.length; i++) {
      float fitnessNormal = population[i].fitness / totalFitness;
      int n = (int) (fitnessNormal * 50000);  // Arbitrary multiplier, consider mapping fix
      for (int j = 0; j < n; j++) {
        darwin.add(population[i]);
      }
    }
  }
  
  void generate() {
    for (int i = 0; i < population.length; i++) {
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
    for (int i = 0; i < population.length; i++) {
      total += population[i].fitness;
    }
    return total;
  }
  
}

/*
-symbiotic relationships
-build on dead buildings
*/
