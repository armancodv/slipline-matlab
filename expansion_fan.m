% a simple function for finding pressure and mach back of expansion fan
function [m2,p2_p1,ro2_ro1,t2_t1,p02_p01,ro02_ro01,t02_t01] = expansion_fan(m1,theta,gamma)
    nu1=prandtl_meyer(m1,gamma);
    nu2=nu1+theta;
    m2=inverse_prandtl_meyer(nu2,gamma);
    [p01_p1,ro01_ro1,t01_t1] = isentropic(m1,gamma);
    [p02_p2,ro02_ro2,t02_t2] = isentropic(m2,gamma);
    p2_p1=p01_p1/p02_p2;
    ro2_ro1=ro01_ro1/ro02_ro2;
    t2_t1=t01_t1/t02_t2;
    p02_p01=1;
    ro02_ro01=1;
    t02_t01=1;
end