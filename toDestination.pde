PImage img;
ArrayList<Dot> dots;
int f=100;
void settings() {
  img=loadImage("GitHub-Mark.png");
  size(img.width, img.height);
}
void setup() {
  dots=new ArrayList<Dot>();
  int reduceCount=0;
  img.loadPixels();
  //not the most effective way to do it but for this image in this scenario it's fine (will use sobel operator [and maybe canny edge detection] in the future)
  for (int i=1; i<img.width-1; i++) {
    for (int j=1; j<img.height-1; j++) {
      if (img.pixels[i+1+j*img.height]!=img.pixels[i+j*img.height]&&reduceCount%2!=0/*<--  only to reduce the amount of Dots so my computer doesn't crash and burn*/) {
        dots.add(new Dot(new PVector(i, j)));
      }
      reduceCount++;
    }
  }
  /*for testing:
   for (float i=0; i<360; i+=0.5) {
     dots.add(new Dot(new PVector(width/2+f*cos(radians(i)), height/2+f*sin(radians(i)))));
   }*/
  frameRate(60);
  print(dots.size());
}
void draw() {
  background(0);
  for (Dot d : dots) {
    d.update();
  }
  /*to save the visual:
  if(frameCount<60*10){
   saveFrame(); 
  }*/
}
