run('simulacion_base');

%% Añade el bit de paridad a recepctorErr->receptorErrH
bitParidad=rand(n,1);
mParidad=zeros(n,1);
for k=1:n
    if transmisor(k,1:3)==A
        if bitParidad(k,1)<0.05
            mParidad(k,1)=0;
        else
            mParidad(k,1)=1;
        end
    end
    if transmisor(k,1:3)==B
        if bitParidad(k,1)<0.05
            mParidad(k,1)=1;
        else
            mParidad(k,1)=0;
        end
    end
    if transmisor(k,1:3)==C
        if bitParidad(k,1)<0.05
            mParidad(k,1)=1;
        else
            mParidad(k,1)=0;
        end
    end
end

%% Analiza la paridad de las letras para encontrar el error
receptorErrH=horzcat(mParidad,receptorErr);
sumaParidad=sum(receptorErrH,2);
m4=rand(n,1);
receptor=receptorErr;
nA_Err=0; nB_Err=0; nC_Err=0;
for k=1:n
    if mod(sum(mParidad(k,1))+sum(receptorErr(k,1:3)),2) == 1
        continue;
    else
        if (receptorErrH(k,2:4) == A)
            nA_Err=nA_Err+1;
            continue;
        elseif (receptorErrH(k,2:4) == B)
            nB_Err=nB_Err+1;
            continue;
        elseif (receptorErrH(k,2:4) == C)
            nC_Err=nC_Err+1;
            continue;
        end
        if receptorErrH(k,2:4) == P
            if (m4(k,1)<0.5)
                receptor(k,1:3)=B;
            else
                receptor(k,1:3)=C;
            end
        end
        if receptorErrH(k,2:4) == Q
            receptor(k,1:3)=A;
        end
        if receptorErrH(k,2:4) == R
            receptor(k,1:3)=B;

        end
        if receptorErrH(k,2:4) == S
            receptor(k,1:3)=C;
        end
        if receptorErrH(k,2:4) == T
            if (m4(k,1)<0.333)
                receptor(k,1:3)=B;
            elseif (0.333<m4(k,1)<0.666)
                receptor(k,1:3)=C;
            else
                receptor(k,1:3)=A;
            end
        end
    end
end

%% Calculo de la probabilidad de error de correccion de P,Q,R,S,T:

nErr_P=0; nErr_Q=0; nErr_R=0; nErr_S=0; nErr_T=0;
nErr_A=0; nErr_B=0; nErr_C=0;
for k=1:n
    if receptorErr(k,1:3) == P
        nP=nP+1;
            if receptor(k,1:3) == transmisor(k,1:3)
                continue;
            else
                nErr_P = nErr_P+1;
            end
    end
    if receptorErr(k,1:3) == Q
        nQ=nQ+1;
            if receptor(k,1:3) == transmisor(k,1:3)
                continue;
            else
                nErr_Q = nErr_Q+1;
            end
    end
    if receptorErr(k,1:3) == R
        nR=nR+1;
            if receptor(k,1:3) == transmisor(k,1:3)
                continue;
            else
                nErr_R = nErr_R+1;
            end
    end
    if receptorErr(k,1:3) == S
        nS=nS+1;
            if receptor(k,1:3) == transmisor(k,1:3)
                continue;
            else
                nErr_S = nErr_S+1;
            end
    end
    if receptorErr(k,1:3) == T
        nT=nT+1;
            if receptor(k,1:3) == transmisor(k,1:3)
                continue;
            else
                nErr_T = nErr_T+1;
            end
    end
    if receptorErr(k,1:3) == A
        nA=nA+1;
            if receptor(k,1:3) == transmisor(k,1:3)
                continue;
            else
                nErr_A = nErr_A+1;
            end
    end
    if receptorErr(k,1:3) == B
        nA=nA+1;
            if receptor(k,1:3) == transmisor(k,1:3)
                continue;
            else
                nErr_B = nErr_B+1;
            end
    end
    if receptorErr(k,1:3) == C
        nC=nC+1;
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
