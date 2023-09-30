% Esta função calcula a pertinência de um valor a um conjunto fuzzy triangular
% Entradas:
% - value: O valor para o qual a pertinência será calculada.
% - trim: Um vetor contendo os três pontos que definem o conjunto triangular.
% Saídas:
% - Pertinencia: O grau de pertinência do valor ao conjunto triangular.

function Pertinencia = pertinencia(value, trim)
    
    % Verifica se os pontos de definição do conjunto são únicos
    if numel(trim) == numel(unique(trim))
            if value < trim(1)
                % Valor é menor que o primeiro ponto, não pertence ao conjunto
                Pertinencia = 0;
            
            elseif value >= trim(1) && value <= trim(2)
                % Valor está dentro do triângulo, calcula a pertinência com base na inclinação à esquerda
                Pertinencia = (value - trim(1)) / (trim(2) - trim(1));
            
            elseif value >= trim(2) && value <= trim(3)
                % Valor está dentro do triângulo, calcula a pertinência com base na inclinação à direita
                Pertinencia = (trim(3) - value) / (trim(3) - trim(2));
            
            else
                % Valor não pertence ao conjunto
                Pertinencia = 0;
            end
    
    % Caso contrário, verifica os outros casos
    elseif trim(1) == trim(2)
        % Se o primeiro e o segundo ponto são iguais, o conjunto é um trapezoidal à direita
        if value < trim(3)
            % Calcula a pertinência com base na inclinação à direita
            Pertinencia = (trim(3) - value) / (trim(3) - trim(2));
        else
            % Valor não pertence ao conjunto
            Pertinencia = 0;
        end
    
    elseif trim(2) == trim(3)
        % Se o segundo e o terceiro ponto são iguais, o conjunto é um trapezoidal à esquerda
        if value >= trim(1)
            % Calcula a pertinência com base na inclinação à esquerda
            Pertinencia = (value - trim(1)) / (trim(2) - trim(1));
        else
            % Valor não pertence ao conjunto
            Pertinencia = 0;
        end 
    end
end

