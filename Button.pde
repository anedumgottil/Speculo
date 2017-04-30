// Class taken from http://processingjs.org/learning/topic/buttons/ but was altered
boolean locked = false;
class Button
{
  String name;
  int x, y;
  PImage unclicked;
  PImage clicked;
  
  boolean isBigger;
  boolean isClicked;
  
  PImage icon;
  PImage iconBigger;
  int size;
  
  color textColor;
 
  color currentcolor;
  boolean over = false;
  boolean pressed = false;
  
  Button(){}
  
  Button(String n, PImage unclicked, PImage clicked , int xcoord, int ycoord){
    name = n;
    this.unclicked = unclicked;
    this.clicked = clicked;
    x = xcoord;
    y = ycoord;
  }

  boolean overRect(int x, int y, int width, int height) 
  {
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
      return true;
    } 
    else {
      return false;
    }
  }

  
  boolean overRectLarge(int x, int y, int width, int height) 
  {
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
      return true;
    } 
    else {
      return false;
    }
  }
  
  boolean overCircle(int centerx, int centery, float radius) 
  {
    float disX = centerx - mouseX;
    float disY = centery - mouseY;
    if(sqrt(sq(disX) + sq(disY)) < radius ) {
      return true;
    } 
    else {
      return false;
    }
  }
  
  void setName(String n){
    name = n; 
  }
}

class FeatureButton extends Button{
  int x_expanded_top_right = 162;
  int y_expanded_top_right = 325;
  boolean seen_by_user_in_tutorial = false;
  PFont expandedFont = createFont("Arial",40,true);

  
  FeatureButton(String n, PImage unclicked, PImage clicked ,int xcoord, int ycoord){
    super(n,unclicked,clicked,xcoord,ycoord);
  }
  
  void display() 
  {
    // show image
    imageMode(CORNER);
    if(isClicked)
      image(clicked,x, y +yShiftVal);
    else
      image(unclicked,x, y +yShiftVal);
    
    fill(250, 245, 247);
    textFont(f);
    textAlign(LEFT,TOP);
    text(name, x + 105, y + yShiftVal); 
  }
  
  void displayExpanded(){
    switch(name){
      case "Calendar":
      case "Calendario":
        // Create Rectangle
        stroke(250, 245, 247);
        strokeWeight(4);
        noFill();
        rect(x_expanded_top_right,y_expanded_top_right +yShiftVal,685,70);
        textFont(expandedFont);
        
        // Text
        textAlign(LEFT,TOP);
        if(settings.languageSelected == 1)
          text("3:00 PM | Cita con el dentista", x_expanded_top_right + 30, y_expanded_top_right+10 +yShiftVal);
        else
          text("3:00 PM | Dentist Appointment", x_expanded_top_right + 30, y_expanded_top_right+10 +yShiftVal);
        break;
      case "News":
      case "Noticias":
        if(newsOne.isClicked && !newsTwo.isClicked){
          if(lowerIcon.isClicked)
            image(newsInfo_clicked_lowered,x_expanded_top_right-5,y_expanded_top_right+yShiftVal);
          else
            image(newsInfo_clicked,x_expanded_top_right-5,y_expanded_top_right);
          
          textFont(expandedFont);
          textAlign(LEFT,TOP);
          if(settings.languageSelected == 1)
            text("Flying Squirrel roba los \ncalcetines", x_expanded_top_right + 20, y_expanded_top_right+3+yShiftVal);
          else  
            text("Flying Squirrel Steals Senior \nSocks", x_expanded_top_right + 20, y_expanded_top_right+3+yShiftVal);
          
          if(lowerIcon.isClicked)
            text("Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit, \nsed do eiusmod tempor incididunt ut \nlabore et dolore magna aliqua.", x_expanded_top_right + 20, y_expanded_top_right+3 + 35*4 +yShiftVal);
          else
            text("Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit, \nsed do eiusmod tempor incididunt ut \nlabore et dolore magna aliqua. \nUt enim ad minim veniam,\nquis nostrud exercitation ullamco", x_expanded_top_right + 20, y_expanded_top_right+3 + 35*5 +yShiftVal);
        }
        else if(newsTwo.isClicked && !newsOne.isClicked && !lowerIcon.isClicked){
          
          image(newsInfo,x_expanded_top_right-5,y_expanded_top_right);
          image(newsInfo_clicked_two,x_expanded_top_right-5,y_expanded_top_right + 35*5);
          textFont(expandedFont);
         
          // Text
          textAlign(LEFT,TOP);
          if(settings.languageSelected == 1){
            text("Flying Squirrel roba los \ncalcetines", x_expanded_top_right + 20, y_expanded_top_right+3);
            text("Flying Squirrel roba los \ncalcetines", x_expanded_top_right + 20, y_expanded_top_right+3 + 35*5);
          }
          else{
            text("Flying Squirrel Steals Senior \nSocks", x_expanded_top_right + 20, y_expanded_top_right+3);
            text("Flying Squirrel Steals Senior \nSocks", x_expanded_top_right + 20, y_expanded_top_right+3 + 35*5);
          }
            
          text("Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit, \nsed do eiusmod tempor incididunt ut \nlabore et dolore magna aliqua. \nUt enim ad minim veniam,\nquis nostrud exercitation ullamco", x_expanded_top_right + 20, y_expanded_top_right+20 + 35*8);
        }else if(lowerIcon.isClicked){
          image(newsInfo,x_expanded_top_right-5,y_expanded_top_right + yShiftVal);
          textFont(expandedFont);
          textAlign(LEFT,TOP);
          if(settings.languageSelected == 1)
            text("Flying Squirrel roba los \ncalcetines", x_expanded_top_right + 20, y_expanded_top_right+3+yShiftVal);
          else  
            text("Flying Squirrel Steals Senior \nSocks", x_expanded_top_right + 20, y_expanded_top_right+3+yShiftVal);

        }else{
          image(newsInfo,x_expanded_top_right-5,y_expanded_top_right);
          image(newsInfo,x_expanded_top_right-5,y_expanded_top_right + 35*5);
          textFont(expandedFont);
        
          // Text
          textAlign(LEFT,TOP);
          if(settings.languageSelected == 1){
            text("Flying Squirrel roba los \ncalcetines", x_expanded_top_right + 20, y_expanded_top_right+3);
            text("Flying Squirrel roba los \ncalcetines", x_expanded_top_right + 20, y_expanded_top_right+3 + 35*5);
          }
          else{
            text("Flying Squirrel Steals Senior \nSocks", x_expanded_top_right + 20, y_expanded_top_right+3);
            text("Flying Squirrel Steals Senior \nSocks", x_expanded_top_right + 20, y_expanded_top_right+3 + 35*5);
          }
        }
        break;
      case "Notifications":
      case "Notificaciones":
        // Create Rectangles
        stroke(250, 245, 247);
        strokeWeight(4);
        noFill();
        rect(x_expanded_top_right,y_expanded_top_right+yShiftVal,685,70*2);
        rect(x_expanded_top_right,y_expanded_top_right + 35*5+yShiftVal ,685,70*2);
        if(!lowerIcon.isClicked)
          rect(x_expanded_top_right,y_expanded_top_right + 35*(5*2) ,685,70*2);
        textFont(expandedFont);
        
        // Notification Icons
        image(facebook,x_expanded_top_right, y_expanded_top_right+20+ yShiftVal,  100, 100);
        image(twitter,x_expanded_top_right - 50, y_expanded_top_right + 35*5 + yShiftVal  - 30 , 200, 200);
        if(yShiftVal == 0)
          image(twitter,x_expanded_top_right - 50, y_expanded_top_right + 35*10 + yShiftVal  - 30 , 200, 200);
        
        if(settings.languageSelected == 1){
          text("Kirk le gustó su publicación", x_expanded_top_right + 100, y_expanded_top_right+30+yShiftVal);
          text("Anthony aceptó su solicitud", x_expanded_top_right + 100, y_expanded_top_right+30 + 35*5+yShiftVal);
          if(!lowerIcon.isClicked)
            text("Tienes un DM de @Wendys", x_expanded_top_right + 100, y_expanded_top_right+30 + 35*(5*2));
        }else{ 
          text("Kirk liked your post", x_expanded_top_right + 100, y_expanded_top_right+30+yShiftVal);
          text("Anthony accepted your request", x_expanded_top_right + 100, y_expanded_top_right+30 + 35*5+yShiftVal);
          if(!lowerIcon.isClicked)
            text("You got a DM from @Wendys", x_expanded_top_right + 100, y_expanded_top_right+30 + 35*(5*2));
        }
        break;
      case "Weight":
      case "Peso":
        textAlign(CENTER,TOP);
        if(settings.languageSelected == 1){
          text("Hoy :  58.96kg", x_expanded_top_right + 300, y_expanded_top_right+ 75*2);
          text("Promedio :  58.96kg", x_expanded_top_right + 300, y_expanded_top_right+ 75*3);
        }else{
          text("Today :  130lb", x_expanded_top_right + 300, y_expanded_top_right+ 75*2);
          text("Average :  130lb", x_expanded_top_right + 300, y_expanded_top_right+ 75*3);
        }
        
        image(lineGraph,x_expanded_top_right, y_expanded_top_right + 700);
        break;
      case "Sleep":
      case "Dormir":
        textAlign(CENTER,TOP);
        if(settings.languageSelected == 1){
          text("                Total  %Profundo", x_expanded_top_right + 300, y_expanded_top_right+ 75*2);
          text("                ____   ______", x_expanded_top_right + 300, y_expanded_top_right+ 75*2);
          text("   Hoy : 8.5hrs  80%", x_expanded_top_right + 300, y_expanded_top_right+ 75*3);
          text("Promedio : 8.5hrs  80%", x_expanded_top_right + 300, y_expanded_top_right+ 75*4);
        }else{
          text("                Total  %Deep", x_expanded_top_right + 300, y_expanded_top_right+ 75*2);
          text("                 ____   ______", x_expanded_top_right + 300, y_expanded_top_right+ 75*2);
          text("   Today : 8.5hrs  80%", x_expanded_top_right + 300, y_expanded_top_right+ 75*3);
          text("Average : 8.5hrs  80%", x_expanded_top_right + 300, y_expanded_top_right+ 75*4);
        }
        
        image(sleep_infograph,x_expanded_top_right, y_expanded_top_right + 650);
        break;
      case "Steps":
      case "Pasos":
        textAlign(CENTER,TOP);
        if(settings.languageSelected == 1){
          text("Hoy :  1000", x_expanded_top_right + 300, y_expanded_top_right+ 75*2);
          text("Promedio :  1000", x_expanded_top_right + 300, y_expanded_top_right+ 75*3);
        }else{
          text("Today :  1000", x_expanded_top_right + 300, y_expanded_top_right+ 75*2);
          text("Average :  1000", x_expanded_top_right + 300, y_expanded_top_right+ 75*3);
        }
        
        image(lineGraph,x_expanded_top_right, y_expanded_top_right + 700);
        break;
      case "Music":
      case "Música":
        textAlign(CENTER,TOP);
        if(lowerIcon.isClicked){
          numSongsShown = 4;
        }else{
          numSongsShown = 11;
        }
        for( int i = 0; i < numSongsShown ;i++){
          text("Title -  Artist", x_expanded_top_right+ 300, y_expanded_top_right+ 75*i +yShiftVal);
        }
        image(musicPlayer,x_expanded_top_right+50, y_expanded_top_right + 950);
        break;  
  
        

    }
  }
  
  boolean pressed() 
  {
    println("you pressed " + name);
    return overRect(x,y +yShiftVal,595, 70);
  }
  
  boolean pressedLarge()
  {
    println("you pressed " + name);
    return overRectLarge(x,y+yShiftVal,595, 300);
  }
  
  boolean pressedNum()
  {
    println("you pressed " + name);
    return overRectLarge(x,y,150, 300);
  }
  
  boolean pressedKeyboard() {
    return overRect(x, y, 90, 90);
  }
  
  boolean pressedKeyboard2() {
    return overRect(x, y, 180, 90);
  }
  
  boolean pressedLogin() {
    return overRect(x, y, 128, 128);
  }
  
}

class CircleButton extends Button{
  boolean seen_by_user_in_tutorial = false;
  
  CircleButton(String n, PImage unclicked, PImage clicked ,int xcoord, int ycoord){
    super(n,unclicked,clicked,xcoord,ycoord);
  }
  
  void display() 
  {
    // show image
    imageMode(CORNER);
    if(isClicked)
      image(clicked,x, y);
    else
      image(unclicked,x, y);
  }
  
  boolean pressed() 
  {
    println("you pressed " + name);
    return overRect(x,y,100, 100);
  }
}

class MenuButton extends Button{
  
   MenuButton(String n, PImage unclicked, PImage clicked ,int xcoord, int ycoord){
     super(n,unclicked,clicked,xcoord,ycoord);
   }
  
  void display() 
  {
    // show image
    imageMode(CORNER);
    if(isClicked)
      image(clicked,x, y);
    else
      image(unclicked,x, y);
  }
  
  boolean pressed() 
  {
    println("you pressed " + name);
    return overRect(x,y,250, 100);
  }
}

class NewsButton extends Button{
  
   NewsButton(String n,int xcoord, int ycoord){
     super(n,null,null,xcoord,ycoord);
   }
  
  boolean pressed() 
  {
    println("yods " + name);
    return overRect(x,y +yShiftVal,100, 100);
  }
}