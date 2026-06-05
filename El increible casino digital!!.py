#Beta XDXDXD

import random
import os
import time

mcypesos = 100

while mcypesos > 0:
    gasto = int(input(f"¿Cuantos Mickey Pesos vas a apostar? (Tenés {mcypesos} Mickey Pesos): "))
    if gasto > mcypesos:
        print("Que verga??")
        break

    mcypesos = mcypesos - gasto

    slot_simb = ["🗿", "🤑", "🐀"]
    slot_result1 = random.choice(slot_simb)
    slot_result2 = random.choice(slot_simb)
    slot_result3 = random.choice(slot_simb)

    if (slot_result1 == "🗿") and (slot_result2 == "🗿") and (slot_result3 == "🗿"):
        mcypesos = (mcypesos) + (gasto * 3)

    elif (slot_result1 == "🤑") and (slot_result2 == "🤑") and (slot_result3 == "🤑"):
        mcypesos = (mcypesos) + (gasto * 5)

    elif (slot_result1 == "🐀") and (slot_result2 == "🐀") and (slot_result3 == "🐀"):
        mcypesos = (mcypesos) + (gasto * -2)

    else :
        mcypesos = mcypesos

    print(f"{slot_result1} {slot_result2} {slot_result3} (Ahora tenes: {mcypesos})")

print("CAGASTE MANO!")


os.system(
                        "rundll32.exe "
                        "powrprof.dll,"
                        "SetSuspendState "
                        "0,1,0"
                    )

time.sleep(1)
exit
