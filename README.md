# airplane-landing-gear-mechanism

Kinematics and Dynamics of Machinery
four bar linkage. 



# Abstract
  * Gain an enhanced understanding of how four bar linkages behave and methods used to analyze the motion of four bar linkages. We applied our knowledge of four bar linkages in analyzing the landing gear of a airplane. Matlab was utilized to write code that simulates the movement of the landing gear coupled with plot of graph that shows the values of the angle of the coupler link to the angle of the input link as well as the angle of the ouput link to the angle of the input link.
  
  
# Kinematic Diagrams
  * Kinematic Diagrams are utilized to analyze the types and number of links plus joints in the mechanism. The links are label l_1  to L_N, where N represent the total number of links in a mechanism. The joints are labeled in alphabetical letters starting at A. The ground joints are represented as Oj, where j represents the total number of grounded joints. Figure below depicts the Kinematic diagram of the landing gear. 
  

# Calculating the Ground Points
  * In order to solve the location of the ground points certian sets were undertaken. An imaginary line was traced from P1 to P3, P2 to P4, P3 to P5 and P4 to P6. A perpendicular bisector was drawn from a point towards those imaginary lines. After careful construction of the lines it became visible that the perpendicular bisectors that bisect the line between P1 to P3 and P3 to P5 intersect at a certain (x, y) point in the coordinate. Similarly the perpendicular bisectors that go through line between P2 and P4 and P4 and P6 intersect at certain point (x, y). The points on the line where the perpendicular bisector passes through were calculated by using the midpoint formula displayed in equation (1,2,3,4). Consequently, we calculated the slope of the lines which the bisectors bisect as it’s expressed in equation (5,6,7,8). As we know in geometry the product of slope of two lines that are perpendicular to one another is -1. We expressed the slope of the perpendicular based of the line it bisects. We utilized the slope intercept equation of a line to express the perpendicular bisectors. We equated the lines at the intersecting point to calculate value of point X and substituted the equation into the slope intercept form calculated earlier to calculate the point Y as it can be seen in equation (9,10,11,12). After performing the steps, it was input to the MATLAB® program which calculated the ground values to be G1 to be (0,0) and G2 to be (-10,0). 
   
   
      
# Calculating the Angle Between Links
  * After calculating the ground points, we applied the vector loop method to calculate the value of the angle between the links. From our knowledge of how we apply vector loop method, we set up the summation of the vectors in the loop in the way that abides with the application of the equation. We applied the distance formula to find the length of the line between G1 and G2, G2 and P1, P1 and P2 and G1 and P2. Based on the configuration we assumed for our vector loop we can confirm that the value of angle theta 1 that relates to R1 is 0 radians. Also the theta 2 that relates to R2 is 0 radians at the start position. Figure shows the usage of the vector loop method to calculate the value of angle for vector R4 and R3.

  
  
# Contributors
Delkhaz
Mubarek
