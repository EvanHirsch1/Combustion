function dNOdt = Help(t,y)
            % y(1) -> F (fuel)
            % y(2) -> Ox (air mixture; Ox = 21% by mol)
            % y(3) -> Pr (products)
            % y(4) -> T (temperature [K])
            % y(5) -> P (pressure [Pa])
            % dFdt(1) -> dF/dt
            % dFdt(2) -> dOx/dt
            % dFdt(3) -> dPr/dt
            % dFdt(4) -> dT/dt
            % dFdt(5) -> dP/dt
 

    % ODE EQs

    dNOdt = zeros(3,1);              % Vector of solutions
        dNOdt(1) =  ((6*10^13)/(t^1/2))*exp(-69090/t)*(y(2)^1/2)*(y(3));
        dNOdt(2) = 0.21*1000/(8314*t);
        dNOdt(3) = 0.79*1000/(8314*t);
end