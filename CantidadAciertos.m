function [cantidad]= CantidadAciertos(matriz,valor)
  
  cant_regstros = size(matriz,1);
  cantidad=0;
  for i=1:cant_regstros;
    
    if (matriz(i,11) == matriz(i,12) && matriz(i,11) == valor)
      cantidad =  cantidad +1;
    endif
    
  endfor

end