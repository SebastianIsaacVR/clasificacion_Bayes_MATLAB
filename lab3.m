
%Separación de registros con tumores malignos
  Map_Maligno = Train(:,11)==4;
  Malignos=Train((Map_Maligno), :);
  
%Separación de registros con tumores Benignos
  Map_Benigno = Train(:,11)==2;
  Benignos=Train((Map_Benigno), :);

%Cantidad de Malignos 
  Num_malignos = size(Malignos, 1);

%Cantidad de Benignos
  Num_Benignos = size(Benignos, 1);
  
%cuantos casos necesitamos si queremos tomar el 80% del total de casos malignos
  n = ceil(Num_malignos*.80);
  
%Generamos un array de num aleatorios que servir? como ?ndice para escoger
%las muestras de la matriz de casos Malignos
  Train_M_Idx = randperm(Num_malignos,n);

%Finalmente elegimos los registros de la matriz Malignos tomando como
%referencia los n números de registros aleatorios generados
  Train_M = Malignos(Train_M_Idx, :);

% Generar el set de test. Con este probaremos la efectividad de nuestro clasificador.
% Primero copiamos la matriz de Malignos a  Test_M
  Test_M = Malignos;

% Y eliminamos los registros que ya escogimos para training
  Test_M(Train_M_Idx, :)=[];
%Obtener la probabilidad a priori de 'Malignos' y 'Benignos' en matriz Train               
  prob_M = Probabilidad(Train,11,4);
  prob_B = 1 - prob_M;
%Matriz de conteo   
  matrizConteo_M = MatrizConteo(Malignos);
  matrizConteo_B = MatrizConteo(Benignos);

%Correción en 'Matriz de Conteos' le sumamos 1
  matrizConteo_M_corregida = matrizConteo_M(:,2:10)+1;
  matrizConteo_B_corregida = matrizConteo_B(:,2:10)+1;
%---------Agregar Ids-------------
  matrizConteo_M_corregida_IDS = AgregarIDS(matrizConteo_M_corregida);
  matrizConteo_B_corregida_IDS = AgregarIDS(matrizConteo_B_corregida);

%Cálculo el 'Factor de Normalización' que será la suma de las... 
%...columnas de conteos corregidos. 
  FNM = sum(matrizConteo_M_corregida);
  FNB = sum(matrizConteo_B_corregida);

%Cálcular la 'Matriz Normalizada'
  Norm_M = matrizConteo_M_corregida/FNM(2);
  Norm_B = matrizConteo_B_corregida/FNB(2);

%---------Agregar Ids-------------
  Norm_M_Ids = AgregarIDS(Norm_M);
  Norm_B_Ids = AgregarIDS(Norm_B);

%-----------------------------TEST----------------------------------
%--------Vector Predicción
  [vector_predict,Test_2] = Prediccion2(Test,Norm_M_Ids,Norm_B_Ids,prob_M,prob_B);

%Cantidad de aciertos
  aciertos_generales = sum(Test_2(:,11)==Test_2(:,12));
  aciertos_M = CantidadAciertos(Test_2,4);
  aciertos_B = CantidadAciertos(Test_2,2);
  
%Cantidad desde la matriz Test
  cantidad_M = sum(Test_2(:,11)==4);
  cantidad_B = sum(Test_2(:,11)==2);
%Porcentaje de aciertos
  porcentaje_M =  aciertos_M/cantidad_M;
  porcentaje_B =  aciertos_B/cantidad_B;
  porcentaje_aciertos = aciertos_generales/size(Test_2,1);
%Encontrar los las predicciones erroneas
  vector_errores = PrediccionesErroneas(Test_2);
  true_positive = aciertos_M;
  true_negative = aciertos_B;
  false_positive = sum(vector_errores(:,1)==4);
  false_negative = sum(vector_errores(:,1)==2);
  
  Precision = true_positive/(true_positive+false_positive);
  Recall = true_positive/(true_positive+false_negative);
  Fscore = 2*Precision*Recall/(Precision+Recall);
