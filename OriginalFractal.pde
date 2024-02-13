

public void setup(){
  size(600,600);
  background(0);
}

public void draw(){
  squarerun(300,300,200,300);
}

public void keyPressed(){
  
}

public void square(int x, int y, int len){
  fill((float)Math.random()*255,(float)Math.random()*255,(float)Math.random()*255);
  beginShape();
  vertex(x-(len/2),y-(len/2));
  vertex(x-(len/2),y+(len/2));
  vertex(x+(len/2),y+(len/2));
  vertex(x+(len/2),y-(len/2));
  endShape();
}

public void squarerun(int x, int y, int len, int limit){
  if(limit<=len)
    square(x,y,len);
  else{
    squarerun(x,y,len,limit/2);
    squarerun(x,y,len/2,limit/4);
    squarerun(x,y,len/4,limit/8);
    squarerun(x,y,len/8,limit/16);
  }
}
