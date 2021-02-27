m=100;
F_ERR_P=zeros(1,m);
F_ERR_Q=zeros(1,m);
F_ERR_R=zeros(1,m);
F_ERR_S=zeros(1,m);
F_ERR_T=zeros(1,m);
F_ERR_TOT=zeros(1,m);
F_ERR_A=zeros(1,m); F_ERR_B=zeros(1,m); F_ERR_C=zeros(1,m);

    run('calculo_errorHamming.m')
    for k=1:m
        %Matrices que guardan los errores de las simulaciones
        F_ERR_P(1,k)=pErr_P;
        F_ERR_Q(1,k)=pErr_Q;
        F_ERR_R(1,k)=pErr_R;
        F_ERR_S(1,k)=pErr_S;
        F_ERR_T(1,k)=pErr_T;
        F_ERR_A(1,k)=pErr_A;
        F_ERR_B(1,k)=pErr_B;
        F_ERR_C(1,k)=pErr_C;
        
        F_ERR_TOT(1,k)=pErr_Tot;
        
        run('calculo_errorHamming.m')
    end
