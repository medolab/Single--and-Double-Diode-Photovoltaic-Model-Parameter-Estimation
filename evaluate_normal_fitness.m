function f = evaluate_normal_fitness(params, data, modelType)
    % Evaluate fitness for single-diode or double-diode PV model
    % params   : model parameters
    % data     : measured I-V data [V, I]
    % modelType: 1 = single-diode, 2 = double-diode

    V = data(:,1);
    I_measured = data(:,2);

    switch modelType
        case 1
            % Single-diode model parameters
            I_ph = params(1); 
            I_SD = params(2);
            R_s  = params(3);
            R_sh = params(4);
            n    = params(5);

            k = 1.380649e-23;      % Boltzmann constant (J/K)
            q = 1.602176634e-19;   % Electron charge (C)
            T = 298.15;            % Temperature (K)

            I_model = I_ph - I_SD .* (exp((q .* (V + I_measured .* R_s)) ./ (n .* k .* T)) - 1) ...
                      - (V + I_measured .* R_s) ./ R_sh;

        case 2
            % Double-diode model parameters
            I_ph  = params(1);
            I_SD1 = params(2);
            R_s   = params(3);
            R_sh  = params(4);
            n1    = params(5);
            I_SD2 = params(6);
            n2    = params(7);

            k = 1.380649e-23;
            q = 1.602176634e-19;
            T = 298.15;

            I_model = I_ph ...
                - I_SD1 .* (exp((q .* (V + I_measured .* R_s)) ./ (n1 .* k .* T)) - 1) ...
                - I_SD2 .* (exp((q .* (V + I_measured .* R_s)) ./ (n2 .* k .* T)) - 1) ...
                - (V + I_measured .* R_s) ./ R_sh;

        otherwise
            error('Invalid modelType: choose 1 (single) or 2 (double)');
    end

    % Fitness: RMSE
    f = sqrt(mean((I_measured - I_model).^2));
end
