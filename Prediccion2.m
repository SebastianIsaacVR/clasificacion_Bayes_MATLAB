function [vector_predict,test2] = Prediccion2(matriz,Norm_M,Norm_B,prioriM,prioriB)
  
  cant_reg = size(matriz,1);
  priori_M = prioriM;
  priori_B = prioriB;
  test2 = matriz; 
  
  for i=1:cant_reg;
    registro = matriz(i,2:10);
    prob_M = prioriM;
    prob_B = prioriB;
    
    for c=1:size(registro,2);
      j=c+1;
      renglon = registro(c);
      valor_M=Norm_M(renglon,j);
      valor_B=Norm_B(renglon,j);
      prob_M = prob_M * valor_M;
      prob_B = prob_B * valor_B;
  
    endfor
    
    if prob_M > prob_B
      vector_predict(i,1)=4;
      test2(i,12)=4;
    else
      vector_predict(i,1)=2;
      test2(i,12)=2;
    endif
  
  endfor 
endfunction