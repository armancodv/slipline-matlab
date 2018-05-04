% explicit solution for finding beta (oblique shock)
function beta = beta_strong(m,theta,gamma)
    theta=theta*pi/180;
    lambda=sqrt((m^2-1)^2-3*(1+(gamma-1)*m^2/2)*(1+(gamma+1)*m^2/2)*tan(theta)^2);
    x=((m^2-1)^3-9*(1+(gamma-1)*m^2/2)*(1+(gamma-1)*m^2/2+(gamma+1)*m^4/4)*tan(theta)^2)/(lambda^3);
    beta=real(atan((m^2-1+2*lambda*cos((acos(x))/3))/(3*(1+(gamma-1)*m^2/2)*tan(theta)))*180/pi);
end