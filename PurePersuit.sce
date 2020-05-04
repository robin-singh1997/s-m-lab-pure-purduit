//Parameters definitinos

xb=[80;90;99;108;116;125;133;141;151; 160;169;179;180] //x position array of bomber
yb=[0;-2;-5;-9;-15;-18;-23;-29;-28;-25;-21;-20;-17]    //y position array of bomber 
xf=0  //initial x position of fighter plane
yf=50 // iniitial y positino of fighter plane
V=20  //velocity of the figher plane in Km/s


// user defined functions
function[D]=Dist(XB,YB, XF,YF)         //functino to calculate the distance between bomber and fighter planes
    D=sqrt((YB-YF)^2+(XB-XF)^2)
endfunction

function[xf,yf]=NextPos(XB,YB,XF,YF,V)  //function to calculate the next position of fighter plane
   [d]=Dist(XB,YB,XF,YF)
   sin0=(YB-YF)/d
   cos0=(XB-XF)/d
   xf=XF+V*cos0
   yf=YF+V*sin0
endfunction

//main simulation program
for i=1:12
  [d]=Dist(xb(i),yb(i),xf,yf)
  disp(d)
   if d <=10 then    //if distance between bomber and figher is less than or equal to 10 km bomber is shot down by fighter
   disp("bombed")
   break
elseif i > 11 then   // if the attack window of 11 minutes is done the bomber is escaped
    disp("bomber escaped")
    else
   [xf,yf]=NextPos(xb(i),yb(i),xf,yf,V)
   end
end;
