PImage source, destination;

void setup() {
  source = loadImage("logo.jpg");
  destination = createImage(source.width, source.height, RGB);
  size(source.width, source.height);
}

void draw() {
  horizontalStrips(4);
}

void verticalStrips(int n) {  
  source.loadPixels();
  destination.loadPixels();
  
  ArrayList<Integer> stripIndices = new ArrayList<Integer>();
  for (int index = 0; index < n; index++) {
    stripIndices.add(index);
  }
  int destX = 0;
  int margin = source.width/n;
  
  while (stripIndices.size() > 0) {
    int index = stripIndices.remove((int)random(stripIndices.size()));
    for (int x = index*margin; x < index*margin + margin; x++, destX++) {
      for (int y = 0; y < source.height; y++) {
        destination.pixels[destX + y*source.width] = source.pixels[x + y*source.width];
      }
    }
  }
  
  destination.updatePixels();
  image(destination, 0, 0);
}

void horizontalStrips(int n) {
  source.loadPixels();
  destination.loadPixels();
  
  ArrayList<Integer> stripIndices = new ArrayList<Integer>();
  for (int index = 0; index < n; index++) {
    stripIndices.add(index);
  }
  int destY = 0;
  int margin = source.height/n;
  
  while (stripIndices.size() > 0) {
    int index = stripIndices.remove((int)random(stripIndices.size()));
    for (int y = index*margin; y < index*margin + margin; y++, destY++) {
      for (int x = 0; x < source.width; x++) {
        destination.pixels[x + destY*source.width] = source.pixels[x + y*source.width];
      }
    }
  }
  
  destination.updatePixels();
  image(destination, 0, 0);
}

void verticalHorizontalStrips(int v, int h) {
  verticalStrips(v);
  sourceEqualsDestination();
  horizontalStrips(h);
}

void sourceEqualsDestination() {
  source = destination;
  destination = createImage(source.width, source.height, RGB);
}
