%_______________Trabajo 1 (simulación de movimiento de brazo planar 2D)________________________

%NOTA:Para este programa solo se simulará el la rotación del primer eslabon por lo que el 
%     segundo eslabon se mantendra dependiente del primero.

clear all
clc
close all

%_______________Se dibuja un plano 2D con los ejes X (rojo) y Y (verde)._______________________

%line ([Xi Xf],[Yi Yf],[Zi Zf]);
line ([-10 10],[0 0],[0 0], 'color',[1 0 0], 'linewidth',2.5); % Establece el eje X en Rojo.
line ([0 0],[-10 10],[0 0], 'color',[0 1 0], 'linewidth',2.5); % Establece el eje Y en Verde.
grid on         %Con esta linea hacemos que nuestra grafica cuente con coordenadas visibles.

%____Intoduciomos la longitud de eslabon 1 (L1) y del eslabon 2 (L2) de nuestro brazo.__________ 

L1=input('Introduce el valor de L1: ');
L2=input('Introduce el valor de L2: ');

%_______DATO Se definen la coordenada del punto 1 (p1) punto de partida en el origen.___________ 

p1 = [0 0 0]';      %Vector columna (esto por la " ' " del final del vector).  

%__________Se intoducen los angulos de rotación de cada eslabon en grados.______________________

%NOTA:Matlab trabaja en radianes por lo que el valor de los grados debe ser convertido a radianes 
%     para lo cual se emplea la función deg2rad creada por nosotros. 

angGRAD=input('Introduce un angulo del primer eslabon: ');
angRADIANES=deg2rad(angGRAD);

angGRAD_2=input('Introduce un angulo para theta2: ');
angRADIANES_2=deg2rad(angGRAD_2);





if angRADIANES>=0
    angRADIANES=0:0.1:angRADIANES;
elseif angRADIANES<0
    angRADIANES=0:-0.1:angRADIANES;
end 





if angRADIANES_2>=0
    angRADIANES_2=0:0.1:angRADIANES_2;
elseif angRADIANES_2<0
    angRADIANES_2=0:-0.1:angRADIANES_2;
end 





for i=1:length(angRADIANES)   %length=longitud del verctor. 
    
    clf %para limpiar la imagen 
    line ([-10 10],[0 0],[0 0], 'color',[1 0 0], 'linewidth',2.5); % Establece el eje X en Rojo.
    line ([0 0],[-10 10],[0 0], 'color',[0 1 0], 'linewidth',2.5); % Establece el eje Y en Verde.
    grid on         %Con esta linea hacemos que nuestra grafica cuente con coordenadas visibles.
    
    Rz=[cos(angRADIANES(i)) -sin(angRADIANES(i)) 0 0; sin(angRADIANES(i)) cos(angRADIANES(i)) 0 0; 0 0 1 0; 0 0 0 1];
    Tx=[1 0 0 L1; 0 1 0 0; 0 0 1 0; 0 0 0 1];
    M1=Rz*Tx;
    p2=M1(1:3,4);      %p2 es el valor de la fila 1 2 y 3 de la columna 4; 
 
    line([p1(1) p2(1)],[p1(2) p2(2)],[p1(3) p2(3)], 'linewidth',3.5);
    
    
   
    
    
    
    
    
    Rz_2=[cos(0) -sin(0) 0 0; sin(0) cos(0) 0 0; 0 0 1 0; 0 0 0 1];
    Tx_2=[1 0 0 L2; 0 1 0 0; 0 0 1 0; 0 0 0 1];
    M2=Rz_2*Tx_2;
    TF=M1*M2;
    p3=TF(1:3,4);
    line([p2(1) p3(1)],[p2(2) p3(2)],[p2(3) p3(3)], 'color',[1 0 1],'linewidth',3.5);
    
    pause (0.01); %Esta pausa es para poder visualizar el cambio progresivo. 
    
end 







