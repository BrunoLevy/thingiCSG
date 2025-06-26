// by Les Hall
// started 4-16-2014


amplitude = 1.5;
threads = 3;
periods = 3;
minDetail = 2.0;
ringDiameter = 17.35 + 2*amplitude + minDetail;
numTheta = 64;
$fn = 9;


for(t = [0:numTheta], k = [0:periods-1])
{
hull()
    {
        //first slice
rotate(t*360/numTheta, [0, 0, 1])
translate([ringDiameter/2, 0, 0])
rotate(-360/numTheta*periods*amplitude*cos(t*360/numTheta*periods-k*360/periods), 
[0, 0, 1])
translate([0, 0, amplitude*cos(t*360/numTheta*periods-k*360/periods)])
rotate(90-360/numTheta*periods*amplitude*sin(t*360/numTheta*periods-k*360/periods), 
[1, 0, 0])
translate([amplitude*sin(t*360/numTheta*periods-k*360/periods), 0, 0])
cylinder(d=minDetail, h = 0.5, center = true);

        //second slice
rotate((t+1)*360/numTheta, [0, 0, 1])
translate([ringDiameter/2, 0, 0])
rotate(-360/numTheta*periods*amplitude*cos((t+1)*360/numTheta*periods-k*360/periods), 
[0, 0, 1])
translate([0, 0, amplitude*cos((t+1)*360/numTheta*periods-k*360/periods)])
rotate(90-360/numTheta*periods*amplitude*sin((t+1)*360/numTheta*periods-k*360/periods), 
[1, 0, 0])
translate([amplitude*sin((t+1)*360/numTheta*periods-k*360/periods), 0, 0])
cylinder(d=minDetail, h = 0.5, center = true);
    }
}