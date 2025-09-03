As operações entre matrizes se dividem entre estrutural (elemento a elemento) e matricial (forma normal de operações em matrizes)

Na estrutural se coloca um ponto na frente, ex: A .* B

Se somar uma matriz com um escalar, o escalar é transformado em uma matriz de mesmas dimensões preenchida com o escalar

<pre>
    A = [1 2; 3 4]
    B = [5 7; 6 3]

    A*B = [17 13; 39 33]
    A.*B = [5 14; 18 12]

    A/B = [0.333 -0.111; 0.556 0.037]
    A./B = [0.200 0.286; 0.500 1.333]
</pre>

a Divisão matricial  (direta ou indireta) pode ser escrita como um vezes a inversa da outra. Ex: A/B = A*inv(B) e A\B = inv(A)*B

fprintf('A area do circulo de raio %4.1f vale %6.2f', raio, pi*raio^2);
igual no C.

max([1 2 10 13 3]) retorna 13 pq é o maximo
