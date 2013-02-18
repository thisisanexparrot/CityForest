class Building {
  PVector location;
  int w;
  int h;
  int d;
  int maxWidth;
  int maxHeight;
  int maxDepth;

  int naturalLifeSpan;
  int numberYears;
  float deathChance;
  boolean dying;
  boolean dead;

  float fitness;
  DNA dna;
  color c;

  boolean stoppedX;
  boolean stoppedY;
  boolean stoppedZ;

  Building(PVector location_, int w_, int h_, int d_, int nls, boolean col) {
    location = location_;
    w = w_;
    h = h_;
    d = d_;
    
    dna = new DNA(3, 4, 5);    
    
    maxWidth = 800;
    maxHeight = 800;
    maxDepth = 800;
    deathChance = 0;
    naturalLifeSpan = nls;
    if(col) {
      c = color(#1522D6); 
    }
    else {
      c = color(#1522D6); 
    }
  }

  void update() {
    pushMatrix();
    translate(location.x+w, location.y+20, location.z+d);
    fill(c);
    strokeWeight(8);
    stroke(255);
    box(w, h, d);
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
    if (h <= maxHeight && !stoppedY) {
      h+=2;
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
    if(h <= 0) {
      dead = true; 
    }
    else {
      h--; 
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
      println();
    }
  }
}

