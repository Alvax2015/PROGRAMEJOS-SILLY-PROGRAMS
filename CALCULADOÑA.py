print("CALCULADOÑA")
print("")


oprt = input("¿Que queres hacer? (Leé el manual): ")


inpt1 = input("Poné un numero, pibe: ")
inpt2 = input("Poné otro numero, genion't: ")

num1 = int(inpt1)
num2 = int(inpt2)

imprt1 = oprt == "+" or "-" == True



if oprt == "+":
    num3 = num1 + num2

elif oprt == "-":
    num3 = num1 - num2

elif oprt == "*":
    num3 = num1 * num2

elif oprt == "/":
    num3 = num1 / num2

elif oprt == "romperte las bolas":
    num3 = "Hijo de puta"

elif oprt == "Romperte las bolas":
    num3 = "Hijo de puta"    

elif oprt == "ROMPERTE LAS BOLAS":
    num3 = "¡HIJO DE PUTA!"

else :
    num3 = "Que pelotudo eso no es una operacion..."   
  
if imprt1 and num1 < 97 and num2 < 97:
    idiot = "... (Pero vos sos alto pelotudo ¿Como no vas a saber eso?)"
else :
    idiot = ""    

print(f"Toma tu resultado vago de mrd: {num3} {idiot}")


espera = input("Apretá enter para salir")