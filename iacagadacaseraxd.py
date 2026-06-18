import random
import os

# AYUDAAAAAAAAAAAAAAAAAAAAAAAA use #import en ves de import (Flashbacks de C / GML2 (NO POR FAVOR NOOOOOOOOOOOOOO AAAAAAAAAAAAAAAAAAAAAA ; (Exploto por olvidar poner ;)))
weight_izq = 50
weight_der = 50
tdsdtsuytdaytkdy = True


while tdsdtsuytdaytkdy == True:
    seleccion = random.choices(
        ["izq", "der"],
        weights=[weight_izq, weight_der]
    )[0] #Tuve un error pq en todo escribí wHeight en ves de weight

    preguntasas = input(f"Eligio {seleccion} ¿Estaba bien o mal? (S/N): ")

    if preguntasas == "s":
        if seleccion == "der":
            weight_der += 3
            weight_izq -= 3
        else :
            weight_izq += 3
            weight_der -= 3

    elif preguntasas == "n":
        if seleccion == "der":
            weight_der -= 3
            weight_izq += 3
        else :
            weight_izq -= 3
            weight_der += 3
    
    else :
        print("¿Q verga es eso?")

    print(f"Las probabilidades de derecha son: {weight_der} y las de izqierda {weight_izq}")
    sassasasas = input("Apretá Enter")
    os.system("cls")