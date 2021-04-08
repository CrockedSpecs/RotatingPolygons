void setup() {
  size(1000, 600);
}

void draw() {
  background(0, 255, 255);

  
  pushMatrix();
  strokeWeight(5);
  fill (255,0,0);
  stroke (255, 255, 255); 
  translate(mouseX,mouseY);
  polygon(0, 0, 100, 3);
  popMatrix();
  
  pushMatrix();
  strokeWeight(5);
  fill (0,250,0);
  stroke (0, 0, 0); 
  translate(mouseX,mouseY-150);
  rotate(frameCount*2/200.0);
  polygon(0, 0, 50, 4);
  popMatrix();
  
  pushMatrix();
  strokeWeight(5);
  fill (0,0,250);
  stroke (0, 0, 0); 
  translate(mouseX+150,mouseY);
  rotate(frameCount*3/200.0);
  polygon(0, 0, 50, 5);
  popMatrix();
  
  pushMatrix();
  strokeWeight(5);
  fill (0,0,0);
  stroke (255, 255, 255); 
  translate(mouseX,mouseY+150);
  rotate(frameCount*-2/200.0);
  polygon(0, 0, 50, 6);
  popMatrix();
  
    pushMatrix();
  strokeWeight(5);
  fill (255,255,255);
  stroke (0, 0, 0); 
  translate(mouseX-150,mouseY);
  rotate(frameCount*4/200.0);
  polygon(0, 0, 50, 20);
  popMatrix();
}
  
void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
