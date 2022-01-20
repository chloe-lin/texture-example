float rotx, roty; 
PImage diamond, grasstop, grassside, grassbottom, book, wood; 

void setup() { 
  size(800, 800, P3D);  
  diamond     = loadImage("diamondblock.png"); 
  grasstop    = loadImage("grassblocktop.png"); 
  grassside   = loadImage("grassblockside.png"); 
  grassbottom = loadImage("grassblockbottom.png"); 
  book        = loadImage("book.jpg"); 
  wood        = loadImage("wood.jpg"); 
  textureMode(NORMAL);
}

void draw() { 
  background(0); 
  
  texturedcube(width/2, height/2, 0, grasstop, grassside, grassbottom, 150); 
  texturedcube(100, 200, 0, wood, book, wood, 100); 
  texturedcube(600, 600, -200, diamond, 200); 
}

void texturedcube(float x, float y, float z, PImage texture, float size) { 
  pushMatrix();
  translate(x, y, z); 
  scale(size);
  rotateX(rotx); 
  rotateY(roty); 
  
  noStroke(); 
  
  beginShape(QUADS); 
  texture(texture);
  //top 
  //     x, y, z, tx, ty
  vertex(0, 0, 0, 0, 0); 
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);
  
  //bottom 
  vertex(0, 1, 0, 0, 0); 
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
  
  //front 
  vertex(0, 0, 1, 0, 0); 
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
  
  //back 
  vertex(0, 0, 0, 0, 0); 
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(0, 1, 0, 0, 1);
  
  //left 
  vertex(0, 0, 0, 0, 0); 
  vertex(0, 0, 1, 1, 0);
  vertex(0, 1, 1, 1, 1);
  vertex(0, 1, 0, 0, 1);
  
  //right 
  vertex(1, 0, 0, 0, 0); 
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(1, 1, 0, 0, 1);
  
  endShape(); 
  
  popMatrix(); 
}

void texturedcube(float x, float y, float z, PImage top, PImage side, PImage bottom, float size) { 
  pushMatrix();
  translate(x, y, z); 
  scale(size);
  rotateX(rotx); 
  rotateY(roty); 
  
  noStroke(); 
  
  beginShape(QUADS); 
  texture(top);
  //top 
  //     x, y, z, tx, ty
  vertex(0, 0, 0, 0, 0); 
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);
  
  endShape(); 
  
  beginShape(QUADS); 
  texture(bottom); 
  
  //bottom 
  vertex(0, 1, 0, 0, 0); 
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
  
  endShape();
  
  beginShape(QUADS); 
  texture(side); 
  
  //front 
  vertex(0, 0, 1, 0, 0); 
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
  
  //back 
  vertex(0, 0, 0, 0, 0); 
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(0, 1, 0, 0, 1);
  
  //left 
  vertex(0, 0, 0, 0, 0); 
  vertex(0, 0, 1, 1, 0);
  vertex(0, 1, 1, 1, 1);
  vertex(0, 1, 0, 0, 1);
  
  //right 
  vertex(1, 0, 0, 0, 0); 
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(1, 1, 0, 0, 1);
  
  endShape(); 
  
  popMatrix(); 
}

void mouseDragged() {  
  rotx = rotx + (pmouseY - mouseY)*0.01; 
  roty = roty + (pmouseX - mouseX)*-0.01; 
}
