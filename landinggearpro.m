%Landing gear Ground points
%This program calculates the ground points for a simulation of an airplane
%landing gear and the angle between the links. It then uses the values
%calculated to create a simulation as the landing gear goes from the
%starting position and touches the ground. 
%inputs are :
%p1 = [6 0];
% p2 = [-0.946699141100893 -4.247086478782448];
% p3 = [2.428700058734363 -5.486475738094875];
% p4 = [-5.055787223379352 -8.692224112360492];
% p5 = [-4.242640687119286 -4.242640687119286];
% p6 = [-10 -10];
% R1, R2, R3 and R4
% theta 1, theta 2 
%outputs are:- m1,s_1,m2,s_2,x1,y1,m3,s_3,m4,s_4,x2,y2,theta 3 and theta 4.

%Intialization of the program
clf % clears plot
clc % clears the command window 
clear all % clears the variables

%% Main program
p1 = [6 0]; %point 1 
p2 = [-0.946699141100893 -4.247086478782448]; %point 2.
p3 = [2.428700058734363 -5.486475738094875]; %point 3.
p4 = [-5.055787223379352 -8.692224112360492]; %point 4.
p5 = [-4.242640687119286 -4.242640687119286];% point 5.
p6 = [-10 -10]; %point 6
m1 = [(p1(1)+ p3(1))/2 (p1(2) + p3(2))/2]; %calculates the midpoint of line between point 1 and point 3.
s_1 = (p1(2)-p3(2))/(p1(1)-p3(1));% calculates the slope of line passing through point 1 and point 3.
m2 = [(p3(1)+p5(1))/2 (p3(2)+p5(2))/2];% calculates the midpoint of line between point 3 and point 5.
s_2 =(p5(2)-p3(2))/(p5(1)-p3(1));% calculates the slope of line passing through point 3 and point 5.

 x1 = ((-m1(1))/s_1 + (m2(1))/s_2 + (m2(2)) -( m1(2)))*((s_1*s_2)/(s_1-s_2))% set the two correspoonding y equations equal to calculate x1.
y1 = ((-1/s_1)*(x1) + (m1(1)/s_1) + (m1(2)))% plugged in the x1 value calculated above and calculated the y1.

m3 = [(p2(1) + p4(1))/2 (p2(2)+p4(2))/2];%calculates the midpoint of line between point 2 and point 4.
s_3 = ((p4(2)-p2(2))/(p4(1)-p2(1)));% calculates the slope of line passing through point 2 and point 4.
m4 = [(p4(1)+p6(1))/2 (p4(2)+p6(2))/2];%calculates the midpoint of line between point 4 and point 6.
s_4 = ((p6(2)-p4(2))/(p6(1)-p4(1)));% calculates the slope of line passing through point 4 and point 6.

x2 = ((-m3(1))/s_3 + (m4(1))/s_4 + (m4(2)) -( m3(2)))*((s_3*s_4)/(s_3-s_4))% set the two correspoonding y equations equal to calculate x2.
y2 = ((-1/s_3)*(x2) + (m3(1)/s_3) + (m3(2)))% plugged in the x1 value calculated above and calculated the y2.

%calculate the distance between points provided
r_1= ((0-10)^2 + (0-0)^2)^(1/2);
r_2= ((6-0)^2 + (0-0)^2)^(1/2);
r_3= ((6+0.9466991411008933)^2 + (0+4.247086478782448)^2)^(1/2);
r_4 = ((-10+0.946699141100893)^2 + (0+4.247086478782448)^2)^(1/2);

theta_1 = 0;% value of angle theta that relates Ground 1 and 2 at initial position

theta_2 = pi; %value of the angle theta 2 at initial position


theta_2fin = 45 * (pi/180); %value of the angle theta 2 final at the landing position calculated 
theta_1fin = 0; % value of angle theta that relates Ground 1 and 2 at final position


theta_3val = []; %empty matrix that stores the calculated value of theta 3 as it goes through the loop.
theta_4val = [] ; %empty matrix that stores the calculated value of theta 3 as it goes through the loop.
u_2 = [] ; % empty matrix that stores value of u_2 used to calculate theta
theta_2val = linspace(theta_2,theta_2fin,150); %creates a matrix that contains value of theta_2 from start to finish.
for i = 1:length(theta_2val) %for loop used to calculaate the values of theta 3 and 4 when the loop goes through iteration each time. 
     C_2 = (r_3)^2 - (r_2)^2 - (r_4)^2 - (r_1)^2 + 2*r_1*r_2*cos(theta_2val(i)); % Uses the vector loop provided value to subsititute to calculate theta 3 and 4.
     A_2 = 2*r_4*((r_1) - (r_2*cos(theta_2val(i)))); % Uses the vector loop provided value to subsititute to calculate theta 3 and 4.
     B_2 = -2*r_2*r_4*sin(theta_2val(i)); % Uses the vector loop provided value to subsititute to calculate theta 3 and 4.

     y_2 = sqrt((A_2)^2 + (B_2)^2 - (C_2)^2); % Uses the vector loop provided value to subsititute to calculate theta 3 and 4.
     x_2 = C_2  + A_2 ;  % Uses the vector loop provided value to subsititute to calculate theta 3 and 4.

     u_2 = (B_2 + y_2)/(x_2); % Uses the vector loop provided value to subsititute to calculate theta 3 and 4.
     theta_4fin = 2*atan(u_2); % calculates the final angle of theta 4. 
     cosang_3 = ((-r_2*cos(theta_2val(i))) + (r_4*cos(theta_4fin)) + r_1)/(r_3); %calculates cosang variable that would be used to calculate theta 3 final.
     sinang_3 = ((-r_2*sin(theta_2val(i))) + (r_4*sin(theta_4fin)))/(r_3) ; %calculates sinang variable that would be used to calculate theta 3 final.
     theta_3fin = atan2((sinang_3),(cosang_3)) ; % Uses cosang and sinang to calculate theta 3 final.
     theta_3val = [theta_3val,theta_3fin]; %stores the values of theta 3 in a matrix
     theta_4val = [theta_4val,theta_4fin]; % stores the values of theta 4 in a matrix
end

%plots the ground points that were calculated. 
 
g1 = [x1 y1]; %ground 1
g2 = [x2 y2]; % ground 2 
p0x = [g1(1) g2(1)]; %put the x values of ground 1 and ground 2 in to a matrix
p0y = [g1(2) g2(2)] ;%put the y values of ground 1 and ground 2 in to a matrix
plot (p0x,p0y); hold on; %plots the line the goes through ground 1 and 2.

p1x = [p1(1) p2(1)]; %put the x values of point 1 and point 2  in to a matrix
p1y = [p1(2) p2(2)];%put the y values of ground 1 and ground 2 in to a matrix    
plot(p1x,p1y); hold on;  %plots the line the goes through point 1 and 2.

p2x = [p3(1) p4(1)];%put the x values of point 3  and point 4 in to a matrix
p2y = [p3(2) p4(2)];%put the y values of point 3 and point 4 in to a matrix
plot(p2x,p2y); hold on;  %plots the line the goes through point 3 and 4.
   
p3x = [p5(1) p6(1)]; %put the x values of point 5 and point 6 in to a matrix
p3y = [p5(2) p6(2)] ;%put the y values of point 5 and point 6 in to a matrix
plot(p3x, p3y); hold on; %plots the line the goes through point 5 and 6.

ground=plot ([-15 10], [-18.3 -18.3],'-o'); hold on; %plot the ground where the gear lands.
set(ground, 'LineWidth',4);% sets the thickness of the ground.
axis equal; % sets axis equally 
    
axis ([-15 10 -20 5]) %sets the axis as specified 
 
hold on;  
   
    
    %the for loop calculates the positions of the links as they go through
    %the simulation. it then uses these values to plot the simulation of
    %the gear as it goes from start to landing position.
for i = 1:length(theta_2val)
    
    k2x = r_2*cos(pi+theta_2val(i))+g1(1); %calculates the x position of the input link each time it goes through the loop.
    k2y = r_2*sin(pi+theta_2val(i))+g1(2);%calculates the y position of the input link each time it goes through the loop.
    k4x = (r_4)*cos(pi+theta_4val(i))+g2(1); %calculates the x position of the coupler link each time it goes through the loop.
    k4y = (r_4)*sin(pi+theta_4val(i))+g2(2);%calculates the y position of the coupler link each time it goes through the loop.
    k5x = ((5+r_4)*cos(pi+theta_4val(i))+g2(1)); %calculates the x position of the output link each time it goes through the loop.
    k5y = ((5+r_4)*sin(pi+theta_4val(i))+g2(2)); %calculates the y position of the output link each time it goes through the loop.
    p2 = plot ([g1(1) k2x], [g1(2) k2y],'-o'); % plots the simulation of the link that goes from ground 1 to input link.
    p3 = plot([k2x k4x],[k2y k4y],'-o'); % plots the simulation of the link as link goes from the initial position to landing position.
    p4 = plot ([g2(1) k5x], [g2(2) k5y], '-o'); % plots the simulation of the link as link goes from the initial position to landing position.
    k5cen = [k5x k5y] % sets the center point for the wheel of the landing gear. 
    circ1= viscircles(k5cen,3); % plots a circle that depicts the wheel.
    
    
    
    M(i) =getframe;

 		%deletes line after simulation
    delete(p2);
    delete(p3); 
    delete(p4); 
    delete(circ1); 
    
    
    
end
    %the for loop calculates the positions of the links as they go through
    %the simulation. it then uses these values to plot the simulation of
    %the gear as it goes from landing position to start position.  
for i =length(theta_2val):-1:1  
    k2x = r_2*cos(pi+theta_2val(i))+g1(1); %calculates the x position of the input link each time it goes through the loop.
    k2y = r_2*sin(pi+theta_2val(i))+g1(2); %calculates the y position of the input link each time it goes through the loop
    k4x = r_4*cos(pi+theta_4val(i))+g2(1); %calculates the x position of the coupler link each time it goes through the loop.
    k4y = r_4*sin(pi+theta_4val(i))+g2(2); %calculates the y position of the coupler link each time it goes through the loop.
    k6x = (5+r_4)*cos(pi+theta_4val(i))+g2(1); %calculates the x position of the output link each time it goes through the loop.
    k6y = (5+r_4)*sin(pi+theta_4val(i))+g2(2); %calculates the y position of the output link each time it goes through the loop.
    p2 = plot ([g1(1) k2x], [g1(2) k2y],'-o'); % plots the simulation of the link that goes from ground 1 to input link.
    p3 = plot([k2x k4x],[k2y k4y],'-o'); % plots the simulation of the link as link goes from the initial position to landing position.
    p4 = plot ([g2(1) k6x], [g2(2) k6y], '-o');  % plots the simulation of the link as link goes from the landing position to initial position.
    k6cen = [k6x k6y]; % sets the center point for the wheel of the landing gear.
    circ1=viscircles(k6cen,3); % plots a circle that depicts the wheel.
    
    
    M(i) =getframe; 

 				%deletes the lines after simulation is completed
    delete(p2); 
    delete(p3); 
    delete(p4); 
    delete(circ1); 
    
    
end 
% plots the landing gear at intial position after completing the
% simulation.
plot ([g1(1) k2x], [g1(2) k2y],'-o'); hold on; % plots the simulation of the link that goes from ground 1 to input link.
plot ([g2(1) k6x], [g2(2) k6y], '-o'); hold on; % plots the simulation of the link that goes from ground 2 to output link.
plot ([k2x k4x],[k2y k4y],'-o'); hold on;% plots the links at the initial position 
circ1=viscircles(k6cen,3); %plots the wheel of the landing gear
axis equal %sets axis equal

axis ([-15 10 -20 5]); %sets the axis 

%this section is used to plot the graph theta 3 vs theta 2 
figure 


axis equal %sets axis equal 

axis ([0.5 3.5 -1.5 2.5]) ;% sets the axis 
xlabel('Theta 2[radians]'); %labels the x coordinate of the graph
ylabel('Theta 3[radians]'); %labels the y coordinate of the graph
title('Theta 3 vs Theta 2'); %sets the title of the plot 
hold on;

for i =1: length(theta_2val) % the for loop plots the values of the theta 2 and theta 3. 
    
 
   plo= plot (theta_2val(i),theta_3val(i) , '-ro'); %plots theta 2 vs theta 3
    
   
   M(i) = getframe; % get frame 
       
end 
hold off; 


%this section is used to plot the graph theta 4 vs theta 2
figure 

axis equal 

axis([0.5 3.5 -1.5 3.5]); %sets the axis 
xlabel('Theta 2[radians]'); %labels the x coordinate of the graph
ylabel('Theta 4[radians]'); %labels the y coordinate of the graph 
title('Theta 4 vs Theta 2'); %labels the title of the plot
hold on;
for i = 1:length(theta_2val)  % the for loop plots the values of the theta 2 and theta 4.
    plo2 = plot(theta_2val(i),theta_4val(i), '-ro'); %plots theta 2 vs theta 4.
    
    M(i) = getframe; %get frame 
    
end 

hold off;
