%Función para obtener la 'Matriz de conteo'
function [matriz] = MatrizConteo(data)
   for r=1:10
     matriz(r,1)=r;
   endfor
   
   for i=2:10
     for k = 1:10
       vectorMap = (data(:,i)==k);
       frecuencia=sum(vectorMap);
       matriz(k,i) = frecuencia;
     endfor
   endfor
end
   





  
