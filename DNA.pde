class DNA {
  color c;
  
  ExtrudeShape e;
  PVector location;
  //DNA dna;
  int naturalLifeSpan;
  int seedSpread;
  int naturalLifeCycle;
  int growthRate;

  int maxHeight, maxWidth, maxDepth;

  boolean stoppedX;
  boolean stoppedY;
  boolean stoppedZ;


  DNA(ExtrudeShape e_, 
      PVector location_,
      int seedSpread_,
      int nls_,
      int growthRate_) {//, int w, int h, int d) {
    e = e_;
    location = location_;
    seedSpread = seedSpread_;
    naturalLifeCycle = nls_;
    growthRate = growthRate_;
  }
  
  DNA(DNA d) {
    
  }
  
  DNA crossover(DNA partner) {
    //ExtrudeShape eNew = new ExtrudeShape(c);
    println("crossing");
    float newX = location.x + random(-100, 100);
    float newZ = location.z + random(-100, 100);
    
    PVector newLoc = new PVector(newX, height-20, newZ);
    
    DNA newDNA = new DNA(partner.e,
                         newLoc,
                         partner.seedSpread,
                         partner.naturalLifeCycle,
                         partner.growthRate);
    return newDNA; 
  }
  
  void mutate(float m) {  
    if(random(1) < m) {
     
    } 
  }
  
  /* Traits:
   *   -location
   *   -spread
   *   -shape
   */
}
