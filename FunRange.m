function [Low, Up, Dim] = FunRange(FunIndex)
    % Defines parameter ranges for single- and double-diode PV models

    switch FunIndex
        case 1  % Single-diode model
            Low = [0.0  0.0     0.0  0.0   1.0];
            Up  = [1.0  1.0e-6  0.5  100.0 2.0];
            Dim = 5;

        case 2  % Double-diode model
            Low = [0.0  0.0     0.0  0.0   1.0  0.0     1.0];
            Up  = [1.0  1.0e-6  0.5  100.0 2.0  1.0e-6  2.0];
            Dim = 7;

        otherwise
            Low = 0; Up = 10; Dim = 4;
    end
end
