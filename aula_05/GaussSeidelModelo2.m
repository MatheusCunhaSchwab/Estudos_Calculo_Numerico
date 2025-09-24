% Metodo de Gauss-Seidel para resolver sistema linear Ax=b
clc
format short

% Calcular a solução x para cada sistema abaixo.
% Exemplo 1
%A = [3 -1 -1; 1  5  1; 1  1  7];      
%b = [-2; 14; 24];                  

% Exemplo 2
% A = [1  5  1; 0 -1 -1; 1  1  7];     
% b = [14; -2; 24];  

% Exemplo 3
% A = [1  1; 1 -3]; 
% b = [3; -3];                     

% Exemplo 4
% A = [7 4 3 5 8; 0 4 8 5 2; 6 9 9 4 6; 0 9 9 7 0; 9 9 8 0 3];
% b = [84; 62; 97; 73; 66];   



% Exemplo 5
%A = [1 0 0; 0 1 0; 0 0 1];
%b = [1; 2; 3];


n = size(A,2);      % numero de variaveis do problema
x = zeros(n,1);     % solucao inicial (aproximada)

ee = 10^(-8);       % Precisao ou Tolerancia para o teste de parada
MAXITER = 1000;     % Numero maximo de iteracoes
conv = false;       % Variavel que informa se convergiu ou nao


% Realizar a iteracao de Gauss Seidel sobre o vetor x
% Para a iteracao "iter" de 1 at� MAXITER:
for iter = 1:MAXITER
%   Para as linhas i de 1 ate' n:
    for i = 1:n
        acc = 0;
        if(A(i,i) == 0)
            disp("EH 0")
        end
%     Para a coluna j de 1 ate' n:
      for j = 1:n
%       Se a coluna j for diferente de i:  (diferente no Octave: ~=)
        if(j~=i)
%         Acumular produto coeficiente * variavel
          acc = acc + A(i,j) * x(j);
        end
      end
%     Calcular valor da i-esima variavel 
      x(i) = 1/A(i,i) * (b(i) - acc); 
    end
    
%   Se norm(A*x-b,inf) < ee  % Testa se x eh solucao aproximada
    if(norm(A*x-b,inf)) < ee
%     Se sim, fazer conv = true e abandonar iteracoes (usar "break")
        conv = true;
        break
    end
end
% Se "conv" for "verdadeiro" (true)
if(conv)
%   Imprimir "O metodo convergiu !!"
    fprintf("O metodo convergiu !!\n");
%   Imprimir o numero de iteracoes utilizadas (valor de iter)
    fprintf("Iteracoes:%d\n", iter);
%   Imprimir o valor de "x" (solucao aproximada)
    fprintf("Solucao encontrada:\n");
    disp(x)
% Se "conv" for "falso" (false)   
else
%   Imprimir "O metodo nao convergiu !!"
    disp("O metodo nao convergiu !!")
    fprintf("Iteracoes:%d\n", iter);
end
































