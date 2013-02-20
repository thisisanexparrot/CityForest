class Building {
  //PVector location;
  ExtrudeShape baseShape;
  DNA dna;
  float growthRate;
  
  int w, h, d;
  int heightCap, maxWidth, maxDepth;

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

  Building(DNA dna_) { //PVector location_, 
    //location = location_; 
    dna = dna_;
    //naturalLifeSpan = nls;
  }
  
  void run(ArrayList<Building> buildings) {
    pushMatrix();
    display();
    update();
    popMatrix();
  }
  
  void display() {
    translate(dna.location.x, dna.location.y, dna.location.z);
    fill(c);
    strokeWeight(8);
    stroke(255);
  }
  
  void update() {
    dna.e.extrudeDraw(h);
    if (!dying) {
      growUp();
      isDying();
    }
    else {
      die();
    }
  }
  
  boolean canBreed(int breedingAge) {
    if(!dying && numberYears > breedingAge) {
      return true;
    }
    return false;
  }

  //Brahmagupta's Formula 
  int calcVolume() {
    ExtrudeShape base = dna.e;
    Vertex v1 = base.vertices2D.get(0);
    Vertex v2 = base.vertices2D.get(1);
    Vertex v3 = base.vertices2D.get(2);
    Vertex v4 = base.vertices2D.get(3);
    
    float a = sqrt(sq(v1.x-v2.x)+sq(v1.z-v2.z));
    float b = sqrt(sq(v2.x-v3.x)+sq(v2.z-v3.z));
    float c = sqrt(sq(v3.x-v4.x)+sq(v3.z-v4.z));
    float d = sqrt(sq(v4.x-v1.x)+sq(v4.z-v1.z));
    float s = (a + b + c + d) / 2;
    int baseArea = int(sqrt((s-a)*(s-b)*(s-c)*(s-d)));
    int volume = baseArea * (-1 * h);
    return volume;
  }
  
  void calcFitness() {
    int volume = calcVolume();
    fitness = volume;
    //calculate from  
  }

  void growUp() {
    if (abs(h) <= dna.heightCap && !stoppedY) {
      h -= dna.growthRate;
    }
  }

  void isDying() {
    if (numberYears > dna.naturalLifeSpan) {
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
      if (dna.location != b.dna.location) {
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

        if (((dna.location.x) > (b.dna.location.x)) && 
            ((dna.location.x) < ((b.dna.location.x)+(b.w))) && 
            ((dna.location.z) > (b.dna.location.z)) && 
            ((dna.location.z) < ((b.dna.location.z)+(b.d)))) {
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

