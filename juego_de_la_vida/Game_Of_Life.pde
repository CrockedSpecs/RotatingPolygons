int filas = 40;
int columnas = 40;
int C= 20;
void setup(){
  size (600,600);
}
void draw(){
  background (171, 71, 188 );
  for( var i=0;i<600; i+=20){
    line (i, 0, i, 600);
    line (0, i, 600, i);}
}
