% Metodo de eliminacao de Gauss para resolver sistemas lineares Ax=b
% A: Matriz dos coeficientes e b: vetor de constantes

clc
format short

% Calcular a solucao x para cada sistema abaixo.
% Exemplo 1
%A = [3 -1 -1; 1  5  1; 1  1  7];  
%b = [-2; 14; 24];  

% Exemplo 2
A = [1  5  1; 0 -1 -1; 1  1  7];     
b = [14; -2; 24];  

% Exemplo 3
%A = [1  1; 1  -3];  
%b = [ 3; -3];      

% Exemplo 4
%A = [7 4 3 5 8; 0 4 8 5 2; 6 9 9 4 6; 0 9 9 7 0; 9 9 8 0 3];
%b = [84; 62; 97; 73; 66];   

n = size(A,2);      % numero de variaveis do problema
x = zeros(n,1);     % criacao do vetor solucao
     
disp('Resolucao do sistema linear Ax=b');
disp('Matriz A: '); disp(A);
disp('Matriz coluna b de constantes: ');  disp(b);

U = A; bG = b; L = eye(n);

% Realizar a eliminacao de Gauss, operando com as matrizes L, U e bG.
% Para o k-esimo elemento da diagonal da matriz U, de k de 1 ate n-1:
for k=1:n-1
% Para as linhas i desde k+1 ate n:
  for i=k+1:n
%   Calcular L(i,k) = U(i,k)/U(k,k);
    L(i,k) = U(i,k)/U(k,k); 
%   Fazer U(i,k) = 0;
    U(i,k) = 0;
%   Para j da coluna k+1 ate a coluna n:
    for j=k+1:n
%     Fazer U(i,j) = U(i,j) - L(i,k)*U(k,j)
      U(i,j) = U(i,j) - L(i,k)*U(k,j);
    end
%   Fazer bG(i) = bG(i) - L(i,k)*bG(k);
    bG(i) = bG(i) - L(i,k)*bG(k);
  end
end

% Solucionar o sistema triangular resultante, encontrando a solucao x.
% Para a linha i de n ate 1, em ordem decrescente:
for i = n:-1:1
% Fazer o acumulador S = 0;
  S = 0;
% Para a coluna j de i+1 ate n:
  for j = i+1:n
%   Fazer S = S + U(i,j)*x(j);
    S = S + U(i,j)*x(j);
  end
% Fazer x(i) = (bG(i) - S)/U(i,i)
  x(i) = (bG(i) - S)/U(i,i);
end
% Impressao dos resultados 
disp('-----------------------------');
disp('Matriz U triang. sup. do metodo de eliminacao de Gauss: '); disp(U);
disp('Matriz coluna de constantes modificadas: '); disp(bG);
disp('Matriz L:'); disp(L);
disp('Solucao x encontrada: '); disp(x);































