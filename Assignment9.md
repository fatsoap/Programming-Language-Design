# Programming Language Design Assignment #9

> 陳錕詮 107502570
>

### Compile Java code & run

```
$ javac assignment9.java
$ java assignment9
```


### **Simple Calculator**

Please use the keyboard button to trigger an event to complete this Java project.You must first create a GUI interface to trigger events and use Label to output the results.

The button to be triggered is as follows:

- `0 ~ 9`: number
- `+、-、*、/`: operator
- `Enter`: equal (=)
- `Esc`: clearThe function to be tested is as follows:
1. Trigger buttons: These trigger buttons must have their functions.
2. Basic operation: Follow the steps below to get the correct value.
    1. press the number key one or more times(ie. `1、10、123`)
    2. press one of the operator buttons(ie. `+、-、*、/`) one time or more times
    3. press the number key one or more times
    4. press Enter button or one of operator buttons to see if the value in the `Label` is correct.
3. Second operation: After completing the first calculation, press `Enter` or`operators`. Can the calculation be continued?Examples are as follows:
    1. completed `Basic` operations
    2. press the one of `operator` buttons one or more times
    3. press the `number key` one or more times
    4. press `Enter` button or one of `operator` buttons to see if the value in the `Label` is correct.
4. Divide by 0: Please use `try...catch` to handle this exception and output `Divide by 0` to your Label.

```java
import java.awt.*;
import java.awt.event.*;

public class Calculator extends KeyAdapter{
  Frame frame;
  Panel panel;
  Label text;

  private int now = 0;
  private int input = 0;
  private int op = 0; // [+, -, *, /, =]
  private boolean view = false; // T: input, False: Now
  private boolean div_0_error = false;

  public static void main(String[] args){
    new Calculator();
  }

  public Calculator() {
    frame = new Frame("107502570");
    frame.addWindowListener(new WindowAdapter() {
      public void windowClosing(WindowEvent event) {
        System.exit(0);
      }
    });
    frame.setSize(400, 200);
    frame.addKeyListener(this);
    panel = new Panel();
    text = new Label(Integer.toString(now));
    panel.add(text);
    frame.add(panel);
    frame.setVisible(true);
  }

  private void cal_result() {
    if (op == 0) {
      now += input;
    } else if (op == 1) {
      now -= input;
    } else if (op == 2) {
      now *= input;
    } else if (op == 3) {
      try {
        now /= input;
      } catch (ArithmeticException e) {
        div_0_error = true;
      }
    }
    view = false;
    input = 0;
  }

  private void check_view() {
    if (div_0_error) {
      text.setText("Divide By 0");
    } else {
      if (view) text.setText(Integer.toString(input));
      else text.setText(Integer.toString(now));
    }
    text.setSize(text.getPreferredSize() );
  }
    
  public void keyPressed(KeyEvent e) {
    if (e.getKeyChar() == '0') { 
      handle0();
    }
    if (e.getKeyChar() == '1') { 
      handle1();
    }
    if (e.getKeyChar() == '2') { 
      handle2();
    }
    if (e.getKeyChar() == '3') { 
      handle3();
    }
    if (e.getKeyChar() == '4') { 
      handle4();
    }
    if (e.getKeyChar() == '5') { 
      handle5();
    }
    if (e.getKeyChar() == '6') { 
      handle6();
    }
    if (e.getKeyChar() == '7') { 
      handle7();
    }
    if (e.getKeyChar() == '8') { 
      handle8();
    }
    if (e.getKeyChar() == '9') { 
      handle9();
    }
    if (e.getKeyChar() == '+' ) {
      handlePlus();
    }
    if (e.getKeyChar() == '-' ) {
      handleMinus();
    }
    if (e.getKeyChar() == '*' ) {
      handleMul();
    }
    if (e.getKeyChar() == '/' ) {
      handleDiv();
    }
    if (e.getKeyCode() == KeyEvent.VK_ENTER) { // do equal
      handleEnter();
    }
    if (e.getKeyCode() == KeyEvent.VK_ESCAPE) { // ESC
      handleESC();
    }
    check_view();
  }

  private void handle0() { 
    input = input * 10 + 0;
    view = true;
  }
  private void handle1() { 
    input = input * 10 + 1;
    view = true;
  }
  private void handle2() { 
    input = input * 10 + 2;
    view = true;
  }
  private void handle3() { 
    input = input * 10 + 3;
    view = true;
  }
  private void handle4() { 
    input = input * 10 + 4;
    view = true;
  }
  private void handle5() { 
    input = input * 10 + 5;
    view = true;
  }
  private void handle6() { 
    input = input * 10 + 6;
    view = true;
  }
  private void handle7() { 
    input = input * 10 + 7;
    view = true;
  }
  private void handle8() { 
    input = input * 10 + 8;
    view = true;
  }
  private void handle9() { 
    input = input * 10 + 9;
    view = true;
  }
  private void handlePlus( ) {
    if(view) {
      cal_result();
    }
    op = 0;
  }
  private void handleMinus() {
    if(view) {
      cal_result();
    }
    op = 1;
  }
  private void handleMul() {
    if(view) {
      cal_result();
    }
    op = 2;
  }
  private void handleDiv() {
    if(view) {
      cal_result();
    }
    op = 3;
  }
  private void handleEnter() {
    if(view) {
      cal_result();
    }
  }
  private void handleESC() {
    System.exit(0);
  }
}
```
