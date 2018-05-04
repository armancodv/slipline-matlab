function theta = theta_max(m,gamma)
    betamax=asind(sqrt((1/(gamma*(m^2)))*((((gamma+1)/4)*(m^2))-1+(sqrt((gamma+1)*((1+((gamma-1)/2)*(m^2))+(((gamma+1)/16)*(m^4))))))));
    theta=atand(2*cotd(betamax)*((((m^2)*((sind(betamax))^2))-1)/((m^2)*(gamma+(cosd(2*(betamax))))+2)));
end