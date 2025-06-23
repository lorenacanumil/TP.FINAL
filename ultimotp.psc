Algoritmo alquiler_autos_con_tarifas
		Definir numero, turis, tiempo, op1, continue, opv, camino, temp, vip, costo, costo_camino, costo_temp, recargo, total, recargoseguro Como Entero
		Definir modelo, nomape, dni, telefono, empresa, domloc, domlab, tur, ref1, ref2, vei Como Cadena
		Definir ca, cu, co Como Cadena
		Definir cod_tarifa, tarifa_nombre Como Cadena
		Escribir 'Ingrese su edad'
		Leer numero
		
		Si numero>=25 Entonces
			Escribir 'Ingrese nombre y apellido'
			Leer nomape
			Escribir 'Ingrese DNI'
			Leer dni
			Escribir 'Ingrese telefono'
			Leer telefono
			Escribir 'Empresa en la que desempeña sus actividades laborales:'
			Leer empresa
			
			Escribir '¿Usted es ciudadano de Bariloche? 1 = sí. 2 = no (Turista Nacional). 3 = no (Turista Internacional)'
			Leer ciud
			
			vacio <- ""
			ca <- 'camioneta'
			cu <- 'auto cuatro puertas'
			co <- 'convertible'
			
			Si ciud=1 Entonces
				Escribir 'Local'
				Escribir 'Ingrese su domicilio'
				Leer domloc
				ref1 <- domloc
				Escribir 'Ingrese su domicilio laboral'
				Leer domlab
				ref2 <- domlab
			SiNo
				Si ciud=2 Entonces
					Escribir 'Usted es Turista Nacional'
				SiNo
					ciud <- 3
					Escribir 'Turista Internacional'
				FinSi
				Escribir 'Ingrese su hotel o agencia asociada'
				Leer tur
				ref1 <- tur
				ref2 <- vacio
			FinSi
			
			// TARIFAS DISPONIBLES
			Escribir 'TIPOS DE TARIFAS DISPONIBLES:'
			Escribir 'T1: Tarifa por Día'
			Escribir 'T2: Tarifa por Semana'
			Escribir 'T3: Tarifa por Mes'
			Escribir 'Ingrese el código de la tarifa que desea (T1, T2 o T3):'
			Leer cod_tarifa
			
			Si cod_tarifa = 'T1' Entonces
				tarifa_nombre <- 'Tarifa por Día'
				Escribir 'Ingrese la cantidad de días: '
				Leer dias
				tiempo <- dias
			SiNo
				Si cod_tarifa = 'T2' Entonces
					tarifa_nombre <- 'Tarifa por Semana'
					Escribir 'Ingrese la cantidad de semanas: '
					Leer semanas
					tiempo <- semanas * 7
				SiNo
					Si cod_tarifa = 'T3' Entonces
						tarifa_nombre <- 'Tarifa por Mes'
						Escribir 'Ingrese la cantidad de meses: '
						Leer meses
						tiempo <- meses * 30
					FinSi
				FinSi
			FinSi
			
			Escribir '¿Usted planea recorrer caminos montañosos y/o rutas de ripio? Ingrese 1 (SI) o 2 (NO)'
			Leer op1
			
			Si op1=1 Entonces
				Escribir 'Es obligatorio que use un vehículo 4x4. ¿Desea seguir adelante? 1 (SI) o 2 (NO)'
				Leer continue
				Si continue=1 Entonces
					vei <- ca
					costo <- tiempo * 120000
				FinSi
			FinSi
			
			Si op1=2 Entonces
				Escribir '¿Qué vehículo desea alquilar?'
				Escribir '(1= Camioneta) (2 = Auto 4 puertas) (3 = Convertible)'
				Leer opv
				Escribir "¿El vehiculo esta disponible? 1 = si, 2 = no "
				Leer disponible
				si disponible = 1 entonces 
					imprimir "esta disponible"
					Si opv=1 Entonces
						vei <- ca
						costo <- tiempo * 120000
					SiNo
						Si opv=2 Entonces
							vei <- cu
							costo <- tiempo * 40000
						FinSi
						Si opv=3 Entonces
							vei <- co
							costo <- tiempo * 45000
						FinSi
					FinSi
				SiNo disponible = 2
					imprimir "no esta disponible"
					Escribir "¿que vehiculo desea alquilar? 1 = camioneta, 2 = auto 4 puertas, 3 = convertible"
					leer opv
					Si opv=1 Entonces
						vei <- ca
						costo <- tiempo * 120000
					SiNo
						Si opv=2 Entonces
							vei <- cu
							costo <- tiempo * 40000
						FinSi
						Si opv=3 Entonces
							vei <- co
							costo <- tiempo * 45000
						FinSi
					FinSi
				FinSi
				
			FinSi
			
			Escribir '¿Usará el vehículo en Circuito Chico, Cerro Catedral o Ruta 40? Ingrese 1 (SI) o 2 (NO)'
			Leer camino
			Si camino=1 Entonces
				costo_camino <- costo * 0.02
			SiNo
				costo_camino <- 0
			FinSi
			
			Escribir 'Indique el rango de tiempo que solicita el vehículo:'
			Escribir "lo usasara entre los dias lunes a jueves (marque 1) si lo quiere entre el viernes y el domingo (marque 2)"
			leer rango
			si rango = 1 Entonces
				costo = costo + 0
			SiNo
				si rango = 2 Entonces
					costo = costo + costo * 0.05
				FinSi
			FinSi
			
			Escribir '¿Lo usará en verano (diciembre a febrero) o en invierno (junio a septiembre)? Ingrese 1 (SI) o 2 (NO)'
			Leer temp
			Si temp=1 Entonces
				costo_temp <- costo * 0.05
				periodo = "meses temporada alta (diciembre a febrero) o (junio a septiembre)"
			SiNo
				costo_temp <- 0
				periodo = "meses de temporada baja"
			FinSi
			
			recargoseguro <- 12000
			
			Escribir '¿Usted es cliente VIP? (1 = SI) (2 = NO)'
			Leer vip
			Si vip=1 Entonces
				recargo <- costo_temp + costo_camino - costo * 0.10
				total <- costo + recargo + recargoseguro
			SiNo
				recargo <- costo_temp + costo_camino
				total <- costo + recargo + recargoseguro
				Escribir "forma de pago: "
				leer pago
				escribir "como contactó con nuestra agencia: "
				leer contacto
			FinSi
			Escribir "¿Qué tipo de licencia tiene: municipal, nacional o internacional?"
			Leer licencia 
			Escribir "ingresar el modelo del vehiculo : "
			leer modelo 
			escribir "ingresar numero de patente: "
			leer patente 
			escribir "ingresar numero de chasis: "
			leer chasis 
			escribir "ingresar numero de motor: "
			leer motor
			// FACTURA FINAL
			Escribir '-----------------------------------------------------------------------------------'
			Escribir 'FACTURA CONSUMIDOR FINAL - Empresa ALQUILER DE VEHICULOS'
			Escribir 'Datos del consumidor: '
			Escribir 'Nombre completo: ', nomape
			Escribir 'DNI: ', dni
			Escribir 'Número telefónico: ', telefono
			Escribir 'Empresa: ', empresa
			Escribir 'Origen: ', ciud
			Escribir 'Domicilio: ', ref1
			Escribir 'Domicilio laboral: ', ref2
			Escribir 'Código de tarifa elegida: ', cod_tarifa
			Escribir 'Nombre de la tarifa: ', tarifa_nombre
			Escribir "perido solicitado: " periodo
			Escribir '---------------------------------------------------------------------------------'
			escribir "Modelo : ", modelo
			Escribir "tipo de Vehiculo: ", vei
			Escribir "Patente: ", patente
			escribir "Chasis: " ,chasis
			Escribir "Numero de Motor", motor
			Escribir '-----------------------------------------------------------------------------------'
			Escribir '	COSTOS  '
			Escribir 'Vehículo alquilado: ', vei
			Escribir 'Costo base del vehículo: ', costo
			Escribir 'Costo por zona geográfica: ', costo_camino
			Escribir 'Costo por temporada alta: ', costo_temp
			Escribir 'Recargo total: ', recargo
			Escribir 'Seguro (rutas de tierra y daños por nieve): ', recargoseguro
			Escribir '-----------------------------------------------------------------------------------'
			Escribir 'TOTAL A PAGAR: ', total
			Escribir '-----------------------------------------------------------------------------------'
			Escribir "¿forma de pago total o parcial?"
			leer formadepago
			escribir "ingresar importe"
			leer importe
			si importe <= total entonces
				saldo = total - importe 
				imprimir "El saldo a pagar es: " , saldo 
				Escribir "NUMERO DE FACTURA: "
				Leer factura
				Escribir "FECHA: "
				leer Fecha
				Escribir "DNI"
				Leer DNI
			sino 
				imprimir "El pago no es posible"
			FinSi
			
			
		SiNo
		Escribir 'No alcanza la edad para poder adquirir el alquiler de un vehículo.'
	FinSi
FinAlgoritmo
