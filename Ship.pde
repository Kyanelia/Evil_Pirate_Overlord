class Ship{
 color c;
 float xpos;
 float ypos;
 float w = 40;
 float h = 20;
 float right = 1;
 float left = 1; 
 Canon[] canon = new Canon[10];
 int canonsFired = 0;
 boolean fired = false;
 PImage ship = loadImage("pirate_ship_left.png");

 
 Ship(color tempc, float tempx, float tempy){
   c = tempc;
   xpos = tempx;
   ypos = tempy;
 }
 
 void setupCanons(){
   for(int j=0;j<cballs;j++){
     canon[j] = new Canon(0,0,false);
   }
 }
 void display(){
/*   stroke(0);
   fill(c);
   rectMode(CENTER);
   rect(xpos, ypos, w, h);*/
   image(ship, xpos, ypos);
 }

   
 
 void move() {
     if((moveRight || (moveRight && canonball)) && xpos+w < width){
       xpos+=right;
       right+=0.5;
       left = 1;
       ship = loadImage("pirate_ship_right.png");
     }
     if((moveLeft || (moveLeft && canonball))  && xpos>0){
       xpos-=left;
       left+=0.5;
       right=1;
       ship = loadImage("pirate_ship_left.png");
     }
     else {
     xpos = xpos;
   }
 }

 void fire() {
   if((canonball || (canonball && moveRight) || (canonball && moveLeft) )&& canonsFired < cballs && frameCount % 10 == 0){
     if(canon[canonsFired].fired == false){
       canon[canonsFired].cxpos = xpos+20;
       canon[canonsFired].cypos = ypos+10;
       canon[canonsFired].fired = true;
       canonsFired++;
     }
     if(canonsFired == cballs){
       canonsFired = 0;
     }
   }
 }   
}
