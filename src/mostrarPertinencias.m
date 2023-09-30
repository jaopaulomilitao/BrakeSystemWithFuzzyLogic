function mostrarPertinencias(pressaoPedal, velocidadeCarro, velocidadeRoda)
    % Definir os conjuntos nebulosos para a pressão
    xb = [0, 50];
    yb = [1, 0];

    xm = [30, 50, 70];
    ym = [0, 1, 0];

    xa = [50, 100];
    ya = [0, 1];

    % Definir os conjuntos nebulosos para a pressão
    xd = [0, 60];
    yd = [1, 0];

    xmv = [20, 50, 80];
    ymv = [0, 1, 0];

    xr = [40, 100];
    yr = [0, 1];

    % Criar uma nova figura com subplots
    figure('Position', [100, 100, 1300, 400]); % Largura = 1200 pixels, altura = 400 pixels

    % Subplot 1xa, primeiro gráfico
    subplot(1, 3, 1);
    hold on;

    plot(xb, yb, 'r', 'LineWidth', 2);
    plot(xm, ym, 'g', 'LineWidth', 2);
    plot(xa, ya, 'b', 'LineWidth', 2);

    % Adicionar linha vertical para pressaoPedal
    xline(pressaoPedal, 'k--', 'PressaoPedal = 80');

    % Encontrar ponto de interseção entre a linha vertical e os gráficos
    intersectionY_b = interp1(xb, yb, pressaoPedal);
    scatter(pressaoPedal, intersectionY_b, 50, 'ko', 'filled');

    intersectionY_m = interp1(xm, ym, pressaoPedal);
    scatter(pressaoPedal, intersectionY_m, 50, 'go', 'filled');

    intersectionY_a = interp1(xa, ya, pressaoPedal);
    scatter(pressaoPedal, intersectionY_a, 50, 'bo', 'filled');

    % Adicionar linhas horizontais com baixa opacidade em todas as interseções
    plot([0, pressaoPedal], [intersectionY_b, intersectionY_b], 'k--', 'LineWidth', 1, 'Color', [0, 0, 0, 0.3]);
    plot([pressaoPedal, pressaoPedal], [0, intersectionY_b], 'k--', 'LineWidth', 1, 'Color', [0, 0, 0, 0.3]);

    plot([0, pressaoPedal], [intersectionY_m, intersectionY_m], 'k--', 'LineWidth', 1, 'Color', [0, 0, 0, 0.3]);
    plot([pressaoPedal, pressaoPedal], [0, intersectionY_m], 'k--', 'LineWidth', 1, 'Color', [0, 0, 0, 0.3]);

    plot([0, pressaoPedal], [intersectionY_a, intersectionY_a], 'k--', 'LineWidth', 1, 'Color', [0, 0, 0, 0.3]);
    plot([pressaoPedal, pressaoPedal], [0, intersectionY_a], 'k--', 'LineWidth', 1, 'Color', [0, 0, 0, 0.3]);

    xlabel('Pressão do freio');
    title('Pertinência da pressão');
    xlim([0 100]);
    ylim([0 1]);
    legend('Baixo', 'Medio', 'Alto');

    hold off;

    % Subplot 1xa, segundo gráfico
    subplot(1, 3, 2);
    hold on;

    plot(xd, yd, 'r', 'LineWidth', 2);
    plot(xmv, ymv, 'g', 'LineWidth', 2);
    plot(xr, yr, 'b', 'LineWidth', 2);

    % Adicionar linha vertical para velocidadeRoda
    xline(velocidadeRoda, 'k--', 'VelocidadeRoda = 60');

    % Encontrar ponto de interseção entre a linha vertical e os gráficos
    intersectionY_d = interp1(xd, yd, velocidadeRoda);
    scatter(velocidadeRoda, intersectionY_d, 50, 'ko', 'filled');

    intersectionY_mv = interp1(xmv, ymv, velocidadeRoda);
    scatter(velocidadeRoda, intersectionY_mv, 50, 'go', 'filled');

    intersectionY_r = interp1(xr, yr, velocidadeRoda);
    scatter(velocidadeRoda, intersectionY_r, 50, 'bo', 'filled');

    % Adicionar linhas horizontais com baixa opacidade em todas as interseções
    plot([0, velocidadeRoda], [intersectionY_d, intersectionY_d], 'k--', 'LineWidth', 1, 'Color', [0, 0, 0, 0.3]);
    plot([velocidadeRoda, velocidadeRoda], [0, intersectionY_d], 'k--', 'LineWidth', 1, 'Color', [0, 0, 0, 0.3]);

    plot([0, velocidadeRoda], [intersectionY_mv, intersectionY_mv], 'k--', 'LineWidth', 1, 'Color', [0, 0, 0, 0.3]);
    plot([velocidadeRoda, velocidadeRoda], [0, intersectionY_mv], 'k--', 'LineWidth', 1, 'Color', [0, 0, 0, 0.3]);

    plot([0, velocidadeRoda], [intersectionY_r, intersectionY_r], 'k--', 'LineWidth', 1, 'Color', [0, 0, 0, 0.3]);
    plot([velocidadeRoda, velocidadeRoda], [0, intersectionY_r], 'k--', 'LineWidth', 1, 'Color', [0, 0, 0, 0.3]);

    xlabel('Velocidade');
    title('Pertinência da velocidade da roda');
    xlim([0 100]);
    ylim([0 1]);
    legend('Baixo', 'Medio', 'Alto');

    hold off;

    % Subplot 1xa, terceiro gráfico
    subplot(1, 3, 3);
    hold on;

    plot(xd, yd, 'r', 'LineWidth', 2);
    plot(xmv, ymv, 'g', 'LineWidth', 2);
    plot(xr, yr, 'b', 'LineWidth', 2);

    % Adicionar linha vertical para velocidadeCarro
    xline(velocidadeCarro, 'k--', 'VelocidadeCarro = 55');

    % Encontrar ponto de interseção entre a linha vertical e os gráficos
    intersectionY_d = interp1(xd, yd, velocidadeCarro);
    scatter(velocidadeCarro, intersectionY_d, 50, 'ko', 'filled');

    intersectionY_mv = interp1(xmv, ymv, velocidadeCarro);
    scatter(velocidadeCarro, intersectionY_mv, 50, 'go', 'filled');

    intersectionY_r = interp1(xr, yr, velocidadeCarro);
    scatter(velocidadeCarro, intersectionY_r, 50, 'bo', 'filled');

    % Adicionar linhas horizontais com baixa opacidade em todas as interseções
    plot([0, velocidadeCarro], [intersectionY_d, intersectionY_d], 'k--', 'LineWidth', 1, 'Color', [0, 0, 0, 0.3]);
    plot([velocidadeCarro, velocidadeCarro], [0, intersectionY_d], 'k--', 'LineWidth', 1, 'Color', [0, 0, 0, 0.3]);

    plot([0, velocidadeCarro], [intersectionY_mv, intersectionY_mv], 'k--', 'LineWidth', 1, 'Color', [0, 0, 0, 0.3]);
    plot([velocidadeCarro, velocidadeCarro], [0, intersectionY_mv], 'k--', 'LineWidth', 1, 'Color', [0, 0, 0, 0.3]);

    plot([0, velocidadeCarro], [intersectionY_r, intersectionY_r], 'k--', 'LineWidth', 1, 'Color', [0, 0, 0, 0.3]);
    plot([velocidadeCarro, velocidadeCarro], [0, intersectionY_r], 'k--', 'LineWidth', 1, 'Color', [0, 0, 0, 0.3]);

    xlabel('Velocidade');
    title('Pertinência da velocidade do carro');
    xlim([0 100]);
    ylim([0 1]);
    legend('Baixo', 'Medio', 'Alto');

    hold off;
end
