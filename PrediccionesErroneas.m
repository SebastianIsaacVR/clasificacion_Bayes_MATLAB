function [errores]= PrediccionesErrooneas(matriz)
  
  cant_regstros = size(matriz,1);
  contador = 1;
  for i=1:cant_regstros;
    
    if matriz(i,11) ~= matriz(i,12);
      errores(contador,1) = matriz(i,12);
      contador = contador + 1;
    endif
 
  endfor

end