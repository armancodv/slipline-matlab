% find total to static pressure ratio, density ratio, temprature ratio (isentropic)
function [p0_p,ro0_ro,t0_t] = isentropic(m,gamma)
	p0_p = (m^2*(gamma-1)/2+1)^(gamma/(gamma-1));
	ro0_ro = (m^2*(gamma-1)/2+1)^(1/(gamma-1));
	t0_t = m^2*(gamma-1)/2+1;
end