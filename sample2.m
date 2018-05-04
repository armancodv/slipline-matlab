clc;
clear all;

gamma=1.4;
theta3=15;
theta2=0;
m1=2.4;
p1=101.3;
m2=1.6;
p2=101.3;

phi_max=30; % guess a range for slip line angle
for i=1:1000
    phi(i)=-phi_max+phi_max*(i-1)/500; % phi elements
    if(theta3+phi(i)>0)
        [m3(i),beta3(i),p3_p1(i),ro3_ro1(i),t3_t1(i),p03_p01(i),ro03_ro01(i),t03_t01(i)] = oblique_shock(m1,theta3+phi(i),gamma,0);
    else
        [m3(i),p3_p1(i),ro3_ro1(i),t3_t1(i),p03_p01(i),ro03_ro01(i),t03_t01(i)] = expansion_fan(m1,-theta3-phi(i),gamma);
    end
    if(theta2-phi(i)>0)
        [m4(i),beta4(i),p4_p2(i),ro4_ro2(i),t4_t2(i),p04_p02(i),ro04_ro02(i),t04_t02(i)] = oblique_shock(m2,theta2-phi(i),gamma,0);
    else
        [m4(i),p4_p2(i),ro4_ro2(i),t4_t2(i),p04_p02(i),ro04_ro02(i),t04_t02(i)] = expansion_fan(m2,-theta2+phi(i),gamma);
    end
    p3(i)=p3_p1(i)*p1;
    p4(i)=p4_p2(i)*p2;
    delta_p(i)=abs(p4(i)-p3(i)); % calculate pressure diffrence
end
    
% figure 1: plot pressure diffrence against phi (angle of slip line to horizon)
figure(1);
plot(phi,delta_p),xlabel('Phi'),ylabel('delta P');
title('Delta P');
grid on;

% figure 2: plot back pressures against phi (angle of slip line to horizon)
figure(2);
plot(phi,p3),xlabel('Phi'),ylabel('P'),hold on;
plot(phi,p4);
title('Back Pressure');
grid on;
legend('P3','P4',2);
    
% figure 3: plot maches against phi (angle of slip line to horizon)
figure(3);
plot(phi,m3),xlabel('Phi'),ylabel('M'),hold on;
plot(phi,m4);
title('Mach');
grid on;
legend('M3','M4',2);