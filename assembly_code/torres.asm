#Roberto Osrono Liz, 721033
#Alvaro Gonzalez Conde, 701863
#Practica1; Torres de Hanoi
.eqv n_discos 3
.data 
.text
addi s0, s0, n_discos  # Número de discos

#asignar torres

  lui    t1, 0x10010     #Direccion de inicio torre 1
  lui    t2, 0x10010     #Direccion de inicio torre 2
  lui    t3, 0x10010     #Direccion de inicio torre 3
  lui    t5, 0x10010     #Apuntador parte más alta de la torre 
 
  addi    t2, t2, 4    #Aumentamos 4 para posicionar nuestra torre uno hacia la derecha en el rars
  addi    t3, t3, 8    #Hacemos lo mismo con la tercera 
  
  addi  s1, s0, 0      #Copia de el numero de discos inicial, Funcionara como contador para crear las torres

  addi     a2, zero, 1    
  addi     a3,zero, 0x20
  addi     a5,zero,0
#Esta función nos va a ayudar a asignar el tamaño de nuestras torres

UbicarTorres:  beq s1, zero, llenar_Torre1 #Con esta función abrimos espacio en la memoria de datos para posteriormente construir las torres
  addi     t1,t1,0x20        
  addi     t2,t2,0x20
  addi     t3,t3,0x20        
  addi     s1,s1,-1        #Siguiente disco 
  jal      zero, UbicarTorres
        
llenar_Torre1:                #Función que llena la torre de abajo hacia arriba
  addi  s1, s0, 0 
  
ciclo_torres: 
  beq     s1, zero, main
  sw      s1, 0(t1)
  sub     t1, t1, a3
  sub     s1,s1,a2                #Siguiente disco
  jal       zero, ciclo_torres      
 
main:
  
   jal    ra, Hanoi        #llamo a mi funcion Hanoi
   jal    zero, end       #Cuando Termina Recursividad termina el codigo
  
      Hanoi:      
          #PUSH
        addi    sp,sp,-4         #Abrimos Espacio para guardar valores
        sw      ra, 0(sp)        #Guardamos ra para no perderlo en recursividad y poder regresar a la función
      
        beq    s0,a2,Caso_Base    #If(discos==1)Caso_Base
        
        #Swap1
        addi    s0,s0,-1
        addi    t5,t2,0           #Hanoi(o,a,d)
        sub    t2,t2,t2              #Ahora Torre 2 es Auxiliar y 3 Destino
        addi    t2,t3,0            
        sub    t3,t3,t3
        addi    t3,t5,0
        sub    t5,t5,t5
     
        jal     ra,Hanoi       #Recursividad
          
       #Unswap1 
        addi    t5,t2,0           #Hanoi(o,d,a)
        sub    t2,t2,t2           #Ahora Torre 2 es Destino y 3 Auxiliar
        addi    t2,t3,0            
        sub    t3,t3,t3
        addi    t3,t5,0
        sub    t5,t5,t5      
        
        #Mover disco de T1 a T2
        addi    t1,t1,0x20
        lw        t4, 0(t1)
        sw        t4, 0(t2)
        addi    t4,a2,-1        
        sw        t4,0(t1)
        addi    t2,t2,-0x20    #Movemos t1 y t2 para apuntar a la parte más alta de cada torre
        
        #Swap2                      
        addi    t5,t3,0        #En este punto T1 apunta a Torre3, T2 aputa a Torre2 y T3 apunte a la torre1
        sub    t3,t3,t3
        addi    t3,t1,0 
        sub    t1,t1,t1       
        addi    t1,t5,0
        sub    t5,t5,t5
  
        jal    ra,Hanoi
        #Unswap2
        addi    t5,t3,0        #Ordenamos nuevamente los apuntadores
        sub    t3,t3,t3
        addi    t3,t1,0 
        sub    t1,t1,t1       
        addi    t1,t5,0
        sub    t5,t5,t5
        addi    s0,s0,1        
        
        jal     zero, returnHanoi
        

    Caso_Base: 
        
        #*Origen==*Destino
        #Mover disco de T1 a T2
        addi    t1,t1,0x20
        lw      t4, 0(t1)
        sw      t4, 0(t2)
        addi    t4,a2,-1
        sw      t4,0(t1)
        addi    t2,t2,-0x20
        
    returnHanoi:            #Función para regresar a hanoi
        lw    ra,0(sp)
        addi    sp,sp,4#POP
        jalr     zero,ra,0
        

end:
