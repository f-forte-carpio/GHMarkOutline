class Dot{
  float xoff=0;
  PVector pos,vel,acc,dest;
  color c;
  Dot(PVector d){
    pos=new PVector(random(width),random(height));
    dest=d;
    vel=new PVector(0,0);
    acc=new PVector(0,0);
    c=color(random(50,255),random(50,255),random(50,255));
    xoff=random(40);
  }
  void show(){
    noStroke();
    if(dist(pos.x,pos.y,dest.x,dest.y)<100){
      float f=map(dist(pos.x,pos.y,dest.x,dest.y),0,100,255,0);
      fill(c,f);
      circle(pos.x,pos.y,5);
    }
  }
  void move(){
    acc.add(toDest());
    acc.add(rMove());
    acc.limit(0.1);
  }
  void update(){
    move();
    pos.add(vel);
    vel.add(acc);
    vel.limit(1);
    acc.mult(0);
    show();
  }
  PVector toDest(){
    PVector dist=new PVector(dest.x-pos.x,dest.y-pos.y);
    return new PVector(dist.x-vel.x,dist.y-vel.y);
  }
  PVector rMove(){
    xoff+=0.1;
    float x=map(noise(xoff,f),0,1,0,TWO_PI);
    return new PVector(5*cos(x),5*sin(x));
  }
}
