import java.awt.Robot;
import java.awt.event.KeyEvent;
import java.awt.AWTException;

Robot robot;

void setup() {
  try {
    robot = new Robot();
  }
  catch(AWTException e) {
    print("Could not start robot");
    println(e);
  }
}

void draw() {
  type(KeyEvent.VK_RIGHT);
  robot.delay(1000);

  type(KeyEvent.VK_LEFT);
  robot.delay(1000);
}

void type(int i)
{
  robot.delay(40);
  robot.keyPress(i);
  robot.keyRelease(i);
}
