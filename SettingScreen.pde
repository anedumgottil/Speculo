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