% La sig función es la de probabilidad 
  function [ prob] = Probabilidad( Matrix_Casos, Columna, valor_col )
      num=size(Matrix_Casos, 1);
      Mapa = Matrix_Casos(:, Columna)== valor_col;
      num_criterio=sum(Mapa);
      prob=num_criterio/num;
  end
  