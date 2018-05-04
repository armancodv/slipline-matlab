% a simple function for finding pressure and mach back of oblique shock
function [m2,beta,p2_p1,ro2_ro1,t2_t1,p02_p01,ro02_ro01,t02_t01] = oblique_shock(m1,theta,gamma,strong)
    if(strong==1)
        beta=beta_strong(m1,theta,gamma);
    else
        beta=beta_weak(m1,theta,gamma);
    end
    mn1=m1*sin(beta*pi/180);
    [p01_p1,ro01_ro1,t01_t1] = isentropic(m1,gamma);
    [mn2,p2_p1,ro2_ro1,t2_t1] = normal_shock(mn1,gamma);
    m2=mn2/sin((beta-theta)*pi/180);
    [p02_p2,ro02_ro2,t02_t2] = isentropic(m2,gamma);
    p02_p01=(p02_p2/p01_p1)*(p2_p1);
    ro02_ro01=(ro02_ro2/ro01_ro1)*(ro2_ro1);
    t02_t01=(t02_t2/t01_t1)*(t2_t1);
end