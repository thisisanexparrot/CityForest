class Building {
  PVector location;
  ExtrudeShape baseShape;
  DNA dna;
  float growthRate;
  
  int w;
  int h;
  int d;
  int maxWidth;
  int heightCap;
  int maxDepth;

  int naturalLifeSpan;
  int numberYears;
  float deathChance;
  boolean dying;
  boolean dead;

  float fitness;
  color c;

  boolean stoppedX;
  boolean stoppedY;
  boolean stoppedZ;

  Building(PVector location_, DNA dna_, int nls, int growthRate_, int heightCap_) {
    location = location_; 
    dna = dna_;
    naturalLifeSpan = nls;
    if(growthRate >= 0) {
      growthRate = float(growthRate_);
    }
    else {
      growthRate = 1/growthRate;
    }
    
    heightCap = heightCap_;
  }
/*
  Building(PVector location_, int w_, int h_, int d_, int nls, boolean col) {
    location = location_;
    w = w_;
    h = h_;
    d = d_;

    if(col) {
      c = color(#3648D6); 
    }
    else {
      c = color(#3648D6); 
    }
    
   
    
    ExtrudeShape e = new ExtrudeShape(c);
    e.addVertex(0, 0);
    e.addVertex(50, 0);
    e.addVertex(50, 50);
    e.addVertex(0, 50);
    
    dna = new DNA(e);//, 3, 4, 5);    
    
    maxWidth = 800;
    heightCap = 800;
    maxDepth = 800;
    deathChance = 0;
    naturalLifeSpan = nls;
  }
  */

  void update() {
    pushMatrix();
    translate(location.x, location.y, location.z);
    fill(c);
    strokeWeight(8);
    stroke(255);
    
    dna.e.extrudeDraw(h);
    //box(w, h, d);
    if (!dying) {
      growUp();
      //growOutX();
      //growOutZ();
      isDying();
    }
    else {
      die();
    }
    popMatrix();
  }

  void run(ArrayList<Building> buildings) {
    // display();
    update();
  }

  void growUp() {
    if (abs(h) <= heightCap && !stoppedY) {
      h -= growthRate;
    }
  }

  void isDying() {
    if (numberYears > naturalLifeSpan) {
      float deathThreshold = random(100);
      if (deathChance > deathThreshold) {
        dying = true;
      }
      else {
        deathChance += 0.01;
      }
    }
    numberYears++;
  }

  void die() {
    dying = true;
    if(h >= 0) {
      dead = true; 
    }
    else {
      h++; 
    }
  }
  
  
   void growOutX() {
     if (w <= maxWidth && !stoppedX) {
       w++;
     }
   }

  void growOutZ() {
    if (d <= maxDepth && !stoppedZ) {
      d++;
    }
  }

  void isColliding(ArrayList<Building> buildings) {
    //println("Colliding");
    for (Building b : buildings) {
      //println("not same");
      if (location != b.location) {
        /*  println("W: " + w);
         println("B.w: " + b.w);*/
         //println("LocX: " + location.x + " LocX+w: " + (location.x+w));
         //println("B.locX: "+ (b.location.x) + " b.locX+b.w: " + (b.location.x + b.w));
   /*      if (((location.x) > (b.location.x))) {
           println("Smaller x");
         }
         if(((location.x) < ((b.location.x)-(b.w)))) {
           println("Bigger x");
         }
         if((location.z) > (b.location.z)) {
           println("Smaller z"); 
         }
         if((location.z) < ((b.location.z)-(b.d))) {
           println("Bigger z");
         }*/

        if (((location.x) > (b.location.x)) && 
            ((location.x) < ((b.location.x)+(b.w))) && 
            ((location.z) > (b.location.z)) && 
            ((location.z) < ((b.location.z)+(b.d)))) {
              //println("GAH");
              stoppedX = true;
              stoppedZ = true;
        }
  
        /*
        if (((location.y+h) > b.location.y) && ((location.y+h) < (b.location.y+b.h)) &&
         ((location.z+d) > b.location.z) && ((location.z+d) < (b.location.z+b.d))) {// ||
         //   (location.x < (b.location.x+w) && (location.x > b.location.x))) {
         stoppedX = true;
         println("Stopped x");
         }
         if(((location.x+w) > b.location.x) && ((location.x+w) < (b.location.x+b.w)) &&
         ((location.z+d) > b.location.z) && ((location.z+d) < (b.location.z+b.d))) {
         stoppedY = true; 
         println("Stopped y");
         }
         if(((location.x+w) > b.location.x) && ((location.x+w) < (b.location.x+b.w)) &&
         ((location.y+h) > b.location.y) && ((location.y+h) < (b.location.y+b.h))) {
         stoppedZ = true; 
         println("Stopped z");
         }*/
      }
    }
  }
}

