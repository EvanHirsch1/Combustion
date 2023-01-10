function dFdt = ConstVol(t,y)
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
 
    A = 6.186E9;                % Pre-exponential factor, A [kmol/m^3-s]
    Ru = 8314;                  % Universal gas constant [J/kg-K]
    AF = 16;                    % Air-fuel ratio [kg/kg]
    MW_F = 29;
    hf_F = 4E7;
    hf_F = hf_F*MW_F;           % Enthalpy of formation of fuel [J/kg]
    Cp_F = 1200;                % Specific heat [J/kg]
    Cp_F = Cp_F*MW_F;           % Specific heat by mass -> specific heat by mol [J/kmol-K]
    P0 = 2.5456E6;              % Initial pressure at TDC [Pa]
    T0 = 753;                   % Initial temperature at TDC [K]     

    dFdt = zeros(5,1);              % Create a vector containing all dFdt equations
        dFdt(1) = -A*exp(-15098/y(4))*(y(1)^0.1)*((0.21*y(2))^1.65);    % Rate of destruction of fuel [mol/m^3-s]
        dFdt(2) = (AF)*dFdt(1);     % Rate of destruction of oxygen [mol/m^3-s]
        dFdt(3) = -(AF+1)*dFdt(1);  % Rate of formation of products [mol/m^3-s]
        dFdt(4) = (-dFdt(1)*hf_F)/((Cp_F-Ru)*(y(5)/(Ru*y(4))));            % Rate of temperature rise [K/s]
        dFdt(5) = (P0/T0)*dFdt(4);  % rate of pressure rise [Pa/s]
end