Particle[] p;

void setup(){
	size(500,500);
	frameRate(50);
	p = new Particle[250];
	for(int i = 0; i < p.length; i++){
		p[i] = new NormalParticle();
	}
	p[0] = new OddballParticle();
	p[1] = new JumboParticle();
}

void draw(){
	background(0);
	for(int i = 0; i < p.length; i++){
		p[i].show();
		p[i].move();
	}
}

class NormalParticle implements Particle{
	double dX,dY,dTheta,dSpeed,ySize;
	int R,G,B;
		NormalParticle(){
			dX = dY = 250;
			dTheta = Math.random()*TWO_PI;
			dSpeed = (Math.random()*6)+1;
			ySize = (Math.random()*2+1);
		}
	
		public void show(){
			noStroke();
			fill(255);
			ellipse((float)dX,(float)dY,3,(float)ySize);
			fill(0);
		}
	
		public void move(){
			dX = dX + Math.cos(dTheta)*dSpeed;
			dY = dY + Math.sin(dTheta)*dSpeed;
			if(dX > 700 || dX < -50 || dY > 700 || dY < -50){
				dX = dY = 250;
				dTheta = Math.random()*TWO_PI;
				dSpeed = (Math.random()*6)+1;
				dX = dX + Math.cos(dTheta)*dSpeed;
				dY = dY + Math.sin(dTheta)*dSpeed;
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

		if(myX > 600 || myX < -50 || myY > 600 || myY < -50){
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
			if(dX > 1500 || dX < -300 || dY > 1500 || dY < -300){
				dX = dY = 250;
				dTheta = Math.random()*TWO_PI;
				dSpeed = (Math.random()*6)+1;
				dX = dX + Math.cos(dTheta)*dSpeed;
				dY = dY + Math.sin(dTheta)*dSpeed;
			}
		}

}


