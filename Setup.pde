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
   
   String accounts[] = {"Facebook", "Twitter", "Reddit", "Spotify", "FitBit"};
   
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