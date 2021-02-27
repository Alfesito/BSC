run('datos_Hamming.m')

subplot(3,3,1)
    histogram(F_ERR_P)
    title('Prob. de error de corrección de P');
    xlabel('Frecuencia');
    ylabel('Frecuencia absoluta');
    fprintf('La media de el error de P es %f\n',mean(F_ERR_P));
subplot(3,3,2)
    histogram(F_ERR_Q)
    title('Prob. de error de corrección de Q');
    xlabel('Frecuencia');
    ylabel('F. absoluta');
    fprintf('La media de el error de Q es %f\n',mean(F_ERR_Q));
subplot(3,3,3)
    histogram(F_ERR_R)
    title('Prob. de error de corrección de R');
    xlabel('Frecuencia');
    ylabel('F. absoluta');
    fprintf('La media de el error de R es %f\n',mean(F_ERR_R));
subplot(3,3,4)
    histogram(F_ERR_S)
    title('Prob. de error de corrección de S');
    xlabel('Frecuencia');
    ylabel('F. absoluta');
    fprintf('La media de el error de S es %f\n',mean(F_ERR_S));
subplot(3,3,5)
    histogram(F_ERR_T)
    title('Prob. de error de corrección de T');
    xlabel('Frecuencia');
    ylabel('F. absoluta');
    fprintf('La media de el error de T es %f\n',mean(F_ERR_T));
subplot(3,3,6)
    histogram(F_ERR_A)
    title('Prob. de error de corrección de A');
    xlabel('Frecuencia');
    ylabel('F. absoluta');
    fprintf('La media de el error de A es %f\n',mean(F_ERR_A));
subplot(3,3,7)
    histogram(F_ERR_B)
    title('Prob. de error de corrección de B');
    xlabel('Frecuencia');
    ylabel('F. absoluta');
    fprintf('La media de el error de B es %f\n',mean(F_ERR_B));
subplot(3,3,8)
    histogram(F_ERR_C)
    title('Prob. de error de corrección de C');
    xlabel('Frecuencia');
    ylabel('F. absoluta');
    fprintf('La media de el error de C es %f\n',mean(F_ERR_C));
subplot(3,3,9)
    histogram(F_ERR_TOT)
    title('Prob. de error de corrección total');
    xlabel('Frecuencia');
    ylabel('F. absoluta');
    fprintf('La media de el error de corrección total es %f\n',mean(F_ERR_TOT));