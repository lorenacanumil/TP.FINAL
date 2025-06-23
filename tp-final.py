def solicitar_datos_personales():
    print("Ingrese nombre y apellido")
    nomape = input()
    print("Ingrese DNI")
    dni = input()
    print("Ingrese teléfono")
    telefono = input()
    print("Empresa en la que trabaja:")
    empresa = input()
    return nomape, dni, telefono, empresa

def determinar_origen():
    print("¿Usted es ciudadano de Bariloche? 1 = sí, 2 = no (Turista Nacional), 3 = no (Turista Internacional)")
    ciud = int(input())
    if ciud == 1:
        print("Ingrese su domicilio particular")
        domloc = input()
        print("Ingrese su domicilio laboral")
        domlab = input()
        return ciud, domloc, domlab
    else:
        print("Ingrese el hotel o agencia asociada")
        tur = input()
        return ciud, tur, ""

def seleccionar_tarifa():
    print("TIPOS DE TARIFAS DISPONIBLES:")
    print("T1: Tarifa por Día\nT2: Tarifa por Semana\nT3: Tarifa por Mes")
    print("Ingrese el código de la tarifa (T1, T2 o T3):")
    cod = input()
    if cod == "T1":
        nombre = "Tarifa por Día"
        print("Ingrese la cantidad de días:")
        tiempo = int(input())
    elif cod == "T2":
        nombre = "Tarifa por Semana"
        print("Ingrese la cantidad de semanas:")
        tiempo = int(input()) * 7
    else:
        nombre = "Tarifa por Mes"
        print("Ingrese la cantidad de meses:")
        tiempo = int(input()) * 30
    return cod, nombre, tiempo

def seleccionar_vehiculo(tiempo):
    print("¿Planea recorrer caminos montañosos o de ripio? 1 = Sí, 2 = No")
    if int(input()) == 1:
        print("Es obligatorio usar un vehículo 4x4. ¿Desea continuar? 1 = Sí, 2 = No")
        if int(input()) == 1:
            return "Camioneta", tiempo * 120000
    else:
        print("¿Qué tipo de vehículo desea alquilar? 1 = Camioneta, 2 = Auto 4 puertas, 3 = Convertible")
        opv = int(input())
        print("¿Está disponible? 1 = Sí, 2 = No")
        if int(input()) != 1:
            print("Seleccione otro tipo de vehículo (1, 2 o 3):")
            opv = int(input())
        if opv == 1:
            return "Camioneta", tiempo * 120000
        elif opv == 2:
            return "Auto 4 puertas", tiempo * 40000
        else:
            return "Convertible", tiempo * 45000

def calcular_costos_adicionales(costo):
    print("¿Usará el vehículo en zonas como Circuito Chico, Cerro Catedral o Ruta 40? 1 = Sí, 2 = No")
    camino = costo * 0.02 if int(input()) == 1 else 0

    print("¿En qué días lo utilizará? 1 = Lunes a Jueves, 2 = Viernes a Domingo")
    if int(input()) == 2:
        costo += costo * 0.05

    print("¿Lo usará en temporada alta (verano/invierno)? 1 = Sí, 2 = No")
    if int(input()) == 1:
        temp = costo * 0.05
        periodo = "temporada alta"
    else:
        temp = 0
        periodo = "temporada baja"
    return costo, camino, temp, periodo

def calcular_total(costo, camino, temp, vip):
    seguro = 12000
    if vip == 1:
        recargo = temp + camino - costo * 0.10
    else:
        recargo = temp + camino
    total = costo + recargo + seguro
    return total, recargo, seguro

def imprimir_factura(data):
    print("\n--- FACTURA ---")
    for item in data:
        print(item)

def main():
    print("Ingrese su edad")
    if int(input()) < 25:
        print("No cumple con la edad mínima para alquilar.")
        return

    nomape, dni, telefono, empresa = solicitar_datos_personales()
    ciud, ref1, ref2 = determinar_origen()
    cod_tarifa, tarifa_nombre, tiempo = seleccionar_tarifa()
    tipo_vehiculo, costo = seleccionar_vehiculo(tiempo)
    costo, costo_camino, costo_temp, periodo = calcular_costos_adicionales(costo)

    print("¿Es cliente VIP? 1 = Sí, 2 = No")
    vip = int(input())
    total, recargo, seguro = calcular_total(costo, costo_camino, costo_temp, vip)

    print("Forma de pago (ej: efectivo, tarjeta, transferencia):")
    forma_pago = input()
    print("¿Cómo se enteró de nuestra agencia?")
    contacto = input()

    print("Tipo de licencia (municipal, nacional, internacional):")
    input()
    print("Modelo del vehículo:")
    modelo = input()
    print("Patente:")
    patente = input()
    print("Chasis:")
    chasis = input()
    print("Motor:")
    motor = input()
  
    factura = [
            f"Nombre completo: {nomape}",
            f"DNI: {dni}",
            f"Teléfono: {telefono}",
            f"Empresa: {empresa}",
            f"Origen: {ciud}",
            f"Domicilio: {ref1}",
            f"Domicilio laboral: {ref2}",
            f"Tarifa seleccionada: {tarifa_nombre} ({cod_tarifa})",
            f"Vehículo: {tipo_vehiculo} - Modelo: {modelo} - Patente: {patente}",
            f"Chasis: {chasis}, Motor: {motor}",
            f"Costo base: ${costo:.2f}",
            f"Costo por zona: ${costo_camino:.2f}",
            f"Costo por temporada: ${costo_temp:.2f}",
            f"Recargo: ${recargo:.2f}",
            f"Seguro: ${seguro:.2f}",
            f"Total a pagar: ${total:.2f}"
        ]
    imprimir_factura(factura)
    def importe():
        if importe <= total:
            saldo = total - importe
            print(f"Saldo pendiente: {saldo}")
        else:
            print("El importe ingresado excede el total. Operación no válida.")
        return
if __name__ == '__main__':
    main()
