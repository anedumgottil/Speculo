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