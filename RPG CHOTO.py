import random

print ("RPG CHOTO")
print ("Ataques son: Magia (Multiplica el daño) y Espadazo")

nombres = ["Dragon", "Monstruo", "Monstruo", "Monstruo"]

p1hp = 100
p1att = 5
# Magia XD (Multiplica daño)
p1mult = 1

enmult = 1

nmfinal = random.choice(nombres)

if nmfinal == "Dragon":
   enhp = 300
   enatt = 10
   attacks = ["Fuego", "Garrazo"]

else:
   enhp = 200
   enatt = 5
   enmulton = True
   attacks = ["Magia", "Zarpazo"]


while p1hp > 0 and (enhp > 0):
   attack_on_use = random.choice(attacks)

   if attack_on_use == "Fuego":
      p1hp = p1hp - 15

   elif attack_on_use == "Garrazo":
      p1hp = p1hp - enatt

   elif attack_on_use == "Magia" and (enmulton == True):
      enmult = enmult + 1

   else:
      p1hp = p1hp - enatt * (enmult)


   print("")
   print (f"Tu enemigo es {nmfinal}")
   print(f"El enemigo usó {attack_on_use}")
   print(f"El enemigo te dejo con {p1hp}")
   print(f"Tu enemigo tiene {enhp} vida")

   current_p1_attack = False


   current_p1_attack = input("Elegí un ataque! : ").strip().lower()

   if current_p1_attack == "magia":
      p1mult = p1mult + 1

   elif current_p1_attack == "espadazo":
      enhp = enhp - p1hp * (p1mult)

   else :
      print("Eso no es un ataque ¡Fallaste!")

if p1hp > 0 and (enhp <= 0):
   ending = "¡Ganaste!"

elif p1hp <= 0 and (enhp > 0):
   ending = "¡Perdiste!"

elif p1hp <= 0 and (enhp <= 0):
   ending = "¿Empataron?"

else :
   ending = False

largaespera = input(f"{ending} Apreta enter para salir... (Tu enemigo quedo con {enhp} de vida XD) ")
