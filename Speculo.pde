// Controls what is shown on screen
String screen, lastScreen, username;
boolean n;
int mainScreenFeatureDisplay = 0;
int yShiftVal;
// For Set Up
PImage backImage;
PImage weatherIconMorning, weatherIconNight;
// Different Screens
PFont f;

Clock clock;

/*
.___  ___.      ___       __  .__   __.         _______.  ______ .______       _______  _______ .__   __.    
|   \/   |     /   \     |  | |  \ |  |        /       | /      ||   _  \     |   ____||   ____||  \ |  |    
|  \  /  |    /  ^  \    |  | |   \|  |       |   (----`|  ,----'|  |_)  |    |  |__   |  |__   |   \|  |    
|  |\/|  |   /  /_\  \   |  | |  . `  |        \   \    |  |     |      /     |   __|  |   __|  |  . `  |    
|  |  |  |  /  _____  \  |  | |  |\   |    .----)   |   |  `----.|  |\  \----.|  |____ |  |____ |  |\   |    
|__|  |__| /__/     \__\ |__| |__| \__|    |_______/     \______|| _| `._____||_______||_______||__| \__|    
                                                                                                           
*/
FeatureButton[] features = new FeatureButton[8];

CircleButton hamburgerIcon, lowerIcon, helpIcon;
MenuButton settingsButton,logoutButton;
String[] featureNames = { "Calendar" , "News", "Notifications", "Weight" , "Sleep", "Steps", "Music", "Light" };
String[] featureNamesSpanish = { "Calendario" , "Noticias", "Notificaciones", "Peso" , "Dormir", "Pasos", "Música", "Ligero" };
String[] featureIconUnclicked = { "calendar.png" , "news.png" , "notification.png" , "weight.png", "sleep.png", "steps.png", "music.png", "light.png"};
String[] featureIconClicked = { "calendar_clicked.png" , "news_clicked.png" , "notification_clicked.png" , "weight_clicked.png", 
                                "sleep_clicked.png", "steps_clicked.png", "music_clicked.png", "light_clicked.png"};
String[] expanded = { "calendar_clicked.png" , "news_clicked.png" , "notification_clicked.png" , "weight_clicked.png", 
"sleep_clicked.png", "steps_clicked.png", "music_clicked.png", "light_clicked.png"};

FeatureButton[] guestFeatures = new FeatureButton[3]; 
String[] guestFeatureNames = { "News",  "Music", "Light" };
String[] guestFeatureNamesSpanish = {"Noticias",  "Música", "Ligero" };
String[] guestFeatureIconUnclicked = { "news.png" , "music.png", "light.png"};
String[] guestFeatureIconClicked = {  "news_clicked.png" , "music_clicked.png", "light_clicked.png"};
String[] guestExpanded = { "news_clicked.png" , "music_clicked.png", "light_clicked.png"};

//Setting screen
SettingScreen settings = new SettingScreen();
FeatureButton[] settingFeature = new FeatureButton[3];
String[] settingFeatureNames = { "Account", "Date / Weather / Time", "Language" };
String[] settingFeatureNamesSpanish = { "Cuenta", "Fecha / Tiempo / Hora", "Idioma" };
String[] settingFeatureIconUnclicked = {"account.png" , "date.png", "language.png"};
String[] settingFeatureIconClicked = {"account_clicked.png" , "date_clicked.png", "language_clicked.png"};

//Numpad
Numpad numpad = new Numpad();
boolean spanish = false;

PImage lineGraph;
PImage sleep_infograph;
PImage backImageUnlit;
PImage backImageLit;
PImage musicPlayer;
PImage facebook;
PImage twitter;
PImage newsInfo;
PImage newsInfo_clicked;
PImage newsInfo_clicked_two;
PImage newsInfo_clicked_lowered;

NewsButton newsOne,newsTwo;
boolean settings_clicked = false;
int settingFeatureSelected = -1;
int guestFeatureSelected = -1;

//For setup screens
FeatureButton fingerprint;
FeatureButton setupAccount;
FeatureButton arrowRight;
FeatureButton arrowLeft;
FeatureButton arrowRightName;
FeatureButton nameAccount;
String nameString;
FeatureButton[] usernames = new FeatureButton[5];
FeatureButton[] passwords = new FeatureButton[5];
FeatureButton[] logins = new FeatureButton[5];
int accountSelected;
boolean usernameSelected = false; 
boolean passwordSelected = false;
String[] keyboard = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "0", 
              "q", "w", "e", "r", "t", "y", "u", "i", "o", "p", 
              "a", "s", "d", "f", "g", "h", "j", "k", "l",
              "z", "x", "c", "v", "b", "n", "m" };
FeatureButton[] keyboardButtons = new FeatureButton[36];
FeatureButton backspace;
FeatureButton shift;
String[] usernameStrings = new String[5];
String[] passwordStrings = new String[5];
FeatureButton accountImg;
/*
 * Set sup:
 *       All Image Icons
 */
void setup() {
  // set the canvas size
  size(2732, 1536);  
  
  clock = new Clock();
  
  backImage = loadImage("backImage.png","png");
  backImageLit = loadImage("backImage_Lit.png","png");;
  weatherIconMorning = loadImage("weatherIcon_Morning.png","png");
  weatherIconNight = loadImage("weather_night.png","png");
  screen = "Setup"; //Initially shows setup screen
  username = "Anthony";
  
  yShiftVal = 0; 
  nameString = "";
  f = createFont("Arial",60,true);
  
  //Main Screen
  for (int i = 0; i < featureNames.length; i++){
    PImage clicked = loadImage(featureIconClicked[i], "png");
    PImage unclicked = loadImage(featureIconUnclicked[i], "png");
    clicked.loadPixels();
    unclicked.loadPixels();
    features[i] = new FeatureButton(featureNames[i],unclicked,clicked,1905,325 + i*105);
  }
  
  //Guest Screen
  for (int i = 0; i < guestFeatureNames.length; i++){
    PImage clicked = loadImage(guestFeatureIconClicked[i], "png");
    PImage unclicked = loadImage(guestFeatureIconUnclicked[i], "png");
    clicked.loadPixels();
    unclicked.loadPixels();
    guestFeatures[i] = new FeatureButton(guestFeatureNames[i],unclicked,clicked,1905,325 + i*105);
  }
  
  newsInfo = loadImage("newsInfo.png","png");
  newsInfo.loadPixels();
  
  newsInfo_clicked = loadImage("newsInfo_clicked_one.png","png");
  newsInfo_clicked.loadPixels();
  
  newsInfo_clicked_two = loadImage("newsInfo_clicked_two.png","png");
  newsInfo_clicked_two.loadPixels();
  
  newsInfo_clicked_lowered = loadImage("newsInfo_clicked_lowered.png","png");
  newsInfo_clicked_lowered.loadPixels();
  
  newsOne = new NewsButton("newsOne",758,322);
  
  newsTwo = new NewsButton("newsTwo",758,502);
  
  lineGraph = loadImage("linegraph.png", "png");
  lineGraph.loadPixels();
  
  sleep_infograph = loadImage("sleep_infograph.png", "png");
  sleep_infograph.loadPixels();
  
  musicPlayer = loadImage("musicplayer.png", "png");
  musicPlayer.loadPixels();
  
  facebook = loadImage("facebook-icon.png", "png");
  facebook.loadPixels();
  
  twitter = loadImage("twitter.png", "png");
  twitter.loadPixels();
  
  PImage clicked = loadImage("expand_clicked.png", "png");
  PImage unclicked = loadImage("expand.png", "png");
  clicked.loadPixels();
  unclicked.loadPixels();
  
  hamburgerIcon = new CircleButton("hamburger menu button",unclicked,clicked,2170,1300);
  helpIcon = new CircleButton("",loadImage("question_clicked.png", "png"),loadImage("question.png", "png"),55,1460);
  
  PImage lower_unclicked = loadImage("lower_screen.png","png");
  PImage lower_clicked = loadImage("raise_screen.png","png");
  lower_clicked.loadPixels();
  lower_unclicked.loadPixels();
  
  lowerIcon = new CircleButton("lower screen button",lower_unclicked,lower_clicked,2180,1414);
  
  PImage s_unclicked = loadImage("settings.png", "png");
  PImage s_clicked = loadImage("settings_clicked.png", "png");
  s_clicked.loadPixels();
  s_unclicked.loadPixels();
  
  settingsButton = new MenuButton("Settings Button",s_unclicked, s_clicked,1900,1414);
  
  accountImg = new FeatureButton("", loadImage("account.png", "png"), loadImage("account.png", "png"), 150, 850);
  
  PImage l_unclicked = loadImage("log_out.png", "png");
  PImage l_clicked = loadImage("log_out_clicked.png", "png");
  l_clicked.loadPixels();
  l_unclicked.loadPixels();
  
  logoutButton = new MenuButton("Settings Button",l_unclicked, l_clicked,2300,1414);
  
  //Settings Screen
  loadImages(settingFeatureNames, settingFeatureIconClicked, settingFeatureIconUnclicked, settingFeature, 1905, 325, 105);
  loadImages(settings.languageName, settings.languageClicked, settings.languageUnclicked, settings.languageFeature, 244, 384, 60);
  loadImages(settings.switchName, settings.switchClicked, settings.switchUnclicked, settings.switchFeature, 410, 748, 60); 
  loadImages(settings.userName, settings.userClicked, settings.userUnclicked, settings.userFeature, 150, 350, 400);
  loadImages(settings.clearName, settings.clearClicked, settings.clearUnclicked, settings.clearFeature, 700, 530, 60);
  loadImages(settings.clearName2, settings.clearClicked2, settings.clearUnclicked2, settings.clearFeature2, 700, 840, 60);
  loadImages(settings.dtwName, settings.dtwClicked, settings.dtwUnclicked, settings.dtwFeature, 180, 350, 600);
  
  //Num pad
  int x_mod = 1000;
  int mult_mod = 145;
  int y_mod = 1100;
  
  for (int i = 0; i < numpad.numName.length; i++){
    PImage clicked5 = loadImage(numpad.numClicked[i], "png");
    PImage unclicked5 = loadImage(numpad.numUnclicked[i], "png");
    clicked.loadPixels();
    unclicked.loadPixels();
    if(i == 0){
      numpad.numFeature[i] = new FeatureButton(numpad.numName[i],unclicked5,clicked5,x_mod + 290,y_mod + 150);
    }
    else
    {
      numpad.numFeature[i] = new FeatureButton(numpad.numName[i],unclicked5,clicked5,x_mod + i * mult_mod,y_mod);
    }
    if(i % 3 == 0 && i != 0){
      y_mod -= 150;
      x_mod -= 435;
    }
  }
  
  //Setup Screen
  fingerprint = new FeatureButton("", loadImage("fingerprint.png", "png"), loadImage("fingerprint.png", "png"), 1400, 636);
  setupAccount = new FeatureButton("", loadImage("account.png", "png"), loadImage("account_clicked.png", "png"), 1446, 636);
  nameAccount = new FeatureButton("", loadImage("input_field.png", "png"), loadImage("input_field.png", "png"), 1130, 395);

  arrowRight = new FeatureButton ("", loadImage("arrow_right.png", "png"), loadImage("arrow_right.png", "png"), 2550, 900);
  arrowLeft = new FeatureButton ("", loadImage("arrow_left.png", "png"), loadImage("arrow_left.png", "png"), 60, 900);
  
  //Setup username, password, and login buttons
  for(int i = 0; i < 5; i++) {
       //FeatureButtons to change color once clicked
       usernames[i] = new FeatureButton("", loadImage("input_field.png", "png"), loadImage("input_field_clicked.png", "png"), 800, i * 115 + 110);
       passwords[i] = new FeatureButton("", loadImage("input_field.png", "png"), loadImage("input_field_clicked.png", "png"), 1835, i * 115 + 110);
       logins[i] = new FeatureButton("", loadImage("login.png", "png"), loadImage("login_valid.png", "png"), 2520, i * 115 + 75);
  }
  
  //Setup keyboard buttons
  for(int i = 0; i < 36; i++) {
    if(i < 10) {
      keyboardButtons[i] = new FeatureButton("", loadImage("nothing.png", "png"), loadImage("nothing.png", "png"), i * 95 + 1105, 715);
    }
    
    else if (i < 20) {
      keyboardButtons[i] = new FeatureButton("", loadImage("nothing.png", "png"), loadImage("nothing.png", "png"), i * 95 + 210, 810);
    }
    
    else if (i < 29) {
      keyboardButtons[i] = new FeatureButton("", loadImage("nothing.png", "png"), loadImage("nothing.png", "png"), i * 95 - 685, 905);
    }
    
    else {
      keyboardButtons[i] = new FeatureButton("", loadImage("nothing.png", "png"), loadImage("nothing.png", "png"), i * 95 - 1480, 1000);
    }
    
    keyboardButtons[i].display();
  }
  
  backspace = new FeatureButton("", loadImage("horizontal_key.png", "png"), loadImage("horizontal_key.png", "png"), 2055, 715);
  shift = new FeatureButton("", loadImage("horizontal_key.png", "png"), loadImage("horizontal_key.png", "png"), 1940, 1000);
 
  backspace.display();
  shift.display();
 
  for(int i = 0; i < 5; i++) {
      usernameStrings[i] = "";
      passwordStrings[i] = "";
  }
  
  accountSelected = -1;

}
// code to load images in for all settings
void loadImages(String[] objectName,String[] objectsClicked, String[] objectsUnclicked, FeatureButton[] feature, int x, int y, int mult)
{
  for (int i = 0; i < objectName.length; i++){
    PImage clicked = loadImage(objectsClicked[i], "png");
    PImage unclicked = loadImage(objectsUnclicked[i], "png");
    clicked.loadPixels();
    unclicked.loadPixels();
    feature[i] = new FeatureButton(objectName[i],unclicked,clicked,x,y + i*mult);
  }
}

void display_core(){
  textFont(f);
  textAlign(LEFT,TOP);
  
  text(clock.getTime(numpad.get_hour(), numpad.get_minute()),190,120+yShiftVal);
  
  if(clock.isAM)
   image(weatherIconMorning,470,30+yShiftVal);
  else
   image(weatherIconNight,470,30+yShiftVal);
  
  stroke(250,245,247);
  strokeWeight(8);
  noFill();
  rect(152, 225+yShiftVal, 700, 75);  // Left Rectangle
  rect(1880, 225+yShiftVal, 700, 75);  // Right Rectangle 
  
  //Get date
  String tuesday = "Tues";
  if(settings.languageSelected == 1)
  {
    tuesday = "Martes";
  }
  
  String month = numpad.translate_month(spanish);
  String day = numpad.translate_day();
  String year = numpad.translate_year();
  if(month == "")
  {
    if(settings.languageSelected == 1)
    {
      month = "Enero";
    }
    else
    {
      month = "January";
    }
  }
  if(day == "")
  {
    day = "26";
  }
  if(year.equals("")){
   year = "2017"; 
  }
  text(tuesday + " ," + month + " " + day + " ," + year,162,225+yShiftVal); // Left Text
  
  if(screen.equals("Guest")){
    username = "Guest"; 
  }else{
    username = "Anthony";
  }
  
  if(settings.languageSelected == 1){
    if(clock.isAM)
     text("Buenos días, "+username,1885 ,225+yShiftVal); // Right Text
    else
     text("Buena noches, "+username,1885 ,225+yShiftVal); // Right Text
  }else{
    if(clock.isAM)
     text("Good Morning, "+username,1885 ,225+yShiftVal); // Right Text
    else
     text("Good Evening, "+username,1885 ,225+yShiftVal); // Right Text
  }
  
   
  line(152, 1240, 852, 1240);    //Left bottom line
  line(1880, 1240, 2580, 1240);  //Right bottom line 

}
void draw(){
  if( features[7].isClicked || guestFeatures[2].isClicked )
    image(backImageLit,0,0,2732, 1536);
  else
    image(backImage,0,0,2732, 1536);
 
  
  switch( screen ){
    case "Setup" :
      setup_show();
      break;
    case "Read_Fingerprint":
      read_fingerprint_show();
      break;
    case "Name":
      name_show();
      break;
    case "Account_input":
      account_input_show();
      break;
    case "Login":
     login_show();
     break;
  case "Fingerprint_login":
      fingerprint_login_show();
      break;
    case "Starting":
      starting_show();
      break;
    case "Main":
      main_show();
      break;
    case "Guest":
      guest_show();
      break;
    case "Collapsed":
      collapsed_show();
      break;
    case "Lowered":
      lowered_show();
      break;
    case "Settings":
      settings.settings_show();
      
      //setting icon choices
      switch(settings.settingFeatureSelected){
        case(0):
          settings.account_show();                                 //Display the Account panel        
          break;
        case(1):
          settings.userFeature[0].isClicked = false;
         // Check then if date or time option is chosen for numpad 
          settings.date_show();
          settings.weather_show();
          numpad.numpad_show();
          break;
        case(2):
          settings.userFeature[0].isClicked = false;
          settings.language_show();                                //Display the language panel
          break;
      }
      
      break;
  }
  //Debug code to find X and Y cord
  //textSize(25);
  //text( "x: " + mouseX + " y: " + mouseY + " screen: "+screen + " Lscreen: "+lastScreen, mouseX, mouseY );
}

void mouseReleased(){

    switch( screen ){
      case "Setup" :
        setup_released();
        break;
      case "Read_Fingerprint":
        read_fingerprint_released();
        break;
      case "Name":
        name_released();
        break;
      case "Account_input":
        account_input_released();
        break;
      case "Login":
      login_released();
      break;
    case "Fingerprint_login":
      fingerprint_login_released();
      break;
      case "Starting":
        break;
      case "Main":
        main_released();
        break;
      case "Guest":
        guest_released();
        break;
      case "Collapsed":
        collapsed_released();
        break;
      case "Lowered":
        lowered_released();   
        break;
      case "Settings":
        settings.settings_released();   
        
        // setting icon choices
        switch(settings.settingFeatureSelected)
        {
          case(0):
            settings.account_released();
            if(settings.userFeature[1].isClicked == true)
            {
              screen = "Setup";
            }
            break;
          case(1):
            numpad.numpad_released(settings.dateSelected);
            settings.weather_released();  
            settings.date_released();
          case(2):
            settings.language_released();
            break;
        }     
        break;     
  }
}

/**
.___  ___.      ___       __  .__   __.         _______.  ______ .______       _______  _______ .__   __.    
|   \/   |     /   \     |  | |  \ |  |        /       | /      ||   _  \     |   ____||   ____||  \ |  |    
|  \  /  |    /  ^  \    |  | |   \|  |       |   (----`|  ,----'|  |_)  |    |  |__   |  |__   |   \|  |    
|  |\/|  |   /  /_\  \   |  | |  . `  |        \   \    |  |     |      /     |   __|  |   __|  |  . `  |    
|  |  |  |  /  _____  \  |  | |  |\   |    .----)   |   |  `----.|  |\  \----.|  |____ |  |____ |  |\   |    
|__|  |__| /__/     \__\ |__| |__| \__|    |_______/     \______|| _| `._____||_______||_______||__| \__|    
                                                                                                             
**/
int featureSelected = -1;
boolean isGuest = false;
boolean isSlidDown = false;
boolean isLightOn = false;
boolean tutorialMode = true; // Change, will only be true when adding a new user
int numSongsShown = 11;
int tutorialProgress = 0;
Button exitButton = new Button();

void main_show(){
   
   display_core();
   
   // Tutorial / Help
   if( tutorialMode )
     tutorial_show();
   
   if(settings.languageSelected == 1){
     for (int i = 0; i < features.length; i++){
       features[i].setName(featureNamesSpanish[i]);
       spanish = true;
     }
   }else{
    for (int i = 0; i < features.length; i++){
       features[i].setName(featureNames[i]);
     } 
   }
   
   for (int i = 0; i < features.length; i++){
     features[i].display();
     if(featureSelected != -1 && features[i].isClicked == true){
       features[i].displayExpanded();
     }
   }
   
   hamburgerIcon.display();
   lowerIcon.display();
   settingsButton.display();
   logoutButton.display();
   helpIcon.display();
}

void tutorial_show(){
  stroke(250,245,247);
  strokeWeight(2);
  textAlign(CENTER, CENTER);
  
  textSize(100);
  text("Hey, Beautiful.\n",1366,393 +yShiftVal); 
  textSize(40);
  text("Check out the features to your RIGHT ->",1366,393 + 50); 
  text("<- and they'll show up on your LEFT",1366,393 + 50*2 ); 

  // Display Exit Button
  fill(119,136,153);
  noStroke();
  rect(93,1470,440, 50);
  fill(250,245,247);
  noStroke();
  text("Exit Tutorial",300,1491 );
  
  // Progess Bar
  text((float) tutorialProgress/ (float)( features.length + 2 )* 100 + "% Completed",1366,1220 + 50*2);
  for (int i = 0; i < features.length +2; i++){
    stroke(250,245,247);
    strokeWeight(2);
  
    // Progress Bar
    if( i < tutorialProgress)
      fill(250,245,247);
    else
      fill(0,0);
      
    if( i == 0 )
      rect(1091+ (55*i), 1220  , 55, 55, 18, 1, 1, 18);
    else if ( i == (features.length-1 + 2))
      rect(1091+ (55*i), 1220 , 55, 55, 1, 18, 18, 1);
    else
      rect(1091+ (55*i), 1220  , 55, 55);
      
    // Make the feature blink if the user hasnt clicked on it yet
    if( i <features.length ){
      if( !features[i].seen_by_user_in_tutorial){
        if( second()%2 == 0){
          fill(119,136,153);
          noStroke();
          rect(features[i].x, features[i].y  ,595, 85);
        }
      }
    }
  }
  
  // Show off collapse & move down feature
  if( !hamburgerIcon.seen_by_user_in_tutorial ){
    // Label and Arrow
    noStroke();
    fill(119,136,153);
    triangle(2280,1347 + yShiftVal,2340,1281 + yShiftVal,2340,1413 + yShiftVal);
    rect(hamburgerIcon.x + 150, hamburgerIcon.y + 25 + yShiftVal ,250, 50);
    fill(250,245,247);
    text("Collapse ",hamburgerIcon.x + 300,hamburgerIcon.y + 50 + yShiftVal);
    
    
    if( second()%2 == 0){
        fill(119,136,153);
        ellipseMode(CENTER);
        ellipse(hamburgerIcon.x + 50, hamburgerIcon.y + 50 + yShiftVal,120, 120);
    }
  }
  
  if( !lowerIcon.seen_by_user_in_tutorial ){
    // Label and Arrow
    noStroke();
    fill(119,136,153);
    rect(hamburgerIcon.x - 300, hamburgerIcon.y + 60 + yShiftVal ,250, 50);
    triangle(2073,1428 + yShiftVal, 2157,1419  + yShiftVal, 2127,1344 + yShiftVal);
    fill(250,245,247);
    text("Slide Down",hamburgerIcon.x - 170,hamburgerIcon.y + 80 + yShiftVal);
    
    if( second()%2 == 0){
        fill(119,136,153);
        noStroke();
        ellipseMode(CENTER);
        ellipse(lowerIcon.x + 35, lowerIcon.y+ 35 + yShiftVal,75, 75);
      }
  }
  
  helpIcon.display();
}

void tutorial_released(){
  stroke(250,245,247);
  textAlign(CENTER, CENTER);
  
  textSize(100);
  text("Hey, Beautiful.\n",1366,393 +yShiftVal); 
  textSize(40);
  text("Check out the features to your RIGHT ->",1366,393 + 50+ yShiftVal); 
  text("<- and they'll show up on your LEFT",1366,393 + 50*2 + yShiftVal); 
  
  if( exitButton.overRect(156, 1431 ,440, 100 )){
    tutorialMode = false;
  }
  
  if( lowerIcon.overCircle(lowerIcon.x + 35,lowerIcon.y+ 35, 75/2 ) && lowerIcon.seen_by_user_in_tutorial == false ){
    lowerIcon.seen_by_user_in_tutorial = true;
    tutorialProgress++;
  }
    
  if( hamburgerIcon.overCircle(hamburgerIcon.x  + 50,hamburgerIcon.y  + 50, 120/2 ) && hamburgerIcon.seen_by_user_in_tutorial == false){
    hamburgerIcon.seen_by_user_in_tutorial = true;
    tutorialProgress++;
  }
  
  if( helpIcon.overCircle(helpIcon.x,helpIcon.y,100)){
     tutorialMode = false;
  }
  stroke(250,245,247);
}

void main_released(){
   if( tutorialMode )
     tutorial_released();
     
   int previouslySelected = featureSelected;
   for (int i = 0; i < features.length -1; i++){
     if(features[i].pressed()){
         // Sets the previous selected feature to false
         if( previouslySelected != -1){
             features[previouslySelected].isClicked = false;
         }
  
         features[i].isClicked = true;
         if( tutorialMode && !features[i].seen_by_user_in_tutorial){
           features[i].seen_by_user_in_tutorial = true;
           tutorialProgress++;
         }
         featureSelected = i;
         break;
     }
   }
   
   if(newsOne.pressed()){
     if(newsOne.isClicked == false){
       newsOne.isClicked = true; 
       newsTwo.isClicked = false; 
     }else{
       newsOne.isClicked = false; 
       newsTwo.isClicked = false; 
     }
   }
   
   if(newsTwo.pressed()){
     if(newsTwo.isClicked == false){
       newsTwo.isClicked = true; 
       newsOne.isClicked = false; 
     }else{
       newsTwo.isClicked = false; 
       newsOne.isClicked = false; 
     }
   }
   
   /* If news expanded stuff is shown, check if the last story is clicked
    */
   
   // Since the lights feature is special :)
   if(features[7].pressed()){
     if( tutorialMode && !features[7].seen_by_user_in_tutorial){
           features[7].seen_by_user_in_tutorial = true;
           tutorialProgress++;
     }
           
     if(features[7].isClicked == false){
       features[7].isClicked = true; 
     }else{
       features[7].isClicked = false; 
     }
   }
   
   if(hamburgerIcon.pressed()){
     if(hamburgerIcon.isClicked == false){
       hamburgerIcon.isClicked = true; 
       lastScreen = screen;
       screen = "Collapsed";
     }
   }
   
   if(settingsButton.pressed()){
     if(settingsButton.isClicked == false){
       settingsButton.isClicked = true; 
       screen = "Settings";
     }
   }
   
   if(lowerIcon.pressed()){
     if(lowerIcon.isClicked == false){
       lowerIcon.isClicked = true; 
       lastScreen = screen;
       screen = "Lowered";
     }
   }
   
   if(logoutButton.pressed()){
     if(logoutButton.isClicked == false){
       screen = "Guest";
     }
   }
   
   if( helpIcon.overCircle(helpIcon.x,helpIcon.y,100)){
     tutorialMode = true;
     
     // The User went through the whole tutorial before, reset everything
     if( tutorialProgress == (features.length+ 2)){
        tutorialProgress = 0;
        for( int i = 0;i < features.length;i ++)
          features[i].seen_by_user_in_tutorial = false;
        
        hamburgerIcon.seen_by_user_in_tutorial = false;
     }
  }
}

/*
  ______   ______    __       __          ___      .______     _______. _______  _______          _______.  ______ .______       _______  _______ .__   __. 
 /      | /  __  \  |  |     |  |        /   \     |   _  \   /       ||   ____||       \        /       | /      ||   _  \     |   ____||   ____||  \ |  | 
|  ,----'|  |  |  | |  |     |  |       /  ^  \    |  |_)  | |   (----`|  |__   |  .--.  |      |   (----`|  ,----'|  |_)  |    |  |__   |  |__   |   \|  | 
|  |     |  |  |  | |  |     |  |      /  /_\  \   |   ___/   \   \    |   __|  |  |  |  |       \   \    |  |     |      /     |   __|  |   __|  |  . `  | 
|  `----.|  `--'  | |  `----.|  `----./  _____  \  |  |   .----)   |   |  |____ |  '--'  |   .----)   |   |  `----.|  |\  \----.|  |____ |  |____ |  |\   | 
 \______| \______/  |_______||_______/__/     \__\ | _|   |_______/    |_______||_______/    |_______/     \______|| _| `._____||_______||_______||__| \__| 
                                                                                                                                                            
*/

void collapsed_show(){
   textFont(f);
   textAlign(LEFT,TOP);
   text(clock.getTime(numpad.get_hour(), numpad.get_minute()),190,120);
   
   if(clock.isAM)
     image(weatherIconMorning,470,30);
   else
     image(weatherIconNight,470,30);
     
   hamburgerIcon.display();


}

void collapsed_released(){
  
   if(hamburgerIcon.pressed()){
     hamburgerIcon.isClicked = false; 
     screen = lastScreen;
   }

}

/*
 __        ______   ____    __    ____  _______ .______       _______  _______          _______.  ______ .______       _______  _______ .__   __. 
|  |      /  __  \  \   \  /  \  /   / |   ____||   _  \     |   ____||       \        /       | /      ||   _  \     |   ____||   ____||  \ |  | 
|  |     |  |  |  |  \   \/    \/   /  |  |__   |  |_)  |    |  |__   |  .--.  |      |   (----`|  ,----'|  |_)  |    |  |__   |  |__   |   \|  | 
|  |     |  |  |  |   \            /   |   __|  |      /     |   __|  |  |  |  |       \   \    |  |     |      /     |   __|  |   __|  |  . `  | 
|  `----.|  `--'  |    \    /\    /    |  |____ |  |\  \----.|  |____ |  '--'  |   .----)   |   |  `----.|  |\  \----.|  |____ |  |____ |  |\   | 
|_______| \______/      \__/  \__/     |_______|| _| `._____||_______||_______/    |_______/     \______|| _| `._____||_______||_______||__| \__| 
                                                                                                                                                  
*/
void lowered_show(){
  yShiftVal = 525;

  
  switch(lastScreen){
    case "Main":
      display_core();

      for (int i = 0; i < 3; i++){
       features[i].display();
       if(featureSelected != -1 && features[i].isClicked == true){
         features[i].displayExpanded();
       }
      }

      hamburgerIcon.display();
      lowerIcon.display();
      settingsButton.display();
      logoutButton.display();
      break;

    case "Settings":
      display_core();
      
      for (int i = 0; i < 3; i++){
         settingFeature[i].display();
         if(settingFeatureSelected != -1 && settingFeature[i].isClicked == true){
           settingFeature[i].displayExpanded();
         }
       }
      
      hamburgerIcon.display();
      lowerIcon.display();
      settingsButton.display();
      logoutButton.display();
      break;
    case "Guest":
      
      display_core();

      for (int i = 0; i < 3; i++){
       guestFeatures[i].display();
       if(guestFeatureSelected != -1 && guestFeatures[i].isClicked == true){
         guestFeatures[i].displayExpanded();
       }
      }

      hamburgerIcon.display();
      lowerIcon.display();
      logoutButton.display();
      break;
    case "Lowered":
      display_core();

      for (int i = 0; i < 3; i++){
       features[i].display();
       if(featureSelected != -1 && features[i].isClicked == true){
         features[i].displayExpanded();
       }
      }

      hamburgerIcon.display();
      lowerIcon.display();
      settingsButton.display();
      logoutButton.display();
      break;
  } 

}

void lowered_released(){
  
   if(lastScreen.equals("Main")){
     int previouslySelected = featureSelected;
     for (int i = 0; i < 3; i++){
       if(features[i].pressed()){
           // Sets the previous selected feature to false
           if( previouslySelected != -1){
               features[previouslySelected].isClicked = false;
           }
    
           features[i].isClicked = true;
           featureSelected = i;
           break;
       }
     }
   }
   
   if(lastScreen.equals("Settings")){
     int previouslySelected = settingFeatureSelected;
     for (int i = 0; i < settingFeature.length; i++){
       if(settingFeature[i].pressed()){
         
           // Sets the previous selected feature to false
           if( previouslySelected != -1){
               settingFeature[previouslySelected].isClicked = false;
           }
    
           settingFeature[i].isClicked = true;
           settingFeatureSelected = i;
           break;
       }
     }  
   }
   
   if(lastScreen.equals("Guest")){
    int previouslySelected = guestFeatureSelected;
     for (int i = 0; i < guestFeatures.length -1; i++){
       if(guestFeatures[i].pressed()){
           // Sets the previous selected feature to false
           if( previouslySelected != -1){
               guestFeatures[previouslySelected].isClicked = false;
           }
    
           guestFeatures[i].isClicked = true;
           guestFeatureSelected = i;
           break;
       }
     } 
   }
   
   if(newsOne.pressed()){
     if(newsOne.isClicked == false){
       newsOne.isClicked = true; 
       newsTwo.isClicked = false; 
     }else{
       newsOne.isClicked = false; 
       newsTwo.isClicked = false; 
     }
   }
   
   if(lastScreen.equals("Guest")){
     if(guestFeatures[2].pressed()){
       if(guestFeatures[2].isClicked == false){
         guestFeatures[2].isClicked = true; 
       }else{
         guestFeatures[2].isClicked = false; 
       }
     }     
   }else{
     if(features[7].pressed()){
       if(features[7].isClicked == false){
         features[7].isClicked = true; 
       }else{
         features[7].isClicked = false; 
       }
     }
   }
   // Since the lights feature is special :)
   
   
   if(hamburgerIcon.pressed()){
     if(hamburgerIcon.isClicked == false){
       hamburgerIcon.isClicked = true; 
       lastScreen = screen;
       yShiftVal = 0; 
       screen = "Collapsed";
     }
   }
   
   if(settingsButton.pressed()){
     if(settingsButton.isClicked == false){
       settingsButton.isClicked = true; 
       yShiftVal = 0; 
       lastScreen = "Settings";
       screen = "Lowered";
     }else{
       settingsButton.isClicked = false; 
       lastScreen = "Main";
       screen = "Lowered";
     }
     
   }
   
   if(lowerIcon.pressed()){
     if(lowerIcon.isClicked == true){
       lowerIcon.isClicked = false; 
       
       yShiftVal = 0; 
       if(lastScreen.equals(screen)){
         settingsButton.isClicked = false;  
         screen = "Main";
       }
       else  
         screen = lastScreen;

     }
   }
   
   if(logoutButton.pressed()){
     if(logoutButton.isClicked == false){
       yShiftVal = 0; 
       screen = "Starting";
     }
   }
}

/*
  _______  __    __   _______     _______.___________.        _______.  ______ .______       _______  _______ .__   __. 
 /  _____||  |  |  | |   ____|   /       |           |       /       | /      ||   _  \     |   ____||   ____||  \ |  | 
|  |  __  |  |  |  | |  |__     |   (----`---|  |----`      |   (----`|  ,----'|  |_)  |    |  |__   |  |__   |   \|  | 
|  | |_ | |  |  |  | |   __|     \   \       |  |            \   \    |  |     |      /     |   __|  |   __|  |  . `  | 
|  |__| | |  `--'  | |  |____.----)   |      |  |        .----)   |   |  `----.|  |\  \----.|  |____ |  |____ |  |\   | 
 \______|  \______/  |_______|_______/       |__|        |_______/     \______|| _| `._____||_______||_______||__| \__| 
                                                                                                                        
*/

void guest_show(){
  
  display_core(); 
   
  for (int i = 0; i < guestFeatures.length; i++){
     guestFeatures[i].display();
     if(guestFeatureSelected != -1 && guestFeatures[i].isClicked == true){
       guestFeatures[i].displayExpanded();
     }
  }
   
  hamburgerIcon.display();
  lowerIcon.display();
 
  logoutButton.display();
  
}

void guest_released(){
  
  int previouslySelected = guestFeatureSelected;
   for (int i = 0; i < guestFeatures.length -1; i++){
     if(guestFeatures[i].pressed()){
         // Sets the previous selected feature to false
         if( previouslySelected != -1){
             guestFeatures[previouslySelected].isClicked = false;
         }
  
         guestFeatures[i].isClicked = true;
         guestFeatureSelected = i;
         break;
     }
   }
   
   if(newsOne.pressed()){
     if(newsOne.isClicked == false){
       newsOne.isClicked = true; 
       newsTwo.isClicked = false; 
     }else{
       newsOne.isClicked = false; 
       newsTwo.isClicked = false; 
     }
   }
   
   if(newsTwo.pressed()){
     if(newsTwo.isClicked == false){
       newsTwo.isClicked = true; 
       newsOne.isClicked = false; 
     }else{
       newsTwo.isClicked = false; 
       newsOne.isClicked = false; 
     }
   }
   
   // Since the lights feature is special :)
   if(guestFeatures[2].pressed()){
     if(guestFeatures[2].isClicked == false){
       guestFeatures[2].isClicked = true; 
     }else{
       guestFeatures[2].isClicked = false; 
     }
   }
   
   if(hamburgerIcon.pressed()){
     if(hamburgerIcon.isClicked == false){
       hamburgerIcon.isClicked = true; 
       lastScreen = screen;
       screen = "Collapsed";
     }
   }
   
   if(lowerIcon.pressed()){
     if(lowerIcon.isClicked == false){
       lowerIcon.isClicked = true; 
       lastScreen = screen;
       screen = "Lowered";
     }
   }
   
   if(logoutButton.pressed()){
     if(logoutButton.isClicked == false){
       screen = "Main";
     }
   }
}

/*
     _______.___________.    ___      .______     .___________. __  .__   __.   _______         _______.  ______ .______       _______  _______ .__   __. 
    /       |           |   /   \     |   _  \    |           ||  | |  \ |  |  /  _____|       /       | /      ||   _  \     |   ____||   ____||  \ |  | 
   |   (----`---|  |----`  /  ^  \    |  |_)  |   `---|  |----`|  | |   \|  | |  |  __        |   (----`|  ,----'|  |_)  |    |  |__   |  |__   |   \|  | 
    \   \       |  |      /  /_\  \   |      /        |  |     |  | |  . `  | |  | |_ |        \   \    |  |     |      /     |   __|  |   __|  |  . `  | 
.----)   |      |  |     /  _____  \  |  |\  \----.   |  |     |  | |  |\   | |  |__| |    .----)   |   |  `----.|  |\  \----.|  |____ |  |____ |  |\   | 
|_______/       |__|    /__/     \__\ | _| `._____|   |__|     |__| |__| \__|  \______|    |_______/     \______|| _| `._____||_______||_______||__| \__| 
                                                                                                                                                          
*/

void starting_show(){
   textFont(f);
   textAlign(LEFT,TOP);
   text(clock.getTime(numpad.get_hour(), numpad.get_minute()),190,120);
   
   if(clock.isAM)
     image(weatherIconMorning,470,30);
   else
     image(weatherIconNight,470,30);
   
   
}

void login_show() {
    textFont(f);
    textAlign(LEFT, TOP);
    text("Accounts", 300, 400);
    text("_______", 300, 410);
    text("testAccount1", 300, 550);
    text("testAccount2", 300, 650);
    text("testAccount3", 300, 750);
    text(nameString, 300, 850);
    
    text("Please select the user account you would like to login", 1300, 175);
    accountImg.display();    
}

void login_released() {
    if(accountImg.pressed()) {
        println("hi");
        screen = "Fingerprint_login";
    }
}

void fingerprint_login_show() {
  
  textFont(f);
    textAlign(CENTER, TOP);
    text("Please scan your fingerprint below.", 1446, 361);
    fingerprint.display();
    
}

void fingerprint_login_released() {
  
  if(fingerprint.pressed()) {
      screen = "Main";
    }
  
}

void starting_released(){
  
  
}