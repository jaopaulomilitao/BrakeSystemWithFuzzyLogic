% Retorna os limites da pertinência entre 'liberar' e 'aplicar' o freio 
function inferencias = InferenciaFuzzyComRegras(pressaoFreioBaixa, pressaoFreioMedia, pressaoFreioAlta, velocidadeCarroAlta, velocidadeRodaAlta, velocidadeCarroBaixa)
    pertinenciaFreioAplicar = regra01(pressaoFreioMedia) + regra02(pressaoFreioAlta, velocidadeCarroAlta, velocidadeRodaAlta);
    pertinenciaFreioLiberar = regra03(pressaoFreioAlta, velocidadeCarroBaixa, velocidadeRodaAlta) + regra04(pressaoFreioBaixa);

    inferencias = [pertinenciaFreioLiberar, pertinenciaFreioAplicar];
end

% Quanto aplicar o freio:
function Regra01 = regra01(pressaoFreioMedia)
        Regra01 = pressaoFreioMedia;
end

function Regra02 = regra02(pressaoFreioAlta, velocidadeCarroAlta, velocidadeRodaAlta)
        Regra02 = min([pressaoFreioAlta, velocidadeCarroAlta, velocidadeRodaAlta]);
end

% Quanto liberar o freio:
function Regra03 = regra03(pressaoFreioAlta, velocidadeCarroBaixa, velocidadeRodaAlta)
        Regra03 = min([pressaoFreioAlta, velocidadeCarroBaixa, velocidadeRodaAlta]);
end

function Regra04 = regra04(pressaoFreioBaixa)
        Regra04 = pressaoFreioBaixa;
end
