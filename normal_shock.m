% find pressure ratio, density ratio, temprature ratio and mach back of shock (normal shock)
function [m2,p2_p1,ro2_ro1,t2_t1] = normal_shock(m,gamma)
    p2_p1=(1+(2*gamma)*(m^2-1)/(gamma+1)); % pressure ratio
    ro2_ro1=(gamma+1)*m^2/(2+(gamma-1)*m^2); % density ratio
    t2_t1=p2_p1/ro2_ro1; % temprature ratio
    m2=sqrt((1+(gamma-1)*m^2/2)/(gamma*m^2-(gamma-1)/2)); % amount of m2
end