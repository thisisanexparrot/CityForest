class DNA {
  color c;
  
  ExtrudeShape e;
  PVector location;
  //DNA dna;
  int seedSpread;
  int naturalLifeSpan;
  float growthRate;
  int heightCap;

  DNA(ExtrudeShape e_, 
      PVector location_,
      int seedSpread_,
      int nls_,
      float growthRate_,
      int heightCap_) {//, int w, int h, int d) {
    e = e_;
    location = location_;
    seedSpread = seedSpread_;
    naturalLifeSpan = nls_;
    heightCap = heightCap_;
    
    if(growthRate_ >= 0) {
      growthRate = growthRate_;
    }
    else {
      growthRate = 1/growthRate_;
    }
  }
  
  DNA(DNA d) {
    
  }
  
  DNA crossover(DNA partner) {
    //ExtrudeShape eNew = new ExtrudeShape(c);
    float newX = location.x + random(-100, 100);
    float newZ = location.z + random(-100, 100);
    
    PVector newLoc = new PVector(newX, height-20, newZ);
    
    DNA newDNA = new DNA(partner.e,
                         newLoc,
                         partner.seedSpread,
                         partner.naturalLifeSpan,
                         partner.growthRate,
                         partner.heightCap);
    return newDNA; 
  }
  
  void mutate(float m) {  
    if(random(1) < m) {
      heightCap = heightCap + int(random(-40, 40));
    }
    if(random(1) < m) {
      growthRate = growthRate + int(random(-3, 3)); 
    }
  }
  
  /* Traits:
   *   -location
   *   -spread
   *   -shape
   */
}
