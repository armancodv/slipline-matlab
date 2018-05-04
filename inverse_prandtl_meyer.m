function m = inverse_prandtl_meyer(nu,gamma)
    error=10;
    for i=1:1000
        m_temp=1+i/100;
        nu_temp=(sqrt((gamma+1)/(gamma-1))*atan(sqrt((gamma-1)*(m_temp^2-1)/(gamma+1)))-atan(sqrt(m_temp^2-1)))*180/pi;
        if(abs(nu_temp-nu)<error)
            m=m_temp;
            error=abs(nu_temp-nu);
        end
    end
end