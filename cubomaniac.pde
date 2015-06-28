PImage src, dest;

void setup() {
  src = loadImage("logo.jpg");
  dest = createImage(src.width, src.height, RGB);
  size(src.width, src.height);
}

void draw() {
  horizontalStrips(4);
}

void verticalStrips(int n) {  
  src.loadPixels();
  dest.loadPixels();
  
  ArrayList<Integer> stripIndices = new ArrayList<Integer>();
  for (int index = 0; index < n; index++) {
    stripIndices.add(index);
  }
  int destX = 0;
  int margin = src.width/n;
  
  while (stripIndices.size() > 0) {
    int index = stripIndices.remove((int)random(stripIndices.size()));
    for (int x = index*margin; x < index*margin + margin; x++, destX++) {
      for (int y = 0; y < src.height; y++) {
        dest.pixels[destX + y*src.width] = src.pixels[x + y*src.width];
      }
    }
  }
  
  dest.updatePixels();
  image(dest, 0, 0);
}

void horizontalStrips(int n) {
  src.loadPixels();
  dest.loadPixels();
  
  ArrayList<Integer> stripIndices = new ArrayList<Integer>();
  for (int index = 0; index < n; index++) {
    stripIndices.add(index);
  }
  int destY = 0;
  int margin = src.height/n;
  
  while (stripIndices.size() > 0) {
    int index = stripIndices.remove((int)random(stripIndices.size()));
    for (int y = index*margin; y < index*margin + margin; y++, destY++) {
      for (int x = 0; x < src.width; x++) {
        dest.pixels[x + destY*src.width] = src.pixels[x + y*src.width];
      }
    }
  }
  
  dest.updatePixels();
  image(dest, 0, 0);
}

void verticalHorizontalStrips(int v, int h) {
  verticalStrips(v);
  sourceEqualsDestination();
  horizontalStrips(h);
}

void sourceEqualsDestination() {
  src = dest;
  dest = createImage(src.width, src.height, RGB);
}
