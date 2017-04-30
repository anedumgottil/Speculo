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
class Clock{
  int hours;
  int minutes;
  boolean isAM;
  
  Clock(){
    hours = hour();
    minutes = minute();
    isAM = true;
  }
  
  String getTime(String h, String m)
  {
     String time="";
     
     hours = hour();
     minutes = minute();
     
     if(hours > 12){
      isAM = false; 
      hours -= 12;
     }
     
     if(hours == 0){
      hours = 12; 
     }
     
     time+= hours;
     time+=":";
     
     if(minutes > 9){
       time+=minutes;
     }else{
       time+="0"+minutes; 
     }
     
     if(isAM)
       time+=" AM";
     else
       time+=" PM";
     
     if(h != "" && m != "")
     {
       return h + ":" + m;
     }
     return time;
  }
}
/****************************** Numpad -- Tran ********************************/
/***************************** Also used for date and time ********************/
class Numpad {
  
  // 10 number buttons
  int numSelected = -1;
  int currDateVal = 0;
  int currTimeVal = 0;
  FeatureButton[] numFeature = new FeatureButton[10];
  String[] numName = {"", "", "", "", "", "", "", "", "", ""};
  String[] numClicked = {"0_clicked.png", "1_clicked.png", "2_clicked.png", "3_clicked.png", "4_clicked.png", "5_clicked.png", "6_clicked.png", "7_clicked.png", "8_clicked.png", "9_clicked.png"};
  String[] numUnclicked = {"0.png", "1.png", "2.png", "3.png", "4.png", "5.png", "6.png", "7.png", "8.png", "9.png"};
  String[] numVal = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"};
  String[] numPlaceHolder = {"","","","","","","","",""};
  String[] numPlaceHolder2 = {"","","",""};
  
  //Date Dictionary
  String[] month = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
  String[] monthSpanish= {"Enero", "Febrero", "Marzo",  "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubure", "Noviembre", "Diciembre"};
  void numpad_show()
  {
    // Display the numpad
    for(int i = 0; i < numName.length; i++){
        numFeature[i].display();
        if(numSelected != -1 && numFeature[i].isClicked == true){
          numFeature[i].displayExpanded();
        }
     }
     
     // Text for date
     text("_ _ _ _ _ _", 250, 446);
     text("/", 334, 446);
     text("/", 434, 446);
     
     // set so text will appear in correct location
     text(numPlaceHolder[0], 250 + 50 * 0, 446);
     text(numPlaceHolder[1], 250 + 50 * 1, 446);
     text(numPlaceHolder[2], 250 + 50 * 2, 446);
     text(numPlaceHolder[3], 250 + 50 * 3, 446);
     text(numPlaceHolder[4], 250 + 50 * 4, 446);
     text(numPlaceHolder[5], 250 + 50 * 5, 446);
     
     // Text for time
     text("_ _ _ _", 250, 1082);
     text(":", 332, 1082);
     text(numPlaceHolder2[0], 250 + 50 * 0, 1082);
     text(numPlaceHolder2[1], 250 + 50 * 1, 1082);
     text(numPlaceHolder2[2], 250 + 50 * 2, 1082);
     text(numPlaceHolder2[3], 250 + 50 * 3, 1082);

  }
  
  void numpad_released(boolean dateClicked)
  {
     // Checking which nums will be pressed
    int previouslySelectednum = numSelected;
    if(dateClicked == true)
    {
       for(int i = 0; i < numFeature.length; i++){
        if(numFeature[i].pressedNum()){
          
            // Sets the previous selected feature to false
           if( previouslySelectednum != -1){
               numFeature[previouslySelectednum].isClicked = false;
           }
           
           numFeature[i].isClicked = true;
           numSelected = i;
           numPlaceHolder[currDateVal] = numVal[numSelected];
           currDateVal += 1;
           if(currDateVal > 5)
           {
             currDateVal = 0;
           }
           break;     
        }
      }
    }
    // Time was clicked instead 
    else if(dateClicked == false)
    {
      for(int i = 0; i < numFeature.length; i++){
        if(numFeature[i].pressedNum()){
          
            // Sets the previous selected feature to false
           if( previouslySelectednum != -1){
               numFeature[previouslySelectednum].isClicked = false;
           }
           
           numFeature[i].isClicked = true;
           numSelected = i;
           numPlaceHolder2[currTimeVal] = numVal[numSelected];
           currTimeVal += 1;
           if(currTimeVal > 3)
           {
             currTimeVal = 0;
           }
           break;     
        }
      }
    }
  }
  
  String get_hour()
  {
    if( numPlaceHolder2[0] != "0" && numPlaceHolder2[0] != "1")
    {
       return "";
    }

    if((numPlaceHolder2[0] == "0" || numPlaceHolder2[0] == "1") &&
    numPlaceHolder2[1] != "0" && numPlaceHolder2[1] != "1" && numPlaceHolder2[1] != "2")
    {
       return "";
    }
    return numPlaceHolder2[0] + numPlaceHolder2[1];
  }
  
  String get_minute()
  {
    return numPlaceHolder2[2] + numPlaceHolder2[3];
  }
  
  String translate_month(boolean spanish)
  {
    //Month Dictionary 
    if(spanish == false)
    {
      if(numPlaceHolder[0] == "0")
      {
        switch(numPlaceHolder[1])
        {
          case "1":
            return month[0];
          case "2":
            return month[1];
          case "3":
            return month[2];
          case "4":
            return month[3];
          case "5":
            return month[4];
          case "6":
            return month[5];
          case "7":
            return month[6];
          case "8":
            return month[7];
          case "9":
            return month[8];    
        }
      }
      else if(numPlaceHolder[0] == "1")
      {
        switch(numPlaceHolder[1])
        {
          case "0":
            return month[9];
          case "1":
            return month[10];
          case "2":
            return month[11];
        }
      }
    }
    else if(spanish == true)
      // spanish
      if(numPlaceHolder[0] == "0")
      {
        switch(numPlaceHolder[1])
        {
          case "1":
            return monthSpanish[0];
          case "2":
            return monthSpanish[1];
          case "3":
            return monthSpanish[2];
          case "4":
            return monthSpanish[3];
          case "5":
            return monthSpanish[4];
          case "6":
            return monthSpanish[5];
          case "7":
            return monthSpanish[6];
          case "8":
            return monthSpanish[7];
          case "9":
            return monthSpanish[8];    
        }
      }
      else if(numPlaceHolder[0] == "1")
      {
        switch(numPlaceHolder[1])
        {
          case "0":
            return monthSpanish[9];
          case "1":
            return monthSpanish[10];
          case "2":
            return monthSpanish[11];
        }
    }
    
    return "";
  }
  
  String translate_day()
  {
    // Checks for wrong day input
    if(numPlaceHolder[2] != "0"
    && numPlaceHolder[2] != "1"
    && numPlaceHolder[2] != "2")
    {
      if(numPlaceHolder[2] == "3" && (numPlaceHolder[3] == "0" || numPlaceHolder[3] == "1"))
      {
        return numPlaceHolder[2] + numPlaceHolder[3];
      }
      return "";
    }
    
    return numPlaceHolder[2] + numPlaceHolder[3];
  }
  
  String translate_year()
  {
    if(numPlaceHolder[4] == "" && numPlaceHolder[5] == "")
    {
      return "";
    }
    return "20" + numPlaceHolder[4] + numPlaceHolder[5];
  }
}
/****************************** Settings Screen -- Tran ********************************/
class SettingScreen
{ 
  // Account
  int userSelected = -1;
  FeatureButton[] userFeature = new FeatureButton[2];
  String[] userName = {"", ""};
  String[] userUnclicked = {"user.png", "user_add.png"};
  String[] userClicked = {"user_clicked.png", "user_add_clicked.png"};
  
  // Clear button
  int clearSelected = -1;
  FeatureButton[] clearFeature = new FeatureButton[3];
  String[] clearName = {"","",""};
  String[] clearUnclicked = {"clear.png", "clear.png","clear.png"};
  String[] clearClicked = {"clear_clicked.png","clear_clicked.png","clear_clicked.png"};
  
  // 2nd Part Clear buttons
  FeatureButton[] clearFeature2 = new FeatureButton[5];
  String[] clearName2 = {"","","","",""};
  String[] clearUnclicked2 = {"clear.png", "clear.png","clear.png","clear.png","clear.png"};
  String[] clearClicked2 = {"clear_clicked.png","clear_clicked.png","clear_clicked.png","clear_clicked.png","clear_clicked.png"};
  
  //Date and Time
  FeatureButton[] dtwFeature = new FeatureButton[2];
  int dtwSelected = -1;
  boolean dateSelected = true;
  String [] dtwName = {"", ""};
  String [] dtwUnclicked = {"dtw_date.png", "dtw_time.png"};
  String [] dtwClicked = {"dtw_date_clicked.png","dtw_time_clicked.png"};

  
  // Weather
  FeatureButton[] switchFeature = new FeatureButton[1];
  String[] switchName = {""};
  String[] switchUnclicked = {"switch_f.png"};
  String[] switchClicked = {"switch_c.png"};
  
  // Language
  // 10 buttons, 1 for each language
  FeatureButton[] languageFeature = new FeatureButton[10];
  int languageSelected = -1;
  String[] languageName = {"", "", "", "", "", "", "", "", "", ""};
  String[] languageUnclicked = {"english.png", "spanish.png", "chinese.png", "hindi.png", "portugues.png", 
                                "japanese.png", "french.png", "arabic.png", "korean.png", "german.png"};
  String[] languageClicked = {"english_clicked.png", "spanish_clicked.png","chinese_clicked.png", "hindi_clicked.png", 
                              "portugues_clicked.png", "japanese_clicked.png", "french_clicked.png", "arabic_clicked.png", 
                              "korean_clicked.png", "german_clicked.png"};
  

  //Current selected screen
  String setting_screen;
  int settingFeatureSelected = -1;

  // Display the setting
  void settings_show()
  {
     display_core();
     
     // Display settings icons
     for (int i = 0; i < settingFeature.length; i++){
       settingFeature[i].display();
       if(settingFeatureSelected != -1 && settingFeature[i].isClicked == true){
         settingFeature[i].displayExpanded();
       }
     }
     
     hamburgerIcon.display();
     lowerIcon.display();
     settingsButton.display();
     logoutButton.display();
  }
  
  void settings_released()
  {
   // Determine which icon was pressed
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
   
   if(hamburgerIcon.pressed()){
     if(hamburgerIcon.isClicked == false){
       hamburgerIcon.isClicked = true; 
       lastScreen = screen;
       screen = "Collapsed";
      
     }
   }
   
   if(settingsButton.pressed()){
       settingsButton.isClicked = false; 
       screen = "Main";
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
       screen = "Starting";
     }
   }  
  }
 
/*************************************** Account **************************************/
  void account_show()
  {
    if(userFeature[0].isClicked == true)
    {
      user_show();
    }
    else
    {
      text(username, 550, 450);
      text("Add User", 550, 850);
      // Display user options
      for (int i = 0; i < userName.length; i++){
        userFeature[i].display();
        if(userSelected != -1 && userFeature[i].isClicked == true){
          userFeature[i].displayExpanded();
        }
      }
    }
  }
  
  void account_released()
  {
    if(userFeature[0].isClicked == true)
    {
      user_released();
    }
    else 
    {
      // Checking which account will be pressed
      int previouslySelectedUser = userSelected;
      for(int i = 0; i < userFeature.length; i++){
        if(userFeature[i].pressedLarge()){
          
            // Sets the previous selected feature to false
           if( previouslySelectedUser != -1){
               userFeature[previouslySelectedUser].isClicked = false;
           }
           
           userFeature[i].isClicked = true;
           userSelected = i;
           break;     
        }
      }
    }
  }
/*************************************** Display User Info *************************/
  void user_show()
  {
     int i = 60;
     int y = 650;
     
     text("Name: Anthony", 200, 280 + 50);
     textSize(55);
     text("Health:", 200, 280 + 150);
     text("Social Media:", 200, y + 100);
     
     textSize(40);
     text("Sleep", 280, 280 + i*4);
     text("Step", 280, 280 + i*5);
     text("Weight", 280, 280 + i*6);
     
     text("Facebook", 280, y + i*3);
     text("Twitter", 280, y + i*4);
     text("Instagram", 280, y + i*5);
     text("Reddit", 280, y + i*6);
     text("Spotify", 280, y + i*7);
     textSize(60);    
     
     for (int j = 0; j < clearName.length; j++){
        clearFeature[j].display();
        if(clearSelected != -1 && clearFeature[j].isClicked == true){
          clearFeature[j].displayExpanded();
        }
     }
     
     for (int j = 0; j < clearName2.length; j++){
        clearFeature2[j].display();
        if(clearSelected != -1 && clearFeature2[j].isClicked == true){
          clearFeature2[j].displayExpanded();
        }
     }
  }
  
  void user_released()
  {
    // Checking which account will be pressed
    for(int i = 0; i < clearFeature.length; i++){
      if(clearFeature[i].pressed()){
        
         clearFeature[i].isClicked = true;
         clearSelected = i;
         break;     
      }
    }
    
    // Checking which account will be pressed
    for(int i = 0; i < clearFeature2.length; i++){
      if(clearFeature2[i].pressed()){
        
         clearFeature2[i].isClicked = true;
         clearSelected = i;
         break;     
      }
    }
    
  }
  
/*************************************** Date  **************************************/
  void date_show()
  {
    //text("Date", 200, 350);
    
    text("Weather", 200, 625);
    //text("Time", 200, 950);
    
    dtwFeature[0].display();
    dtwFeature[1].display();
    
  }
  
  void date_released()
  {
    // Checking which languages will be pressed
    int previouslySelectedDtw = dtwSelected;
    for(int i = 0; i < languageFeature.length; i++){
      if(dtwFeature[i].pressed()){
          // Sets the previous selected feature to false
         if( previouslySelectedDtw != -1){
             dtwFeature[previouslySelectedDtw].isClicked = false;
         }        
         dtwFeature[i].isClicked = true;
         if(i == 0)
         {
           dateSelected = true;
         }
         else
         {
           dateSelected = false;
         }
         dtwSelected = i;
         break;     
      }
    }
  }
  
/*************************************** Weather **************************************/
  void weather_show()
  {
    text("F",360, 740);
    text("C",525, 740);
    // Display weather
    switchFeature[0].display();
  }
  
  void weather_released()
  {
    //Determine if clicked or not
    // Checking which languages will be pressed
    if(switchFeature[0].pressed())
    {
      if(switchFeature[0].isClicked == false)
      {
        switchFeature[0].isClicked = true;
      }
      else
      {
        switchFeature[0].isClicked = false;
      }
    }
  }  
/************************************* Languages **************************************/
  void language_show()
  {
    // Display languages
    for (int i = 0; i < languageName.length; i++){
      languageFeature[i].display();
      if(languageSelected != -1 && languageFeature[i].isClicked == true){
        languageFeature[i].displayExpanded();
      }
    }
  }
  
  void language_released()
  {
    // Checking which languages will be pressed
    int previouslySelectedLanguage = languageSelected;
    for(int i = 0; i < languageFeature.length; i++){
      if(languageFeature[i].pressed()){
        
          // Sets the previous selected feature to false
         if( previouslySelectedLanguage != -1){
             languageFeature[previouslySelectedLanguage].isClicked = false;
         }
         
         languageFeature[i].isClicked = true;
         languageSelected = i;
         break;     
      }
    }
    
    if(settings.languageSelected == 1){
       for (int i = 0; i < features.length; i++){
         settingFeature[i].setName(settingFeatureNamesSpanish[i]);
       }
     }else{
      for (int i = 0; i < features.length; i++){
         settingFeature[i].setName(settingFeatureNames[i]);
       } 
     }
  }
}
/*** Setup screen ***/
void setup_show() {
    textFont(f);
    textAlign(CENTER, TOP);
    text("Welcome to Speculo! We will begin the setup of your mirror.", 1446, 361);
    text("Touch the account icon below to begin.", 1446, 361 + 75);
    setupAccount.display();
}

void setup_released() { 
  if(setupAccount.pressed()) {
    screen = "Read_Fingerprint";
  }
}

/*** Scan fingerprint screen ***/
void read_fingerprint_show() {
    textFont(f);
    textAlign(CENTER, TOP);
    text("Please scan your fingerprint below.", 1446, 361);
    fingerprint.display();
    
}

void read_fingerprint_released() {
    if(fingerprint.pressed()) {
      println("made it");
      screen = "Name";
    }
}

/*** Name screen ***/
void name_show() {
    textFont(f);
    textAlign(CENTER, TOP);
    text("What is your name?", 1446, 300);
    
    nameAccount.display();

    arrowRight .display();
   
    for(int i = 0; i < 36; i++) {
     
     //Display the keyboard
     keyboardButtons[i].display();
     backspace.display();
     shift.display();
     
     //Insert the text on each key
     fill(0);
     if(i < 10) {
        text(keyboard[i], i * 95 + 1130, 720);
      }
    
    else if (i < 20) {
      text(keyboard[i], i * 95 + 235, 810);
    }
    
    else if (i < 29) {
      text(keyboard[i], i * 95 - 660, 905);
    }
    
    else {
      text(keyboard[i], i * 95 - 1455, 1000);
    }  
   }
   
   //Backspace text
   text("<--", 2100, 720);
   
   //Shift text
   text("shift", 1970, 1000);
   
   //Name string
   text(nameString, 1146, 385);
    
}

void name_released() {
  if(arrowRight.pressedKeyboard2()) {
      screen = "Account_input";
  }
  
  for(int i = 0; i < keyboard.length; i++) {
       if(keyboardButtons[i].pressedKeyboard()) {         
           nameString += keyboard[i];
       }
       
   }
   
   if(backspace.pressedKeyboard2() && nameString.length() > 0) {
       nameString = nameString.substring(0, nameString.length() - 1);
   }
  
}

/*** Account input screen ***/
void account_input_show() {
   textFont(f);
   textAlign(LEFT, TOP);
   fill(255);   
   
   String accounts[] = {"Facebook", "Twitter", "Wifi", "Spotify", "FitBit"};
   
   for(int i = 0; i < accounts.length; i++) {     
       fill(255);
       text(accounts[i], 150, i * 115 + 100);
       text("|  username", 450, i * 115 + 100);
       text("password", 1555, i * 115 + 100);
       
       usernames[i].display(); //username fields
       passwords[i].display(); //password fields
       logins[i].display();
   }

  
  arrowRight.display();
  arrowLeft.display();
   
   for(int i = 0; i < 36; i++) {
     
     //Display the keyboard
     keyboardButtons[i].display();
     backspace.display();
     shift.display();
     
     //Insert the text on each key
     fill(0);
     if(i < 10) {
        text(keyboard[i], i * 95 + 1130, 720);
      }
    
    else if (i < 20) {
      text(keyboard[i], i * 95 + 235, 810);
    }
    
    else if (i < 29) {
      text(keyboard[i], i * 95 - 660, 905);
    }
    
    else {
      text(keyboard[i], i * 95 - 1455, 1000);
    }  
   }
   
   //Backspace text
   text("<--", 2100, 720);
   
   //Shift text
   text("shift", 1970, 1000);
   
   for(int i = 0; i < 5; i++) {
     text(usernameStrings[i], 813, i * 115 + 110);
     text(passwordStrings[i], 1840, i * 115 + 110);
   }
}

void account_input_released() {
  int previouslySelected = accountSelected;
  
   for (int i = 0; i < 5; i++){
     if(usernames[i].pressed()){
         // Sets the previous selected feature to false
         if( previouslySelected != -1){
             usernames[previouslySelected].isClicked = false;
             passwords[previouslySelected].isClicked = false;
         }
  
         usernames[i].isClicked = true;
         accountSelected = i;
         
         usernameSelected = true;
         passwordSelected = false;
         
         break;
     }
     
     if(passwords[i].pressed()){
         // Sets the previous selected feature to false
         if( previouslySelected != -1){
             usernames[previouslySelected].isClicked = false;
             passwords[previouslySelected].isClicked = false;
         }
  
         passwords[i].isClicked = true;
         accountSelected = i;
         
         usernameSelected = false;
         passwordSelected = true;
         
         break;
     }
     
     if(logins[i].pressedLogin()) {
         logins[i].isClicked = true;
     }
   }
   
   if(backspace.pressedKeyboard2() && previouslySelected != -1 && usernameSelected == true && usernameStrings[accountSelected].length() > 0) {
       usernameStrings[accountSelected] = usernameStrings[accountSelected].substring(0, usernameStrings[accountSelected].length() - 1);
   }
   
   else if(backspace.pressedKeyboard2() && previouslySelected != -1 && passwordSelected == true && passwordStrings[accountSelected].length() > 0) {
       passwordStrings[accountSelected] = passwordStrings[accountSelected].substring(0, passwordStrings[accountSelected].length() - 1);
   }
   
   for(int i = 0; i < keyboard.length; i++) {
       if(keyboardButtons[i].pressedKeyboard() && previouslySelected != -1 && usernameSelected == true) {         
           usernameStrings[accountSelected] += keyboard[i];
       }
       
       else if(keyboardButtons[i].pressedKeyboard() && previouslySelected != -1 && passwordSelected == true) {
           passwordStrings[accountSelected] += keyboard[i];
       }
   }
   
   if(arrowRight.pressedKeyboard()) {
     screen = "Main";
   }
   else if (arrowLeft.pressedKeyboard()) {
     screen = "Name";
   }
  
}
