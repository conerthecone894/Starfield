class Particle{ // the big guys you see
  double myX, myY, speed, angle;
  int opacity, textO, mySize;
  int[] clr = new int[6];
  
  Particle(){
    myX = 256.0;
    myY = 256.0;
    mySize = 3;
    opacity = 255;
    textO = 0;
    speed = Math.random()*13+1.5;
    angle = Math.random()*2*PI;
    
    clr[0] = color(#de024e);
    clr[1] = color(#fc4e51);
    clr[2] = color(#ffab89);
    clr[3] = color(#24793d);
    clr[4] = color(#0e3abf);
    clr[5] = color(#9350aa);
  }
  
  void show(){
    noStroke();
    fill(clr[(int)(Math.random()*6)], opacity);
    ellipse((int)myX, (int)myY, mySize, mySize);
  }
  
  void boom(){
    myX += Math.cos(angle)*speed;
    myY += Math.sin(angle)*speed;
    opacity --;
    
    if(speed <= 0){
      speed = 0;
    } else {
      speed -= 0.35;
    }
  }
  
  void end(){
    if(opacity <= 0)
      textO++;
    
    fill(clr[(int)(Math.random()*6)], textO);
    textSize(14);
    text("show's over. go home.", 88, 100);
  }
  
}

class smallParticle extends Particle{ //the little guys you see
  int[] myClr = new int[6];
  smallParticle(){
  mySize = 2;
 
  myClr[0] = color(255, 185, 170);
  myClr[1] = color(247, 212, 176);
  myClr[2] = color(244, 247, 173);
  myClr[3] = color(183, 247, 173);
  myClr[4] = color(173, 226, 247);
  myClr[5] = color(220, 173, 255);
  }
  
  void show(){
    noStroke();
    fill(myClr[(int)(Math.random()*6)], opacity);
    ellipse((float)myX, (float)myY, mySize, mySize);
  }
}

class Projectile{ //exploes
  int myX0, myY0, myX1, myY1;
  boolean showtime = false;
  
  Projectile(){
    myX0 = 256;
    myY0 = 522;
    myX1 = myX0;
    myY1 = myY0;
  }

  void show(){
    stroke(255);
    line(myX0, myY0, myX1, myY1);
  }
  
  void fire(){
    myX1 = myX0;
    myY1 = myY0;
    
    myY0 -= (int)(Math.random()*5);
   
  }

  void hide(){
    if(myY1 <= 256){
      myY0 = -888;
      myY1 = -888;
      showtime = true;
   }
  }

}
Particle[] tony = new Particle[888];
Projectile tim = new Projectile();


void setup(){
  size(512, 512);
  
  for(int i = 0; i < 400; i++){
    tony[i] = new Particle();
  }
  
  for(int i = 400; i < 888; i++){
    tony[i] = new smallParticle();
  }
  
}

void draw(){
  background(0);
  
  if(tim.showtime == true){
   for(int i = 0; i < tony.length; i++){
    tony[i].show();
    tony[i].boom();
    tony[i].end();
     }
   }
     
  tim.show();
  tim.fire();
  tim.hide();
}
