import random

inicio = ["Sos un pedazo de", "A vos", "A tu vieja", "A tu abuelo", "Vos", "Tu vieja", "Tu abuelo" ]
nudoinicio = ["te gusta", "le gusta", "ama", "amas", "flauta", "Peter Griffin"]
nudo = ["un ninja nuclear", "Homero Simpson", "desafinada", "desafinado", "un asno", "hacer el frutifantastico", "Javier Milei", "sas", "edredon","repositor", "inquietante"]
final = ["haciendo el frutifantastico", "cagando", "cantando", "bailando", "esputando"]
emoji = ["🤑", "😋", "🔥", "🗿", "🚬", "🚬🗿"]
prob = [True, False, False, False, True, False,False]

in1 = random.choice(inicio)
nudin2 = random.choice(nudoinicio)
nud3 = random.choice(nudo)
fin4 = random.choice(final)
prod = random.choice(prob)

if prod == True:
    emj = random.choice(emoji)
else :
    emj = ""

print(f"{in1} {nudin2} {nud3} {fin4} {emj}")

espraf = input("Apretá enter para salir (¡Al final un texto con sentido che!)")