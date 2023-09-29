addpath('src/'); 

% Recebimento das variáveis
pressaoPedal = -1;
velocidadeCarro = -1;
velocidadeRoda = -1;

while pressaoPedal < 0 || pressaoPedal > 100
    pressaoPedal = input('Pressão no pedal [0-100]: ');
    if pressaoPedal < 0 || pressaoPedal > 100
        disp('Valor fora do intervalo permitido. Por favor, insira um valor entre 0 e 100.');
    end
end

while velocidadeCarro < 0 || velocidadeCarro > 100
    velocidadeCarro = input('Velocidade do carro [0-100]: ');
    if velocidadeCarro < 0 || velocidadeCarro > 100
        disp('Valor fora do intervalo permitido. Por favor, insira um valor entre 0 e 100.');
    end
end

while velocidadeRoda < 0 || velocidadeRoda > 100
    velocidadeRoda = input('Velocidade das rodas [0-100]: ');
    if velocidadeRoda < 0 || velocidadeRoda > 100
        disp('Valor fora do intervalo permitido. Por favor, insira um valor entre 0 e 100.');
    end
end

% Conjunto nebuloso da pressão no pedal de freio:
conjuntoNebulosoPressao = containers.Map({'baixo', 'medio', 'alto'}, {[0, 0, 50], [30, 50, 70], [50, 100, 100]});

% Conjunto nebuloso de velocidades (Carro e Rodas):
conjuntoNebulosoVelocidade = containers.Map({'devagar', 'medio', 'rapido'}, {[0, 0, 60], [20, 50, 80], [40, 100, 100]});

% Pertinências:

pressaoPedalBaixa = pertinencia(pressaoPedal, conjuntoNebulosoPressao('baixo'));
pressaoPedalMedia = pertinencia(pressaoPedal, conjuntoNebulosoPressao('medio'));
pressaoPedalAlta = pertinencia(pressaoPedal, conjuntoNebulosoPressao('alto'));
velocidadeCarroRapida = pertinencia(velocidadeCarro, conjuntoNebulosoVelocidade('rapido'));
velocidadeCarroDevagar = pertinencia(velocidadeCarro, conjuntoNebulosoVelocidade('devagar'));
velocidadeRodaRapida = pertinencia(velocidadeRoda, conjuntoNebulosoVelocidade('rapido'));

mostrarPertinencias(pressaoPedal, velocidadeCarro, velocidadeRoda);

% Inferência Fuzzy:

InferenciaFuzzy = InferenciaFuzzyComRegras(pressaoPedalBaixa, pressaoPedalMedia, pressaoPedalAlta, velocidadeCarroRapida, velocidadeRodaRapida, velocidadeCarroDevagar);

%Defuzzificação:

encontrarCentroide(InferenciaFuzzy(1), InferenciaFuzzy(2));













