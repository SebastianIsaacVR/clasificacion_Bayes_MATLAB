% ***** Genere una función que genere automáticamente un set de training
% y otro de test para una matriz determinada con un x% para training.
  function [ Test, Train ] = GetSets( data, percentage )
      cantidad = size(data,1);
      n = ceil(cantidad*percentage);
      train_idx=randperm(cantidad,n);
      Train = data(train_idx, :)
      Test = data;
      Test(train_idx) =[]     
  end