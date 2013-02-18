class DNA {
  ExtrudeShape e;

  PVector location;
  int maxWidth;
  int maxHeight;
  int maxDepth;

  int naturalLifeSpan;

  float fitness;
  DNA dna;
  color c;

  boolean stoppedX;
  boolean stoppedY;
  boolean stoppedZ;


  DNA(int w, int h, int d) {
  
  }
  
  DNA(DNA d) {
    
  }
  
  DNA crossover(DNA partner) {
    return partner; 
  }
  
  void mutate(float m) {
    
  }
}
