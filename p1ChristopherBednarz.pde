import controlP5.*;

ControlP5 cp5;
ControlTimer c;
Textlabel t;
RadioButton r1, r2;
PFont f;

//There was supposed to be a working timer, but I can't get it working

void setup() {
  size(400,600);
  frameRate(30);
  stroke(0);
  
  f = createFont("Arial",16,true);
  cp5 = new ControlP5(this);
  int buttnumb = 0;
  
  String n = Integer.toString(buttnumb);
  cp5.addButton("Start")
    .setLabel("Start/ \n +30sec")
    .setPosition(230,440)
    .setSize(50,50)
    .setColorBackground(#48BC4D);
  cp5.addButton("Stop")
    .setLabel("Stop/ \n Clear")
    .setPosition(110,440)
    .setSize(50,50)
    .setColorBackground(#DE1919);
  cp5.addButton("Clock")
    .setLabel("Clock Set")
    .setPosition(110,180)
    .setSize(75,25);
  cp5.addButton("Timer")
    .setLabel("Timer")
    .setPosition(110,215)
    .setSize(75,25);
  cp5.addButton(n)
    .setValue(buttnumb)
    .setPosition(170,440)
    .setSize(50,50);
  cp5 = new ControlP5(this);
  
  r1 = cp5.addRadioButton("radioButton")
         .setPosition(195,180)
         .setSize(25,20)
         .setColorForeground(color(120))
         .setColorActive(color(255))
         .setColorLabel(color(255))
         .setItemsPerRow(1)
         .setSpacingColumn(50)
         .addItem("Low - 100 W",1)
         .addItem("Med - 600 W",2)
         .addItem("High - 1100 W",3)
         ;
     
     for(Toggle t:r1.getItems()) {
       t.getCaptionLabel().setColorBackground(color(255,80));
       t.getCaptionLabel().getStyle().moveMargin(-7,0,0,-3);
       t.getCaptionLabel().getStyle().movePadding(7,0,0,3);
       t.getCaptionLabel().getStyle().backgroundWidth = 55;
       t.getCaptionLabel().getStyle().backgroundHeight = 13;
     }

    
    

  //c = new ControlTimer();
  //t = new Textlabel(cp5,"--", 100,100);
  //c.setSpeedOfTime(0);
  //c.reset();
    
 for (int x = 0; x < 3; x++){
   for (int y = 0; y < 3; y++){
     buttnumb++;
     n = Integer.toString(buttnumb);
      cp5.addButton(n)
        //.setColorBackground(#FFFFFF)
        //.setColorForeground(#FFFFFF)
        //.setColorActive(#000000)
        //.setColorValue(#FFFFFF)
        .setValue(buttnumb)
        .setPosition(110+(y*60),260+(x*60))
        .setSize(50,50);
    }
  }
  
  r1.activate(2);
}


void draw() {
  background(100);
  fill(#000000);
  rect(100, 110, 190, 390);
  fill(155);
  rect(110, 120, 170, 50);
  //t.setValue(c.toString());
  //t.draw(this);
  //t.setPosition(150, 160);
  fill(0);
  
  textFont(f,48);
  fill(0);
  text("00:00", 135, 160);
  
}

/*void keyPressed() {
  switch(key) {
    case('0'): r1.deactivateAll(); break;
    case('1'): r1.activate(0); break;
    case('2'): r1.activate(1); break;
    case('3'): r1.activate(2); break;
  }
  
}*/




public void controlEvent(ControlEvent theEvent) {
  if(theEvent.isFrom(r1)) {
    print("got an event from "+theEvent.getName()+"\t");
    for(int i=0;i<theEvent.getGroup().getArrayValue().length;i++) {
      print(int(theEvent.getGroup().getArrayValue()[i]));
    }
  }
  else {println(theEvent.getController().getName());
  }
}
