class ExtrudeShape {
  ArrayList<Vertex> vertices2D; 
  color c;
  
  ExtrudeShape(color c_) {
    vertices2D = new ArrayList<Vertex>();
    c = c_;
  }
    
  //Add vertices in order of connection 
  void addVertex(int x, int y) {
    Vertex v = new Vertex(x, 0, y);
    vertices2D.add(v);
  }
  
  void setColor(color c_) {
    c = c_;
  }
  
  void setStrokeColor(color c_) {
    stroke(c_);
  }
  
  void setStrokeWeight(int w) {
    strokeWeight(w); 
  }
  
  void extrudeDraw(int theHeight) {
    stroke(255);
    fill(c);
    ArrayList<Vertex> v3D = new ArrayList<Vertex>();
  
    for (int i = 0; i < vertices2D.size(); i++) {
      Vertex v0 = vertices2D.get(i);
      Vertex v1 = new Vertex(v0.x, theHeight, v0.z);
      v3D.add(v1);
    }
  
    //top
    beginShape();
    for (int i = 0; i < vertices2D.size(); i++) {
      Vertex v = vertices2D.get(i); 
      vertex(v.x, v.y, v.z);
    }
    endShape(CLOSE);
  
    //bottom
    beginShape();
    for (int i = 0; i < v3D.size(); i++) {
      Vertex v = v3D.get(i); 
      vertex(v.x, v.y, v.z);
    }
    endShape(CLOSE);
  
    //body
    beginShape(QUAD_STRIP);
    for (int i = 0; i < v3D.size(); i++) {
      Vertex top = vertices2D.get(i);
      Vertex bottom = v3D.get(i);
      vertex(top.x, top.y, top.z);
      vertex(bottom.x, bottom.y, bottom.z);
    }
    endShape(CLOSE);
  }

}
