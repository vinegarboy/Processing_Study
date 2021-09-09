size(400, 400);
int d = width/10;
for(int x=0;x<10;x++){
	for(int y=0;y<10;y++){
		ellipse((d/2)+(x*d), (d/2)+(y*d), d,d);
	}
}