% Metodo de eliminacao de Gauss para resolver sistemas lineares Ax=b
% A: Matriz dos coeficientes e b: vetor de constantes

clc
format short

% Calcular a solução x para cada sistema abaixo.
% Exemplo 1
%A = [3 -1 -1; 1  5  1; 1  1  7];  
%b = [-2; 14; 24];  

% Exemplo 2
%A = [1  5  1; 0 -1 -1; 1  1  7];     
%b = [14; -2; 24];  

% Exemplo 3
%A = [1  1; 1  -3];  
%b = [ 3; -3];      

% Exemplo 4
A = [7 4 3 5 8; 0 4 8 5 2; 6 9 9 4 6; 0 9 9 7 0; 9 9 8 0 3];
b = [84; 62; 97; 73; 66];   

n = size(A,2);      % numero de variaveis do problema
x = zeros(n,1);     % criacao do vetor solucao
     
disp('Resolucao do sistema linear Ax=b');
disp('Matriz A: '); disp(A);
disp('Matriz coluna b de constantes: ');  disp(b);

U = A; bG = b; L = eye(n);

for k=1:(n-1)
 for i=(k+1):n
  L(i,k) = U(i,k)/U(k,k);
  U(i,k) = 0;
  for j=(k+1):n
   U(i,j) = U(i,j) - L(i,k)*U(k,j);
  end;
  bG(i) = bG(i) - L(i,k)*bG(k);
 end;
end;

for i=n:-1:1
 s = 0;
 for j = (i+1):n
  s = s + U(i,j)*x(j); 
 end;
 x(i) =  (bG(i) - s)/U(i,i);
end;

disp('-----------------------------');
disp('Matriz U triang. sup. do metodo de eliminacao de Gauss: '); disp(U);
disp('Matriz coluna de constantes modificadas: '); disp(bG);
disp('Matriz L:'); disp(L);
disp('Solucao x encontrada: '); disp(x);


























