class SaveScreen
{
  //capture the drawing by pressing backspace (still captures entire screen instead of just drawing)
  void capture()
  {
    if ((keyPressed) && (key == 8))
    {
      saveFrame("pic.pdf");
    }
  }
}

