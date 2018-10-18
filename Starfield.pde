Particle[] p;

void setup(){
	size(1500,1000);
	frameRate(40);
	p = new Particle[500];
	for(int i = 0; i < p.length; i++){
		p[i] = new NormalParticle();
	}
	p[0] = new OddballParticle();
	p[1] = new JumboParticle();
	p[2] = new JumboParticle();
}

void draw(){
	background(0);
	for(int i = 0; i < p.length; i++){
		p[i].show();
		p[i].move();
	}
	fill(0,0,0,240);
    ellipse(750,500,150, 150);
    fill(0,0,0,200);
    ellipse(750,500,250,250);
    fill(0,0,0,100);
    ellipse(750,500,400,400);
    p[0].move();
    p[0].show();
}

class NormalParticle implements Particle{
	double dX,dY,dTheta,dSpeed,ySize;
	int left;
		NormalParticle(){
			dX = 750;
			dY = 500;
			dTheta = Math.random()*(Math.PI*2);
			dSpeed = (Math.random()*4+.5);
			ySize = (Math.random()*5+1);
			left = 0;
		}
	
		public void show(){
			noStroke();
			fill(255);
			ellipse((float)dX,(float)dY,6,(float)ySize);
		}
	
		public void move(){
			dX = dX + Math.cos(dTheta)*dSpeed;
			dY = dY + Math.sin(dTheta)*dSpeed;
			if(dX > 1500 || dX < 0 || dY > 1000 || dY < 0){
				left++;
				if(left == 200){
					dX = 750;
					dY = 500;
					dTheta = Math.random()*(Math.PI*2);
					dSpeed = (Math.random()*4+.5);
					left = 0;
					redraw();
				}
			}
		}	
}

interface Particle{
	public void show();
	public void move();
}

class OddballParticle implements Particle{
	int myX,myY;

	OddballParticle(){
		myX = (int)(Math.random()*400);
		myY = (int)(Math.random()*400);
	}

	public void show(){
		fill(255,255,255,200);
		ellipse(myX,myY-8,20,20);
		fill(97);
		ellipse(myX,myY,50,15);
	}
	
	public void move(){
		myX = myX + (int)(Math.random()*7-3);
		myY = myY + (int)(Math.random()*7-3);

		if(myX > 1600 || myX < -100 || myY > 1100 || myY < -100){
			myX = (int)(Math.random()*400);
			myY = (int)(Math.random()*400);
		}

	}
	
}

class JumboParticle extends NormalParticle{
	public void show(){
		stroke(0);
		fill(0,0,153);
		ellipse((float)dX,(float)dY,50,50);
		stroke(128,128,255);
		noFill();
		ellipse((float)dX,(float)dY,75,5);
		noStroke();
		fill(0,0,153);
		ellipse((float)dX,(float)dY-5,45,10);
		rect((float)dX-25,(float)dY-5,50,5);
	}
	public void move(){
			dX = dX + Math.cos(dTheta)*dSpeed;
			dY = dY + Math.sin(dTheta)*dSpeed;
			if(dX > 1600 || dX < -100 || dY > 1100 || dY < -100){
				dX = 750;
				dY = 500;
				dTheta = Math.random()*(Math.PI*2);
				dSpeed = (Math.random()*4+.5);
				dX = dX + Math.cos(dTheta)*dSpeed;
				dY = dY + Math.sin(dTheta)*dSpeed;
			}
		}

}


