import java.awt.AWTException;
import java.awt.Robot;
import java.awt.event.InputEvent;
import java.awt.event.KeyEvent;

/**
 * A Java Robot example class.
 * 
 * Caution: Using the Java Robot class improperly can cause
 * a lot of system problems. I had to reboot my Mac ~10
 * times yesterday while trying to debug this code.
 * 
 * I created this class to demonstrate the Java Robot
 * class on a Mac OS X system, though it should run on Linux
 * or Windows as well.
 * 
 * On a Mac system, I place the TextEdit text editor in the 
 * upper-left corner of the screen, and put a bunch of blank lines 
 * in the editor. Then I run this Java Robot example from 
 * Eclipse or the Unix command line.
 * 
 * It types the three strings shown in the code below into
 * the text editor.
 *
 * Many thanks to the people on the Mac Java-dev mailing list
 * for your help. 
 * 
 * @author Alvin Alexander, http://devdaily.com
 *
 */
public class JavaRobotExample
{
  Robot robot = new Robot();

  public static void main(String[] args) throws AWTException
  {
    new JavaRobotExample();
  }

  public JavaRobotExample() throws AWTException
  {
    robot.setAutoDelay(40);
    robot.setAutoWaitForIdle(true);

    robot.delay(4000);


    type(KeyEvent.VK_DOWN);
    robot.delay(1000);
    type(KeyEvent.VK_UP);
    robot.delay(1000);

    System.exit(0);
  }

  private void leftClick()
  {
    robot.mousePress(InputEvent.BUTTON1_MASK);
    robot.delay(200);
    robot.mouseRelease(InputEvent.BUTTON1_MASK);
    robot.delay(200);
  }

  private void type(int i)
  {
    robot.delay(40);
    robot.keyPress(i);
    robot.keyRelease(i);
  }

  private void type(String s)
  {
    byte[] bytes = s.getBytes();
    for (byte b : bytes)
    {
      int code = b;
      // keycode only handles [A-Z] (which is ASCII decimal [65-90])
      if (code > 96 && code < 123) code = code - 32;
      robot.delay(40);
      robot.keyPress(code);
      robot.keyRelease(code);
    }
  }
}
