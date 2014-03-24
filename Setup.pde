class Setup
{
  //color of the background
  color backg = color(255, 255, 255);

  //array of colors that can be selected
  color[] colors = new color[10];

  color red = color(255, 0, 0);
  color orange = color(255, 128, 0);
  color yellow = color(255, 255, 0);
  color green = color(0, 255, 0);
  color cyan = color(0, 255, 255);
  color blue = color(0, 0, 255);
  color indigo = color(80, 0, 255);
  color magenta = color(255, 0, 255);
  color black = color(0, 0, 0);
  color white = color(255);

  //attributes of the circles and the painting
  float circleSize;
  float xCoord;
  float yCoord;
  color currentColor;
  //float alpha; MAKE CIRCLES FADE IN *MAYBE*

  float drawSize = 50;

  Setup()
  {
    //sets the size and background of the program
    size(1200, 800);
    background(backg);

    //sets the colors to each position in the color array
    colors[0] = red;
    colors[1] = orange;
    colors[2] = yellow;
    colors[3] = green;
    colors[4] = cyan;
    colors[5] = blue;
    colors[6] = indigo;
    colors[7] = magenta;
    colors[8] = black;
    colors[9] = white;
  }

  //enter values to change background color to
  void changeBackG(float r, float g, float b)
  {
    background(r, g, b);
  }

  //draws the color selection circles on the screen
  void drawCircles()
  {
    if (circleSize < 40)
    {
      circleSize++;
    }
    xCoord = width/25;
    yCoord = height/25;
    noStroke();
    for (int i = 0; i < colors.length; i++)
    {
      textSize(25);
      fill(currentColor);
      text("COLOR", 5, 750);
      fill(colors[i]);
      if (i == 0)
      {
        ellipse(xCoord, yCoord, circleSize, circleSize);
        stroke(0);
        strokeWeight(0.25);
        line(96, 0, 96, height);
        noStroke();
      }
      else
      {
        ellipse(xCoord, yCoord+(yCoord*i)+15*i, circleSize, circleSize);
      }
    }
    for (int i = 0; i < colors.length; i++)
    {
      if (dist(xCoord, yCoord+(yCoord*i)+15*i, mouseX, mouseY) < circleSize/2 && mousePressed)
      {
        //changes the current color and displays it to the bottom left hand side
        currentColor = colors[i];
        stroke(0);
        fill(colors[i]);
        rect(0, 750, 96, height);
        strokeWeight(5);
        textSize(25);
        fill(colors[i]);
        text("COLOR", 5, 750);
      }
    }
  }

  //keeps the menu free from any paint that the user uses
  void menuSide()
  {
    rectMode(CORNER);
    fill(255);
    noStroke();
    rect(0, 0, 96, 750);
  }

  //the actual drawing tool
  void paint()
  {
    noStroke();
    if (mousePressed && (mouseX > 105))
    {
      fill(currentColor, 230);
      if (mouseButton == LEFT)
      {
        ellipseMode(CENTER);
        ellipse(mouseX, mouseY, drawSize, drawSize);
      }
      else if (mouseButton == RIGHT)
      {
        rectMode(CENTER);
        rect(mouseX, mouseY, drawSize, drawSize);
        rectMode(CORNER);
      }
    }
  }

  //erases all the paint from the screen
  void clearScreen()
  {
    if (keyPressed)
    {
      if (key == 32)
      {
        noStroke();
        fill(255);
        rectMode(CORNER);
        rect(97, 0, width, height);
      }
    }
  }

  /*
  void paintSplash()
   {
   float distance = 50;
   float roll = random(15,25);
   noStroke();
   if (keyPressed)
   {
   for (int i = 0; i < 50; i++)
   {
   fill(currentColor);
   ellipse(random(mouseX+50), random(mouseY+50), roll, roll);
   }
   }
   }
   */

  //gives user the ability to change the size of the paintbrush by using the numberpad
  void pickSize()
  {
    if (key == '1')
    {
      drawSize = 10;
    } 
    else if (key == '2')
    {
      drawSize = 25;
    }
    else if (key == '3')
    {
      drawSize = 50;
    }
    else if (key == '4')
    {
      drawSize = 75;
    }
    else if (key == '5')
    {
      drawSize = 100;
    }
  }
}

