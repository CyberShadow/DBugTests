// generated by Fast Light User Interface Designer (fluid) version 2.1000

import bcd.fltk2.Window;
import bcd.fltk2.Button;
import bcd.fltk2.Slider;
import bcd.fltk2.run;

int main () {
  Window w;
   {Window o = new Window(440, 105);
    w = o;
    o.begin();
    new Button(0, 0, 440, 36, "FLTK2 in D?!");
     {Slider o2 = new Slider(0, 36, 440, 50, "You'd better believe it!");
      o2.labelcolor(cast(Color)0xff000000);
    }
    o.end();
    o.resizable(o);
  }
  w.show();
  return  run();
}
