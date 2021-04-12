int [][] matriz;
int filas;
int columnas;
///variables_velocidad//
int velocidad =3;
int radioVel=70;
int valorVel=1;
int circleVelx=53;
int circleVely=552;
String velocity ="0.25x";
///variables_pausa////
int circlePausex= 143;
int circlePausey=552;
int radioPause=70;
boolean PauseButton=false;
///variables_aleatorio////
int circleRandomx= 233;
int circleRandomy=552;
int radioRandom=70;
boolean start=true;
int [][] matriz_manual;


int countVecinos(int[][]matriz,int x,int y){
  int sum=0;
  for (int i=-1; i<2 ; i++){
    for (int j = -1; j < 2; j++) {
      int fila=(x+i+ filas)%filas;
      int columna=(y+j+columnas)%columnas;
      sum+= matriz[fila][columna];
    }
  }
  sum-=matriz[x][y];
  return sum;
}
  
              ///////////juego de la vida////////////
void setup(){
  size (600,600); 
  //////creacion de matriz////////
  filas=30;
  columnas= 25;
    matriz=new int[filas][columnas];
    for (var i=0;i<filas; i++){
      for (var j=0;j<columnas; j++){
          matriz[i][j]=floor(random(2));
      }
        

    }
}
void draw(){
  frameRate(velocidad);
  background(0);
    
  ////////celulas iniciales///////
    for (var i = 0; i < filas; i++) {
      for (var j = 0; j < columnas; j++) {
        int r=(int)random(255);int g=(int)random(85,170);int b=(int)random(255);
        int x=i*20;
        int y=j*20;
        if (matriz[i][j]==1){
          fill (r ,g, b);
          stroke (133, 146, 158);
          square(x,y, 20);
        }

            
      }
    
  }

  //////nuevas generaciones//////////
    if (PauseButton==true){
      int[][] generaciones=new int [filas][columnas];
      for (var i = 0; i < filas; i++) {
        for (var j = 0; j < columnas; j++) {
          int estado=matriz[i][j];
          int vecinos=countVecinos(matriz,i,j);
      
          if (estado==0 && vecinos==3){
            generaciones[i][j]=1;}
            else if (estado==1 && (vecinos<2 || vecinos >3)){
              generaciones[i][j]=0;}
            else {
              generaciones[i][j]=estado;
            }  
        }
      }
  matriz=generaciones;
  
  }
  ///cuadricula/////
  stroke(133, 146, 158);
  for( var i=0;i<600; i+=20){
    line (i, 0, i, 500);}
  for (var j=0;j<501;j+=20){
    line (0, j, 600, j);}

                                ///////botones////////////
 /////boton velocidad//////////
  fill (255);
  circle (circleVelx, circleVely, radioVel);
  fill (0);
  textSize(20);
  text(velocity, 26,559);
  
  
  ////boton pausa//////////
  fill (255);
  circle (circlePausex,circlePausey,radioPause);
  if (PauseButton==false){
    fill (0);
    triangle(127,529,127,575,162,552);}
    else {
      fill (0);
      rect(125,530,15,44);
      rect(145,530,15,44);}
      
  ///boton aleatorio/////
  fill (255);
  circle (circleRandomx,circleRandomy,radioRandom);
  if (start==true){
    fill (0);}
    else {
      fill (82,82,82);}
  square (212,532,40);


}
                                                  
  ////velocidad//////
void mousePressed(){
  float velB =dist(mouseX, mouseY, circleVelx, circleVely);
  if (velB < radioVel/2){
    valorVel+=1;
  if (valorVel==2){
    velocity="0.50x";
    velocidad=5;}
  else if (valorVel==3){
    velocity="1.0x";
    velocidad=10;}
  else if (valorVel==4){
    velocity="1.5x";
    velocidad=15;}
  else if (valorVel==5){
    velocity="2.0x";
    velocidad=20;}
  else if (valorVel>5){
    velocity="0.25x";
    velocidad=3;
    valorVel=1;}
  }  
  //////pausa/////
  float PauseB =dist(mouseX, mouseY, circlePausex, circlePausey);
  if (PauseB < radioPause/2){
    if (PauseButton==false){
      PauseButton=true;
    } else{
    PauseButton=false;}
  }
  //////aleatorio/////
  float RandomB =dist(mouseX, mouseY, circleRandomx, circleRandomy);
  if (RandomB < radioRandom/2){
    if(start==true){
        start=false;
        for (var i=0;i<filas; i++){
          for (var j=0;j<columnas; j++){
            matriz[i][j]=0;
          }
        }

            
          
    } else if (start==false){
      start=true;
        for (var i=0;i<filas; i++){
          for (var j=0;j<columnas; j++){
            matriz[i][j]=floor(random(2));
          }
        }
      }
  }
}
void mouseDragged(){
  if (start==false){
    if (matriz[mouseX/20][mouseY/20]==1){
      matriz[mouseX/20][mouseY/20]=0;
    }else if (matriz[mouseX/20][mouseY/20]==0){
      matriz[mouseX/20][mouseY/20]=1;
    }
  }
}
      
/*                            referencias
  +++ https://processing.org/reference/
  +++ https://www.youtube.com/watch?v=cWWNBnfSv6Y&ab_channel=JesusAlvaro
  +++ https://www.youtube.com/playlist?list=PLtyMmy0eKyqFsLPesmz7y4EznkZFJrGuu
*/
