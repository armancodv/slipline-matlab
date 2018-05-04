% SLIP LINE ANGLE FINDER
% developed by: Arman Kolahan
% this file calculates back pressure of reflect of two oblique shocks
clc;
clear all;

gamma=1.4;
m=1.95;
theta2=10; % oblique shock
theta3=-10; % minus means expansion fan

if(theta2>0)
    [m2,beta2,p2_p1,ro2_ro1,t2_t1,p02_p01,ro02_ro01,t02_t01] = oblique_shock(m,theta2,gamma,0); % find pressure and mach back of first oblique shock
else
    [m2,p2_p1,ro2_ro1,t2_t1,p02_p01,ro02_ro01,t02_t01] = expansion_fan(m,-theta2,gamma);
end
if(theta3>0)
    [m3,beta3,p3_p1,ro3_ro1,t3_t1,p03_p01,ro03_ro01,t03_t01] = oblique_shock(m,theta3,gamma,0); % find pressure and mach back of second oblique shock
else
    [m3,p3_p1,ro3_ro1,t3_t1,p03_p01,ro03_ro01,t03_t01] = expansion_fan(m,-theta3,gamma);
end
phi_max=45-max(theta2,theta3); % guess a range for slip line angle
for i=1:1000
    phi(i)=-phi_max+phi_max*(i-1)/500; % phi elements
    if(theta3+phi(i)>0)
        [m4(i),beta4(i),p4_p3(i),ro4_ro3(i),t4_t3(i),p04_p03(i),ro04_ro03(i),t04_t03(i)] = oblique_shock(m3,theta3+phi(i),gamma,0); % find pressure and mach back of first oblique shock reflect
    else
        [m4(i),p4_p3(i),ro4_ro3(i),t4_t3(i),p04_p03(i),ro04_ro03(i),t04_t03(i)] = expansion_fan(m3,-theta3-phi(i),gamma);
    end
    if(theta2-phi(i)>0)
        [m4p(i),beta4p(i),p4p_p2(i),ro4p_ro2(i),t4p_t2(i),p04p_p02(i),ro04p_ro02(i),t04p_t02(i)] = oblique_shock(m2,theta2-phi(i),gamma,0); % find pressure and mach back of second oblique shock reflect
    else
        [m4p(i),p4p_p2(i),ro4p_ro2(i),t4p_t2(i),p04p_p02(i),ro04p_ro02(i),t04p_t02(i)] = expansion_fan(m2,-theta2+phi(i),gamma);
    end
    p4(i)=p4_p3(i)*p3_p1;
    p4p(i)=p4p_p2(i)*p2_p1;
    delta_p(i)=abs(p4(i)-p4p(i)); % calculate pressure diffrence
end
    
% figure 1: plot pressure diffrence against phi (angle of slip line to horizon)
figure(1);
plot(phi,delta_p),xlabel('Phi'),ylabel('delta P');
title('Delta P');
grid on;

% figure 2: plot back pressures against phi (angle of slip line to horizon)
figure(2);
plot(phi,p4),xlabel('Phi'),ylabel('P'),hold on;
plot(phi,p4p);
title('Back Pressure');
grid on;
legend('P4','P4p',2);
    
% figure 3: plot maches against phi (angle of slip line to horizon)
figure(3);
plot(phi,m4),xlabel('Phi'),ylabel('M'),hold on;
plot(phi,m4p);
title('Mach');
grid on;
legend('M4','M4p',2);