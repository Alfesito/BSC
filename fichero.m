% Este ejemplo simula la transmision y recepcion de una sola palabra
% Puede emplearse como guia para realizar la simulacion del trabajo

% Escribimos las tablas en forma matricial

% Tabla 1 (codificacion): posibles palabras transmitidas
t=[...
    -1,0,1;... % palabra asociada a la pareja de bits 00
    -1,1,0;... % palabra asociada a la pareja de bits 01
    0,-1,1;... % palabra asociada a la pareja de bits 10
    0,1,-1;... % palabra asociada a la pareja de bits 11
    ];

% Tabla 2 (efecto del canal): probabilidad de recibir el simbolo j cuando
% se transmite el simbolo i, donde i y j pertenecen al conjunto {-1,0,+1}
P=[...
    0.85,0.1,0.05;... % i=-1, j=-1,0,1
    0.1,0.8,0.1;...   % i=0,  j=-1,0,1
    0.05,0.1,0.85;... % i=1,  j=-1,0,1
    ];

% Generamos una pareja de bits al azar
bits=round(rand(1,2)); 

% Seleccionamos la palabra a transmitir de acuerdo con la tabla 1
% x: palabra transmitida
if bits==[0,0]
    x=t(1,:);
elseif bits==[0,1]
    x=t(2,:);
elseif bits==[1,0]
    x=t(3,:);
else
    x=t(4,:);
end

% Simulamos el efecto del canal: generamos la palabra recibida alterando
% los simbolos de la palabra transmitida segun la tabla 2
% y: palabra recibida
for m=1:3
  u=rand;
  if x(m)==-1
      if u<P(1,1)
          y(m)=-1;
      elseif u<P(1,1)+P(1,2)
          y(m)=0;
      else
          y(m)=1;
      end
  elseif x(m)==0
      if u<P(2,1)
          y(m)=-1;
      elseif u<P(2,1)+P(2,2)
          y(m)=0;
      else
          y(m)=1;
      end
  else
      if u<P(3,1)
          y(m)=-1;
      elseif u<P(3,1)+P(3,2)
          y(m)=0;
      else
          y(m)=1;
      end
  end
end