%%  Este programa calcula o polinomio interpolador na FORMA DE LAGRANGE
%%  Interpola conjunto de pontos (xk,yk), para k = 0,...,n
%%  pn(x) = Sum(k=0,n) yk Lk(x)
%%          (x -x0)(x -x1)...(x -x(k-1))(x -x(k+1))...(x -xn)
%%  Lk(x) = -------------------------------------------------,  k=0,...,n.
%%          (xk-x0)(xk-x1)...(xk-x(k-1))(xk-x(k+1))...(xk-xn)

function InterpolLagrangeModelo
 clc
 format long

 % Exemplo1 - funcao y = 6./t
  % x = [1 2 3];

 % Exemplo2 - funcao y = 12./(t+2)
   % x = [-1 0 1 2];
    x = [-1 0 1 2 10];

 n = length(x) - 1;
 c = zeros(1, n+1); 
 
 for k = 1:(n+1)
  y = f(x);
  aux = 1;
  for j = 1:(n+1)
   if j ~= k
    aux = aux * (x(k) - x(j));
   end
  end
  c(k) = y(k)/aux;
  
  disp('Coeficientes do polinomio de Lagrange:');
  fprintf('c%ld: %1.2f\n', k, c(k));
 end
 fprintf('Impressão do polinômio na forma de LaGrange: \n');
 %for k = 1:(n+1)
  %   for j = 1:(n+1)
   %      if k ~= j
    % fprintf('%+.2f(x-%d)(x-%d)', c(k), x(k), x(j));
     %    end
     %end
% end
%end


    fprintf('p%d(x)=', n);
    for k = 1:(n+1)
      fprintf(" %+.2f",c(k));
      for j = 1:(n+1)
          if k~=j
              fprintf("(x%+.2f)", x(j) * (-1));
          end
      end
    end
end


 % Montar uma funcao para apresentar o polinomio na forma de Lagrange

 

function y = f(t)
  % y = 6./t;             % x=1:3 
   y = 12./(t+2);
end

