PImage bg,angel;
int score,time;
float  angelW;
float  angelH;
int stageNum;

//music
import ddf.minim.*;  //import the Minim library

//create Minim variable
Minim minim;

//create AudioPlayer variable
AudioPlayer player;


////////////////////////////////////////////////////////////////////////////level 1
//arrays boom
int totalNum =8;      // total number of images
PImage[] img = new PImage [totalNum];  //boom 1. declare an array of images of boom
float[] x  = new float [totalNum];  //boom
float[] y = new float [totalNum]; //boom
float[] dy = new float [totalNum];//boom
float[] w  = new float [totalNum];//boom
float[] h  = new float [totalNum];//boom
boolean[] touch1=new boolean[totalNum];//boom

//(make the background move down)
float pos;//move sky
float speed;//move sky
//arrays star
int totalNum1 =17;//star
float[] xs  = new float [totalNum1];  //star
float[] ys = new float [totalNum1]; //star
float[] dys = new float [totalNum1];//star
float[] ws  = new float [totalNum1];//star
float[] hs  = new float [totalNum1];//star
boolean[] touchstar=new boolean[totalNum1];//star
PImage[] star = new PImage [totalNum1];//star

int startTime; //present time in game
boolean gameisover;//when game is over, all stars and booms are disappear.
int overtime;//present over time

///////////////////////////////////////////////////////////////////////////////////level 2
PImage bg2;
//arrays booms
PImage[] img2 = new PImage [totalNum];  //level2 boom 1. declare an array of images of boom
float[] x2  = new float [totalNum];  //level2 boom
float[] y2 = new float [totalNum]; //level2 boom
float[] dy2 = new float [totalNum];//level2 boom
float[] w2  = new float [totalNum];//level2 boom
float[] h2  = new float [totalNum];//level2 boom
boolean[] touch12=new boolean[totalNum];//level2 boom

//Rotate the background 
float speed2 = 0.15;//rotate
float scale = 2.2;//rotate
float centerX = 200;//rotate
float centerY = 200;//rotate
float angle;//rotate
boolean timestop;
//arrays  stars
float[] xs2  = new float [totalNum1];  //level2 star
float[] ys2 = new float [totalNum1]; //level2 star
float[] dys2 = new float [totalNum1];//level2 star
float[] ws2  = new float [totalNum1];//level2 star
float[] hs2  = new float [totalNum1];//level2 star
boolean[] touchstar2=new boolean[totalNum1];//level2 star
PImage[] star2 = new PImage [totalNum1];//level2 star

int startTime2;
boolean gameisover2;//when game is over, all stars and booms are disapper.
  int overtime2;//present over time
  
  int xlevel2;// use keyborad to control
  boolean isRIGHT;// use keyborad to control
  boolean isLEFT;// use keyborad to control
  
  //win
  PImage winbg;
  
  
 void setup()
 {
 
    //music create a Minim object 
  minim = new Minim(this); 
  //load the song into the player
  player = minim.loadFile("song.mp3");
   player.rewind(); //rewind to the begining of the song
    player.play();
    
    
   size(700,700);
  bg=loadImage("sky.png");
  angel=loadImage("angel.png");
  score=0;
  time=0;
  timestop=false;
  angelW=120;
  angelH=120;
  stageNum=0;
  //stageNum
  //0:welcome page
  //1:level 1
  //2:level 2
  //3:win
  
  
  //level 1 
  startTime=millis();//time
   pos = 0;
  speed = -0.5;
  gameisover=false;
  //looping
  for (int i = 0; i < img.length; i=i+1) {//boom
    float scale = random(0.05,0.1);
    img[i] = loadImage("boom0.png");
    
    w[i]  = img[i].width * scale;
    h[i]  = img[i].height * scale;
    x[i]  = random(0, width-w[i]);
   y[i]  = random(-500, 50);
    dy[i] = random(0.8, 2);
    touch1[i]=false;
   
  }
  
  
  for (int i = 0; i < star.length; i=i+1) {//star
    float scale = random(0.05,0.1);
    star[i] = loadImage("star.png");
    
    ws[i]  = star[i].width * scale;
    hs[i]  = star[i].height * scale;
    xs[i]  = random(0, width-ws[i]);
   ys[i]  = random(-500, 50);
    dys[i] = random(0.8, 2);
    touchstar[i]=false;
  }
    startTime=millis();//time
    
 //level 2

  bg2=loadImage("sky2.jpg");
  gameisover2=false;
  angle = 0;//rotate
 isRIGHT = false;
 isLEFT=false;

  for (int i = 0; i < img2.length; i=i+1) {//boom
    float scale = random(0.1,0.15);
    img2[i] = loadImage("boom"+i+".png");
    
    w2[i]  = img2[i].width * scale;
    h2[i]  = img2[i].height * scale;
    x2[i]  = random(0, width-w2[i]);
   y2[i]  = random(-500, 200);
    dy2[i] = random(0.8, 2.5);
    touch12[i]=false;
   
  }
  
  for (int i = 0; i < star2.length; i=i+1) {//star
    float scale = random(0.05,0.1);
    star2[i] = loadImage("star.png");
    
    ws2[i]  = star2[i].width * scale;
    hs2[i]  = star2[i].height * scale;
    xs2[i]  = random(0, width-ws2[i]);
   ys2[i]  = random(-500, 200);
    dys2[i] = random(0.8, 2.5);
    touchstar2[i]=false;
 }
 startTime2=millis();//time
 //win
 winbg=loadImage("winbackground.jpg");
 }
 /////////////////////////////////////////////
 void draw() {// use if fuction to control stage
if (stageNum == 0) {
drawWelcome();
}
else if (stageNum == 1) {
drawLevel1();
}
else if (stageNum == 2) {
drawLevel2();
}
else if (stageNum == 3) {
drawwin();
}
}


void drawWelcome()
{
   image(bg,0,0,700,700);
  image(angel,mouseX,560,120,120);
  fill(144,255,141);
  textSize(40);
  text("instructions:",96,159);
  fill(144,255,141);
  textSize(25);
  text("Player should touch stars and avoid booms.",96,200);
  fill(144,255,141);
  textSize(25);
  text("Touch star: score will plus one.",96,240);
  fill(144,255,141);
  textSize(25);
  text("Touch boom: score will minus one.",96,280);
  fill(144,255,141);
  textSize(25);
  text("Limit time:15s.",96,320);
  fill(144,255,141);
  textSize(25);
  text("Target score: bigger than 15",96,360);
  fill(144,255,141);
  textSize(25);
  
  
  
  fill(255);
  textSize(40);
  text("Start game: press 'k'.",135,560);
  
  
  fill(144,255,141);
  textSize(25);
  text("Level 1: use mouse",96,400);
  
   fill(144,255,141);
  textSize(25);
  text("Level 2: use keyboard",96,440);
  fill(144,255,141);
  textSize(25);
  text("You can press 'p' to stop music during game",96,480);
  fill(144,255,141);
  textSize(25);
  text("You can press 'q' to resume music during game",96,520);
  
  
  fill(144,255,141);
  textSize(30);
  text("Time: 0",30,30);//time
  fill(144,255,141);
  textSize(30);
  text("Score: 0",30,65);//score

}




////////////////////////////////////////////////////////////////////
void drawLevel1()
{
  // make background moves down
  image(bg,0,pos, width*1.15, height);
  image(bg,0,height+pos, width*1.15, height);
  pos = pos + speed;
  if (pos <= -height) {
    pos = 0;
}


  image(angel,mouseX-60,560,120,120);
  
  
  if(gameisover==false)// when game is not over, stars and booms are Fall off the page.
  {
  for (int i = 0; i < img.length; i=i+1) {   // boom
  if(touch1[i]==false)//first if function
  {
    image(img[i], x[i],y[i] , w[i], h[i]);
   y[i] = y[i] + dy[i];//boom dowmward
   
   if(y[i]>700)//if boom falls under the page, it will reset from top of the page
   {
    y[i]= random(-100, -5);
   
   }
   
  }
  
  // remrmber boom and angel's positions
  float aleft=x[i];
 float aright=x[i]+w[i];
 float atop=y[i];
 float abottom=y[i]+h[i];
 
 float bleft=mouseX-angelW/2;
 float bright=mouseX+angelW/2;
 float btop=560;
 float bbottom=560+angelH;
 
 if(atop<bbottom&&btop<abottom&&aleft<bright&&bleft<aright)// if angle touch boom, score will minue one and boom disappear.
 {
   touch1[i]=true;
   score=score-1;
   
if(touch1[i]==true)//reset boom when is touched, it will reset from top of the page
  {
    y[i]=random(-500, 20);
    touch1[i]=false;
 }

 }  
}//booms finish



for (int i = 0; i < star.length; i=i+1) {   //stars same like booms in level1
  if(touchstar[i]==false)//first
  {
    image(star[i], xs[i],ys[i] , ws[i], hs[i]);
   ys[i] = ys[i] + dys[i];
   
   if(ys[i]>700)
   {
    ys[i]= random(-100, -5);
     
   }//reset stars
   
  }// is first
  float alefts=xs[i];
 float arights=xs[i]+ws[i];
 float atops=ys[i];
 float abottoms=ys[i]+hs[i];
 
 float blefts=mouseX;
 float brights=mouseX+angelW;
 float btops=560;
 float bbottoms=560+angelH;
 if(atops<bbottoms&&btops<abottoms&&alefts<brights&&blefts<arights)// second if angle touch stars, score will plus one and stars disappear.
 {
   touchstar[i]=true;
   score=score+1;
if(touchstar[i]==true)//reset stars which is touched
  {
    ys[i]=random(-500, 20);
    touchstar[i]=false;
 }//is second

 }  
}//stars finish


}


fill(144,255,141);
  textSize(30);
    text("Time: "+(millis()-startTime)/1000+"s",30,30);//time

  fill(144,255,141);
  textSize(30);
  text("Score: "+score,30,65);//score
  
  if((millis()-startTime)/1000<=20&&score<0)// lose game: Time is not over, when player’s score is smaller than zero
  {
    
    timestop=true;
    fill(126,237,62);
  textSize(60);
    text("You are lose!",180,293);
  fill(126,237,62);
  textSize(40);
  text("press 'r' or 'R' restart ",150,350);
  gameisover=true;
 
  
  }
  
  if((millis()-startTime)/1000>=20&&score<15)// lose game :Time is  over, when player’s score is smaller than 15
  {
   
    timestop=true;
    fill(126,237,62);
  textSize(60);
    text("You are lose!",180,293);//time
  fill(126,237,62);
  textSize(40);
  text("press 'r' or 'R' restart ",150,350);//score
   gameisover=true;
   fill(144,255,141);
  textSize(30);
  
 
  }
  
  
   if((millis()-startTime)/1000<=20&&score>=15)// win, go on level2
  {
    
    timestop=true;
    fill(126,237,62);
  textSize(60);
    text("You are win!",180,293);//time
  fill(126,237,62);
  textSize(40);
  text("press 'c' or 'C' continue ",150,350);//score
   gameisover=true;
   fill(144,255,141);
  textSize(30);
  
   
  }
  
  
}

///////////////////////////////////////////////////////////////////////
void drawLevel2()
{
  
  
  //background rotate 
  pushMatrix();
  translate(centerX, centerY);
  rotate(radians(angle));
  angle = angle + speed2;
  image(bg2, -width*scale/2, -height*scale/2, width*scale, height*scale);
  popMatrix();
  
  
  image(angel,xlevel2,560,120,120);
  
  //use keyboard to control angel
  if (isLEFT==true) //LEFT
  {

    xlevel2 = xlevel2 -3;
  }
  if (isRIGHT==true) //RIGHT
  {
    
    xlevel2 = xlevel2 +3;
  }
  
 //booms, same like booms in level1
  if(gameisover2==false)
  {
  for (int i = 0; i < img2.length; i=i+1) {   
  if(touch12[i]==false)//first
  {
    image(img2[i], x2[i],y2[i] , w2[i], h2[i]);
   y2[i] = y2[i] + dy2[i];
   
   if(y2[i]>700)
   {
    y2[i]= random(-100, -5);
     
   }//reset boom
   
  }// is first
  float aleft=x2[i];
 float aright=x2[i]+w2[i];
 float atop=y2[i];
 float abottom=y2[i]+h2[i];
 
 float bleft=xlevel2-angelW/2;
 float bright=xlevel2+angelW/2;
 float btop=560;
 float bbottom=560+angelH;
 if(atop<bbottom&&btop<abottom&&aleft<bright&&bleft<aright)// second if angle touch boom, score will minue one and boom disappear.
 {
   touch12[i]=true;
   score=score-1;
if(touch12[i]==true)//reset boom which is touched
  {
    y2[i]=random(-500, 20);
    touch12[i]=false;
 }//is second

 }  
}//booms finish


//stars, same like stars in level1
for (int i = 0; i < star2.length; i=i+1) {   
  if(touchstar2[i]==false)//first
  {
    image(star2[i], xs2[i],ys2[i] , ws2[i], hs2[i]);
   ys2[i] = ys2[i] + dys2[i];
   
   if(ys2[i]>700)
   {
    ys2[i]= random(-100, -5);
     
   }//reset stars
   
  }// is first
  float alefts=xs2[i];
 float arights=xs2[i]+ws2[i];
 float atops=ys2[i];
 float abottoms=ys2[i]+hs2[i];
 
 float blefts=xlevel2-angelW/2;
 float brights=xlevel2+angelW/2;
 float btops=560;
 float bbottoms=560+angelH;
 if(atops<bbottoms&&btops<abottoms&&alefts<brights&&blefts<arights)// second if angle touch stars, score will plus one and stars disappear.
 {
   touchstar2[i]=true;
   score=score+1;
if(touchstar2[i]==true)//reset stars which is touched
  {
    ys2[i]=random(-500, 20);
    touchstar2[i]=false;
 }//is second

 }  
}//stars finish


}


 fill(144,255,141);
  textSize(30);
    text("Time: "+(millis()-startTime2)/1000+"s",30,30);//time

  fill(144,255,141);
  textSize(30);
  text("Score: "+score,30,65);//score
  
  if((millis()-startTime2)/1000<20&&score<0)// lose game :Time is not over, when player’s score is smaller than zero
  {
    fill(126,237,62);
  textSize(60);
    text("You are lose!",180,293);
  fill(126,237,62);
  textSize(40);
  text("press 'r' or 'R' restart ",150,350);
  gameisover2=true;
 
  
  }
  
  if((millis()-startTime2)/1000>20&&score<15)// lose game :Time is  over, when player’s score is smaller than 15
  {
    fill(126,237,62);
  textSize(60);
    text("You are lose!",180,293);//time
  fill(126,237,62);
  textSize(40);
  text("press 'r' or 'R' restart ",150,350);//score
   gameisover2=true;
   fill(144,255,141);
  textSize(30);
  
 
  }
  
  
   if((millis()-startTime2)/1000<=20&&score>=15)// win, go on win page
  {
    
  fill(126,237,62);
  textSize(40);
  text("please press 'w' or 'W' ",150,350);//score
   gameisover2=true;
   fill(144,255,141);
  textSize(30);
  
   
  }
  
  
}

//////////////////////////////////////////////////////////////////////////
void drawwin()
{
  image(winbg,0,0,700,700);
  println(mouseX+","+mouseY);
  fill(157,39,255);
  textSize(60);
  text("press 'r' or 'R' try again",29,450);
  fill(random(255),random(255),random(255));
  textSize(75);
  text("You are winner!",75,300);
  
}

 void keyPressed()
 {
   if (key == 'p') //pause music
  {
    if (player.isPlaying())
    {
      player.pause();
      println("Pause");
    }
  }
   if (key == 'q') //resume music
  {
    player.play();  //resume at the current position of the song
    println("Resume");
  }
  
  
  // use if fuction and keyPressed function to change stage
   if(stageNum==0&&key=='k')
   {
     startTime=millis();
     stageNum=1;
   }else if(stageNum==1&&(gameisover==true)&&(key=='r'||key=='R'))
   {
     player.pause(); //pause
    player.rewind(); //rewind to the begining of the song
    println("Stop");
     setup();
     
   }else if(stageNum==1&&(gameisover==true)&&(key=='c'||key=='C'))
   {
     stageNum=2 ;
     startTime2=millis();//time
     score=0;
     time=0;
   }else if(stageNum==2&&(gameisover2==true)&&(key=='w'||key=='W'))
   {
     stageNum=3;
     
   }else if (stageNum==2&&(gameisover2==true)&&(key=='r'||key=='R'))
   {
     
    player.pause(); //pause
    player.rewind(); //rewind to the begining of the song
    println("Stop");
   setup();
   }else if (stageNum==3&&(key=='r'||key=='R'))
   {if (player.isPlaying())
    {
      player.pause();//when restart the game, music also restart.
      println("Pause");
    }
     setup();
     
   }

 

  ///use keyboard to control angel in level2
  if (keyCode == LEFT)
    isLEFT=true;
  if (keyCode == RIGHT)
    isRIGHT=true;
}


void keyReleased()// use keyborad to control
{
 
  if (keyCode == LEFT)
    isLEFT=false;
  if (keyCode == RIGHT)
    isRIGHT=false;
} 


 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
