Setup mySetup;
SaveScreen myScreen;

void setup()
{
  mySetup = new Setup();
  myScreen = new SaveScreen();
}

void draw()
{
  mySetup.menuSide();
  mySetup.drawCircles();
  mySetup.pickSize();
  //mySetup.drawTools(); 
  mySetup.paint();
  //mySetup.paintSplash();
  mySetup.clearScreen();
  myScreen.capture();
}

