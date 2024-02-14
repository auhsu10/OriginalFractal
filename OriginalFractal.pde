public double limit=0.75;
public double time=0;
public int level=6;
public void setup(){
  size(600,600);
  background(0);
  rectMode(CENTER);
  strokeWeight(1);
}

public void draw(){
  time+=0.016;
  fractal(300,300,600);
  line(0,50,295,295);
  line(0,550,295,305);
  line(600,550,305,305);
  line(600,50,305,295);
  fill(0);
  rect(300,25,600,50);
  rect(300,575,600,50);
  fill(255);
  textSize(20);
  textAlign(CENTER);
  text("Time: "+(int)time,180,30);
  text("FOV Level: "+(int)level,400,30);
}

public void keyPressed(){
  if(key=='a' && limit>0.15){
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
  rect(x,y,(int)len,(int)(5*len/6));
  if(len>=10){
    fractal(x,y,limit*len);
  }
}
