% Projetando um filtro adaptativo
clc; close all; clear all;
fid_write = fopen('WhiteNoiseFiltered.pcm', 'w');   % Abrindo o arquivo na forma de escrita com esse nome, arquivo novo
fileopen = fopen('WhiteNoise.pcm', 'r');            % Abrindo o arquivo para ler com esse nome, arquivo ja existente
x = fread(fileopen, 'short');                       % Atribuindo os valores do arquivo para x
fclose(fileopen);

Mi = 0.000000000005;                                % Definindo o u da equacao

N = 10;
maxN = N;

iteracoes = length(x);

coef = zeros(N,1);
y = zeros(maxN,1);
xLinha = zeros(maxN,1);
eSaida = zeros(iteracoes,1);
ySaida = zeros(iteracoes,1);
wSaida = zeros(iteracoes,N);

sistemaDesconhecido = [0.5; 0.3; -0.5; 0.8];
nSistemaDesconhecido = length(sistemaDesconhecido);

for a = 1:iteracoes
   xNovo = x(a,1);
   
   xLinha(1,1) = xNovo;
   
   y = 0;
   for b = 1:N
       y = y + xLinha(b,1) * coef(b,1);
   end
   ySaida(a) = y;
   
   dNovo = 0;
   for b = 1:nSistemaDesconhecido
       dNovo = dNovo + xLinha(b,1) * sistemaDesconhecido(b,1);
   end
   
   erro = dNovo - y;
   
   eSaida(a) = erro;
   
   for b = 1:N
       coef(b,1) = coef(b,1) + Mi * erro * xLinha(b,1);
   end
   
   wSaida(a,:) = coef;
   
   for b = N: -1 : 2
       xLinha(b,1) = xLinha(b-1,1);
   end
end

figure(1);
plot(eSaida);
grid on;
title('Error');
hold on;

figure(2);
plot(wSaida);
grid on;
title('W');
   
fwrite(fid_write,eSaida,'short');                        % Escrevendo no arquivo de saida
fclose('all');

%TAM = 161;
%CoefMM = zeros(TAM,1);
%size(CoefMM)
%fileopen2 = fopen('CoeficientesFiltroPassaBaixa800.csv', 'r');
%CoefMM = fread(fileopen2);


%xn = zeros(TAM, 1);
%for i = 1 : TAM
%    xn(i) = x(i);
%end

% w = zeros(TAM,1);                                                %[0.8, 0.3, -0.5, 0.8];                          % Que coeficientes vem nesse vetor?
% 
% d = zeros(TAM,1);
% y = zeros(TAM,1);
% e = zeros(TAM,1);
% 
% 
% d = VarName1 .* xn;                                   % Fazendo a convolucao do sistema desconhecido com a entrada
% %y = w .* xn;
% %d = conv(transpose(VarName1), xn);
% %y = conv(w, xn);
% 
% for i = 1 : TAM
%     y = conv(w, xn);
%     e(i) = d(i) - y(i);                    % Criando o erro
%     w(i) = w(i) + (2 * Mi * e(i) * xn(i));   % Alterando os valores do filtro 
% end

% plot(e);
% title('Error');
% hold on;
% 
% figure(2);
% plot(w);
% title('W');

% figure(3);
% plot(y);
% title('Y');

%fwrite(fid_write,y,'short');                        % Escrevendo no arquivo de saida
%fclose('all');



