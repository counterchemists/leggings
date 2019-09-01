import oscP5.*;
import java.awt.Robot;
import java.awt.event.KeyEvent;
import java.awt.AWTException;

Robot robot;

int[] selectedChannels = { 1, 2 }; // LEFT, RIGHT
//int[] selectedChannels = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16 };

OscP5 oscP5;
float[] analogInputs = new float[2];
float[] previousYPos = new float[selectedChannels.length];
float xPos = 0;
int previousWidth, previousHeigth;  // used to detect window resize

float minLeft = 0;
float minRight = (1 << 13);
float maxLeft = minLeft;
float maxRight = maxLeft;

/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
float thresholdLeft = .5; 
float thresholdRight = .5;
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

int debounceTime = 1000; // ms
int timestamp = 0;


void setup() {
  oscP5 = new OscP5(this, 8000);  // listen to port 8000
  size(600, 720);
  if (frame != null) {
    surface.setResizable(true);
  }

  try {
    robot = new Robot();
  }
  catch(AWTException e) {
    print("Could not start robot");
    println(e);
  }

  drawBackground();
}


void draw() {
  handleControls();
  oscilloscope();
}


void oscilloscope() {
  float graphHeight = height / selectedChannels.length;

  //threshold:
  stroke(255, 0, 0);
  float thresholdRightLine = map(thresholdLeft, 0, 1, 0, graphHeight);
  float thresholdLeftLine = map(thresholdRight, 0, 1, graphHeight, 2*graphHeight);
  //print(thresholdLeftLine);
  line(0, thresholdRightLine, width, thresholdRightLine);
  line(0, thresholdLeftLine, width, thresholdLeftLine);
  

  // Trace analogue input values
  strokeWeight(1);  // trace width
  stroke(255);      // trace colour
  for (int i = 0; i < selectedChannels.length; i++) {
    float yPos = map(analogInputs[selectedChannels[i] - 1], 0, 1, i * graphHeight + graphHeight, i * graphHeight);
    line(xPos, previousYPos[i], xPos+1, yPos);
    previousYPos[i] = yPos;
  }

  // Restart if graph full or window resized
  if (++xPos >= width || previousWidth != width || previousHeigth != height) {
    previousWidth = width;
    previousHeigth = height;
    xPos = 0;
    drawBackground();
  }
}


void drawBackground() {
  strokeWeight(1);                          // rectangle border width
  PFont f = createFont("Arial", 16, true);  // Arial, 16 point, anti-aliasing on
  for (int i = 0; i < selectedChannels.length; i++) {
    float graphHeight = height / selectedChannels.length;

    // Different rectangle border and fill colour for alternate graphs
    if (i % 2 == 0) {
      stroke(0);
      fill(0);
    } else {
      stroke(32);
      fill(32);
    }
    rect(0, i * graphHeight, width, graphHeight);

    // Print channel number
    fill(64);
    textFont(f, (int)graphHeight);
    text(nf(selectedChannels[i], 1), 10, (i + 1) * graphHeight);
  }
}


void oscEvent(OscMessage theOscMessage) {
  String addrPattern = theOscMessage.addrPattern();

  // Print address pattern to terminal
  println(addrPattern);

  // Analogue input values
  if (addrPattern.equals("/inputs/analogue")) {
    for (int i = 0; i < analogInputs.length; i ++) {
      //analogInputs[i] = theOscMessage.get(i).intValue();// DIGITAL!!!!
      analogInputs[i] = theOscMessage.get(i).floatValue();
    }
  }
}

void type(int i) {
  robot.delay(40);
  robot.keyPress(i);
  robot.keyRelease(i);
}


void handleControls() {
  if (millis() - timestamp > debounceTime) {
    if ( analogInputs[selectedChannels[0] - 1] < thresholdRight ) {
      type(KeyEvent.VK_RIGHT);
      timestamp = millis();
    }
    if ( analogInputs[selectedChannels[1] - 1] < thresholdLeft ) {
      type(KeyEvent.VK_LEFT);
      timestamp = millis();
    }
  }
}
