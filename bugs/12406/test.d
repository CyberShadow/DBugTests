import std.functional;
import std.stdio;

class UserInterface {
   void title(string title) { _messages = title; } /* Changing this to
writeln(title) and removing display(), below, magically fixes it. */
   string display() {
      writeln(_messages);
      stdout.flush;
      return readln;
   }
   string _messages;
}

class Screen {
   void addMessageSource(string delegate()) { }
   void addOption(Screen delegate() action) {
      _options ~= Option(action);
   }
   Screen execute(UserInterface ui) {
      ui.title(title);
      auto action = _options[0].action;
      ui.display; /* Removing this line magically fixes it. */
      return action();
   }
   this(string title) { this.title = title; }
   struct Option { Screen delegate() action; }
   string title;
   Option[] _options;
}

string printStatus(int) { return "Printing status"; }

void configureScreen(Screen screen) {
   auto systemStatus = new Screen("System status");
   int x;
   systemStatus.addMessageSource(&curry!(printStatus, x));  /* Removing this
line magically fixes it.  */
   Screen renameName() { return new Screen("Rename system"); }
   Screen renameSelect() {
      auto ret = new Screen("Select system");
      void addItem() { ret.addOption(&renameName); }  /* Removing this line
magically fixes it. */
      ret.addOption(() => screen);  /* The segfault occurs here. */
      return ret;
   }
   screen.addOption(&renameSelect);
}
int main() {
   auto screen = new Screen("Systems screen");
   configureScreen(screen);
   while(screen) screen = screen.execute(new UserInterface);
   return 0;
}

