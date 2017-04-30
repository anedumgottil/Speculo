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