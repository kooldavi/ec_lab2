//This script only works from a maximum range of -300 to +300 for beta
//If you want it to work for every range, you have to add a counter, which 
//counts how often the motor rotated completely, to modify the if..then..else 
//parts...

function [y]=test(u)
//Constant
d = 105e-3;
h = 19e-3;
a2 = 118.72e-3;
a1 = 18e-3;
b2 = 36.22e-3;
hk = 17e-3;
lk = 117.5e-3;

//set range of beta
//range starts at -beta_range and ends at beta_range
//beta_range = 300; 
//beta = -beta_range*%pi/180:%pi/100:beta_range*%pi/180;

//calculate constant angles and values
b1 = sqrt(d^2+h^2);
gamma = atan(h/d);
delta = atan(hk/lk);

//(ceil uses upper gauß bracket)
//initialize alpha matrix with zeros

    if(u<(-gamma))    
        if(u < (-gamma-%pi))
            gamma1 = %pi-gamma-u;
            c1 = sqrt(a1^2+b1^2-2*a1*b1*cos(gamma1));
            alpha1 = acos((c1^2+b1^2-a1^2) / (2*c1*b1));
        else
            gamma1 = %pi+gamma+u;
            c1 = sqrt(a1^2+b1^2-2*a1*b1*cos(gamma1));
            alpha1 = -acos((c1^2+b1^2-a1^2)/(2*c1*b1));
        end
    else
        if(u < (-gamma+%pi))
            gamma1 = %pi-gamma-u;
            c1 = sqrt(a1^2+b1^2-2*a1*b1*cos(gamma1));
            alpha1 = acos((c1^2+b1^2-a1^2)/(2*c1*b1));
        else
            gamma1 = %pi+gamma+u;
            c1 = sqrt(a1^2+b1^2-2*a1*b1*cos(gamma1));
            alpha1 = -acos((c1^2+b1^2-a1^2)/(2*c1*b1));
        end
    end
    beta2 = acos((a2^2+c1^2-b2^2)/(2*a2*c1));
    alpha = alpha1+beta2-delta-gamma;
    y = alpha;
    
        
endfunction
