public double limit=0.75;
public double time=0;
public int level=3;
public void setup(){
  size(600,600);
  background(0);
  rectMode(CENTER);
  ellipseMode(CENTER);
}

public void draw(){
  time+=0.016;
  fractal(300,300,720);
  strokeWeight(2);
  line(0,100,295,295);
  line(0,500,295,305);
  line(600,500,305,305);
  line(600,100,305,295);
  line(0,125,295,298);
  line(0,475,295,302);
  line(600,475,305,302);
  line(600,125,305,298);
  strokeWeight(1);
  fill(240);
  beginShape();
  vertex(0,101);
  vertex(0,124);
  vertex(295,297);
  endShape();
  beginShape();
  vertex(600,101);
  vertex(600,124);
  vertex(305,297);
  endShape();
  beginShape();
  vertex(0,499);
  vertex(0,476);
  vertex(295,303);
  endShape();
  beginShape();
  vertex(600,499);
  vertex(600,476);
  vertex(305,303);
  endShape();
  fill(60);
  beginShape();
  vertex(-20,540);
  vertex(298,305);
  vertex(302,305);
  vertex(620,540);
  endShape();
  dashes(22,40,50,60);
  fill(0);
  rect(300,25,600,50);
  rect(300,575,600,50);
  fill(255);
  textSize(25);
  textAlign(CENTER);
  text("Time: "+(int)time+" seconds",175,35);
  text("FOV Level: "+(int)level,425,35);
}

public void keyPressed(){
  if(key=='a' && limit>0.55){
    limit-=0.1;
    level-=1;
  }
  if(key=='d' && limit<0.75){
    limit+=0.1;
    level+=1;
  }
  if(key=='r')
    time=0;
}

public void fractal(int x, int y, double len){
  fill(mouseX/4,mouseY/2,(int)(Math.random()*125)+130);
  strokeWeight(1.2);
  rect(x,y,(int)len,(int)(2*len/3));
  fill((int)(Math.random()*100)+125,mouseY/4,(int)(Math.random()*125)+130);
  strokeWeight(0.8);
  arc(x,y,(int)len,(int)(2*len/3),3*PI/4,5*PI/4);
  arc(x,y,(int)len,(int)(2*len/3),7*PI/4,9*PI/4);
  fill(mouseX/4,mouseY/2,(int)(Math.random()*125)+130);
  rect((float)(x-len/2.3),(float)y,(float)len/16,(float)len/8);
  rect((float)(x+len/2.3),(float)y,(float)len/16,(float)len/8);
  stroke(0);
  if(len>=10){
    fractal(x,y,limit*len);
  }
}

public void dashes(int lenx, int leny, int y2, int gap){
  fill(255,230,20);
  beginShape();
  vertex(300-lenx/2,550-y2+gap-leny);
  vertex(300-lenx/2.5,550-y2+gap-(2*leny));
  vertex(300+lenx/2.5,550-y2+gap-(2*leny));
  vertex(300+lenx/2,550-y2+gap-leny);
  endShape();
  if(leny>5){
    dashes(lenx-4,leny-8,y2+100,(int)(gap*1.4));
  }
}
