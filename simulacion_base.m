n=10000;

A=[0 0 0]; B=[0 0 1]; C=[0 1 0];
P=[0 1 1]; Q=[1 0 0]; R=[1 0 1]; S=[1 1 0]; T=[1 1 1];

m1=rand(n,1);
transmisor=zeros(n,3);
m2=rand(n,3);

%% Obtenemos una matriz con A, B y C
nA=0; nB=0; nC=0; nP=0; nQ=0; nR=0; nS=0; nT=0;
for k=1:n
    if (m1(k,1)<=0.5)
        transmisor(k,1:3)=A;
        nA=nA+1;
    elseif (m1(k,1)<=0.75) && (m1(k,1)>0.5)
        transmisor(k,1:3)=B;
        nB=nB+1;
    else
        transmisor(k,1:3)=C;
        nC=nC+1;
    end
end

%% Obtenemos una matriz con bits de error de una probabilidad de p=0,05
receptorErr=transmisor;
for k=1:n
    for t=1:3
        if (m2(k,t)<0.05) && (transmisor(k,t)==1)
            receptorErr(k,t)=0;
        elseif (m2(k,t)<0.05) && (transmisor(k,t)==0)
            receptorErr(k,t)=1; 
        end
    end     
end

