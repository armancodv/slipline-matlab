function nu = prandtl_meyer(m,gamma)
    nu=(sqrt((gamma+1)/(gamma-1))*atan(sqrt((gamma-1)*(m^2-1)/(gamma+1)))-atan(sqrt(m^2-1)))*180/pi;
end