import os
import random

prob = [True, False, False, False, False, False]

esp = input("Apreta enter")

result = random.choice(prob)

if result == True:
   os.system("shutdown /s /t 5")
   print("Cagaste mano")

else :
   print (" SOBREBIVISTE!")

largaespera = input("Apreta enter para salir")