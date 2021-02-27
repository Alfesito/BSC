run('simulacion_base');

%% Calculo de la frecuencia relativa

nA_P=0; nB_P=0; nC_P=0;
nA_Q=0; nB_Q=0; nC_Q=0;
nA_R=0; nB_R=0; nC_R=0;
nA_S=0; nB_S=0; nC_S=0;
nA_T=0; nB_T=0; nC_T=0;

nA_B=0; nA_C=0; nB_A=0; nB_C=0; nC_A=0; nC_B=0;

nA_Err=0;   nB_Err=0;   nC_Err=0;
for k=1:n
        if (receptorErr(k,1:3)==P)
            nP=nP+1;
                if (transmisor(k,1:3)==A)
                   nA_P=nA_P+1;
                elseif (transmisor(k,1:3)==B)
                   nB_P=nB_P+1;
                elseif (transmisor(k,1:3)==C)
                   nC_P=nC_P+1;
                end
        end
        if (receptorErr(k,1:3)==Q)
           nQ=nQ+1;
           if (transmisor(k,1:3)==A)
               nA_Q=nA_Q+1;
           elseif (transmisor(k,1:3)==B)
               nB_Q=nB_Q+1;
           elseif (transmisor(k,1:3)==C)
               nC_Q=nC_Q+1;
           end
        end
       if (receptorErr(k,1:3)==R)
            nR=nR+1;
                if (transmisor(k,1:3)==A)
                   nA_R=nA_R+1;
                elseif (transmisor(k,1:3)==B)
                   nB_R=nB_R+1;
                elseif (transmisor(k,1:3)==C)
                   nC_R=nC_R+1;
                end
       end
        if (receptorErr(k,1:3)==S)
            nS=nS+1;
                if (transmisor(k,1:3)==A)
                   nA_S=nA_S+1;
                elseif (transmisor(k,1:3)==B)
                   nB_S=nB_S+1;
                elseif (transmisor(k,1:3)==C)
                   nC_S=nC_S+1;
                end
        end
        if (receptorErr(k,1:3)==T)
            nT=nT+1;
                if (transmisor(k,1:3)==A)
                   nA_T=nA_T+1;
                elseif (transmisor(k,1:3)==B)
                   nB_T=nB_T+1;
                elseif (transmisor(k,1:3)==C)
                   nC_T=nC_T+1;
                end
        end
        
       if(receptorErr(k,1:3)==A)
           nA_Err=nA_Err+1;
            if(transmisor(k,1:3)==B)
                nA_B=nA_B+1;
            elseif (transmisor(k,1:3)==C)
                nA_C=nA_C+1;
            end
       end
       if(receptorErr(k,1:3)==B)
           nB_Err=nB_Err+1;
            if(transmisor(k,1:3)==A)
                nB_A=nB_A+1;
            elseif (transmisor(k,1:3)==C)
                nB_C=nB_C+1;
            end
       end
       if(receptorErr(k,1:3)==C)
           nC_Err=nC_Err+1;
            if(transmisor(k,1:3)==A)
                nC_A=nC_A+1;
            elseif (transmisor(k,1:3)==B)
                nC_B=nC_B+1;
            end
       end
end
%% Cálculos

%Frecuencia relativa de P
fP=nP/n;
%Frecuencia relativa de Q
fQ=nQ/n;
%Frecuencia relativa de R
fR=nR/n;
%Frecuencia relativa de S
fS=nS/n;
%Frecuencia relativa de T
fT=nT/n;

%Frecuencia relativa de A, B y C, cuando se recibe P
fA_P=nA_P/nP;   fB_P=nB_P/nP;   fC_P=nC_P/nP;
%Frecuencia relativa de A, B y C, cuando se recibe Q
fA_Q=nA_Q/nQ;   fB_Q=nB_Q/nQ;   fC_Q=nC_Q/nQ;
%Frecuencia relativa de A, B y C, cuando se recibe R
fA_R=nA_R/nR;   fB_R=nB_R/nR;   fC_R=nC_R/nR;
%Frecuencia relativa de A, B y C, cuando se recibe S
fA_S=nA_S/nS;   fB_S=nB_S/nS;   fC_S=nC_S/nS;
%Frecuencia relativa de A, B y C, cuando se recibe T
fA_T=nA_T/nT;   fB_T=nB_T/nT;   fC_T=nC_T/nT;

%Frecuencia relativa de B y C, cuando se recibe A
fA_B=nA_B/nA;   fA_C=nA_C/nA;
%Frecuencia relativa de A y C, cuando se recibe B
fB_A=nB_A/nB;   fB_C=nB_C/nB;
%Frecuencia relativa de A y B, cuando se recibe C
fC_A=nC_A/nC;   fC_B=nC_B/nC;   

%% Aplicamos MAP para reajustar los mensajes y que tengan la mínima prob. de error
m3=rand(n,1);
receptor=receptorErr;
nA_Corr=0; nB_Corr=0; nC_Corr=0;
for k=1:n
    if receptorErr(k,1:3) == P
        if (m3(k,1)<=fA_P)
            receptor(k,1:3)=A;
        elseif (m3(k,1)>fA_P) && (m3(k,1)<=fA_P+fB_P)
            receptor(k,1:3)=B;
        else
            receptor(k,1:3)=C;
        end
    end
    if receptorErr(k,1:3) == Q
        if (m3(k,1)<=fA_Q)
            receptor(k,1:3)=A;
        elseif (m3(k,1)>fA_Q) && (m3(k,1)<=fA_Q+fB_Q)
            receptor(k,1:3)=B;
        else
            receptor(k,1:3)=C;
        end
    end
    if receptorErr(k,1:3) == R
        if (m3(k,1)<=fA_R)
            receptor(k,1:3)=A;
            nA_Corr=nA_Corr+1;
        elseif (m3(k,1)>fA_R) && (m3(k,1)<=fA_R+fB_R)
            receptor(k,1:3)=B;
            nB_Corr=nB_Corr+1;
        else
            receptor(k,1:3)=C;
            nC_Corr=nC_Corr+1;
        end
    end
    if receptorErr(k,1:3) == S
        if (m3(k,1)<=fA_S)
            receptor(k,1:3)=A;
            nA_Corr=nA_Corr+1;
        elseif (m3(k,1)>fA_S) && (m3(k,1)<=fA_S+fB_S)
            receptor(k,1:3)=B;
            nB_Corr=nB_Corr+1;
        else
            receptor(k,1:3)=C;
            nC_Corr=nC_Corr+1;
        end
    end
    if receptorErr(k,1:3) == T
        if (m3(k,1)<=fA_T)
            receptor(k,1:3)=A;
            nA_Corr=nA_Corr+1;
        elseif (m3(k,1)>fA_T) && (m3(k,1)<=fA_T+fB_T)
            receptor(k,1:3)=B;
            nB_Corr=nB_Corr+1;
        else
            receptor(k,1:3)=C;
            nC_Corr=nC_Corr+1;
        end
    end
    
    if receptorErr(k,1:3) == A
        if (m3(k,1)<=fA_B)
            receptor(k,1:3)=B;
            nB_Corr=nB_Corr+1;
        elseif (m3(k,1)>fA_B) && (m3(k,1)<=fA_B+fA_C)
            receptor(k,1:3)=C;
            nC_Corr=nC_Corr+1;
        else
            continue;
        end
    end
    if receptorErr(k,1:3) == B
        if (m3(k,1)<=fB_A)
            receptor(k,1:3)=A;
            nA_Corr=nA_Corr+1;
        elseif (m3(k,1)>fB_A) && (m3(k,1)<=fB_A+fB_C)
            receptor(k,1:3)=C;
            nC_Corr=nC_Corr+1;
        else
            continue;
        end
    end
    if receptorErr(k,1:3) == C
        if (m3(k,1)<=fC_A)
            receptor(k,1:3)=A;
            nA_Corr=nA_Corr+1;
        elseif (m3(k,1)>fC_A) && (m3(k,1)<=fC_A+fA_B)
            receptor(k,1:3)=B;
            nB_Corr=nB_Corr+1;
        else
            continue;
        end
    end
end

%% Calculo de la probabilidad de error de correccion de P,Q,R,S,T:
nErr_P=0; nErr_Q=0; nErr_R=0; nErr_S=0; nErr_T=0;
nErr_A=0; nErr_B=0; nErr_C=0;
for k=1:n
    if receptorErr(k,1:3) == P
            if receptor(k,1:3) == transmisor(k,1:3)
                continue;
            else
                nErr_P = nErr_P+1;
            end
    end
    if receptorErr(k,1:3) == Q
            if receptor(k,1:3) == transmisor(k,1:3)
                continue;
            else
                nErr_Q = nErr_Q+1;
            end
    end
    if receptorErr(k,1:3) == R
            if receptor(k,1:3) == transmisor(k,1:3)
                continue;
            else
                nErr_R = nErr_R+1;
            end
    end
    if receptorErr(k,1:3) == S
            if receptor(k,1:3) == transmisor(k,1:3)
                continue;
            else
                nErr_S = nErr_S+1;
            end
    end
    if receptorErr(k,1:3) == T
            if receptor(k,1:3) == transmisor(k,1:3)
                continue;
            else
                nErr_T = nErr_T+1;
            end
    end
    if receptorErr(k,1:3) == A
            if receptor(k,1:3) == transmisor(k,1:3)
                continue;
            else
                nErr_A = nErr_A+1;
            end
    end
    if receptorErr(k,1:3) == B
            if receptor(k,1:3) == transmisor(k,1:3)
                continue;
            else
                nErr_B = nErr_B+1;
            end
    end
    if receptorErr(k,1:3) == C
            if receptor(k,1:3) == transmisor(k,1:3)
                continue;
            else
                nErr_C = nErr_C+1;
            end
    end
end
%% Calculo de error por MAP

%Probabilidad de error de P
pErr_P=nErr_P/nP;
%Probabilidad de error de Q
pErr_Q=nErr_Q/nQ;
%Probabilidad de error de R
pErr_R=nErr_R/nR;
%Probabilidad de error de S
pErr_S=nErr_S/nS;
%Probabilidad de error de T
pErr_T=nErr_T/nT;

%Probabilidad de error de A
pErr_A=nErr_A/nA_Err;
%Probabilidad de error de B
pErr_B=nErr_B/nB_Err;
%Probabilidad de error de C
pErr_C=nErr_C/nC_Err;

% Probabilidad total de error:
pErr_Tot=(nErr_A+nErr_B+nErr_C+nErr_P+nErr_Q+nErr_R+nErr_S+nErr_T)/n;







