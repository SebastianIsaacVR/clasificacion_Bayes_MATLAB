%Agrega una columna de IDS a la matriz
function [matriz] = AgregarIDS(data)
  for r=1:10
    matriz(r,1)=r; 
  endfor
  
  for i= 2:10
    for k= 1:10
      j = i-1;
      matriz(k,i) = data(k,j); 
    endfor
  endfor
end