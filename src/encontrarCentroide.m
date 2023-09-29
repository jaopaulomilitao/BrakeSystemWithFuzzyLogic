function centroide = encontrarCentroide(Pa, Pl)
    % Definição das formas das funções de Liberar e Aplicar
    
    verticesTrianguloLiberar = [
        0, 0;
        0, 1;
        100, 0;
    ];
    
    TrianguloLiberar = polyshape(verticesTrianguloLiberar);


    verticesTrianguloAplicar = [
        0, 0;
        100, 1;
        100, 0;
    ];
    
    TrianguloAplicar = polyshape(verticesTrianguloAplicar);

    % Definição das formas dos retangulos abaixo dos pontos fornecidos

    verticesPl = [
        0, 0;
        0, Pl;
        100, Pl;
        100, 0;
    ];
    
    RetanguloPa = polyshape(verticesPl);
    
    verticesPa = [
        0, 0;
        0, Pa;
        100, Pa;
        100, 0;
    ];
    
    RetanguloPl = polyshape(verticesPa);

    
% Realiza a interseção dos polyshapes RetanguloPa e TrianguloAplicar
ResultadoIntersecao1 = intersect(RetanguloPa, TrianguloAplicar);

% Realiza a interseção dos polyshapes RetanguloPl e TrianguloLiberar
ResultadoIntersecao2 = intersect(RetanguloPl, TrianguloLiberar);

% Realiza o union dos resultados das interseções
ResultadoFinal = union(ResultadoIntersecao1, ResultadoIntersecao2);

[x,y] = centroid(ResultadoFinal);

% Plota o polyshape resultante
figure;
plot(ResultadoFinal, 'FaceColor', [0, 0, 0, 0.3], 'EdgeColor', 'none');
hold on

    % Plot das linhas tracejadas em Pa e Pl
    plot([0, 100], [Pa, Pa], '--b'); % Linha tracejada em Pa
    plot([0, 100], [Pl, Pl], '--r'); % Linha tracejada em Pl
    plot([0, 100], [0, 1], 'r', 'LineWidth', 1, 'LineStyle', '-', 'Color', [1 0 0 0.4]); % Linha tracejada em Pa
    plot([0, 100], [1, 0], 'r', 'LineWidth', 1, 'LineStyle', '-', 'Color', [0 0 1 0.4]); % Linha tracejada em Pa

    % Plot da linha vertical no centroide
    plot([x, x], [0, y], 'r', 'LineWidth', 1, 'LineStyle', '--', 'Color', [0 0 0 0.5]); % Linha vertical com opacidade baixa

    % Plot do ponto do centroide como um círculo
    scatter(x, y, 100, 'r', 'filled', 'o')

hold off
title('Desnebulização das inferências');
% Defina os limites do eixo x e y
xlim([0 100])
ylim([0 1])

% Adicione rótulos aos eixos
xlabel('Pressão do freio')
ylabel('Aplicação do freio')

msg = sprintf('Valor da centroide (Quantidade de freio): %f', x);

disp(msg);

end