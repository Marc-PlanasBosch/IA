;---------------------------------------------------------
; CLASES USUARIOS
; ---------------------------------------------------------

  (defclass Usuario
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot Habla_en (type INSTANCE) (create-accessor read-write))
    (multislot Solicita_un (type INSTANCE) (create-accessor read-write))
    (multislot Vive_en (type INSTANCE) (create-accessor read-write))
    (slot anosEstudio (type INTEGER) (create-accessor read-write))
    (slot edad (type INTEGER) (create-accessor read-write))
    (slot experiencia (type INTEGER) (create-accessor read-write))
    (slot presupuestoMaximo (type INTEGER) (create-accessor read-write))
  )

  (defclass Familia
    (is-a Usuario)
    (role concrete)
    (pattern-match reactive)
    (slot nAdultos (type INTEGER) (create-accessor read-write))
    (slot nNinos (type INTEGER) (create-accessor read-write))
    (multislot edadNinos (type INTEGER) (create-accessor read-write))
    (slot atributosFamilia (type INTEGER) (create-accessor read-write))
  )

  (defclass Grupo_de_amigos
    (is-a Usuario)
    (role concrete)
    (pattern-match reactive)
    (slot nPersonas (type INTEGER) (create-accessor read-write))
  )

  (defclass Pareja
    (is-a Usuario)
    (role concrete)
    (pattern-match reactive)
  )

  (defclass Persona_Individual
    (is-a Usuario)
    (role concrete)
    (pattern-match reactive)
  )

; ---------------------------------------------------------
; CLASES ALOJAMIENTO
; ---------------------------------------------------------

  (defclass Alojamiento
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot ambiente (type SYMBOL) (create-accessor read-write))
    (slot apartamentoFamiliar (type SYMBOL) (create-accessor read-write))
    (slot calidadAlojamiento (type SYMBOL) (create-accessor read-write))
    (slot precioAlojamiento (type INTEGER) (create-accessor read-write))
  )

  (defclass Apartamento
    (is-a Alojamiento)
    (role concrete)
    (pattern-match reactive)
    (multislot numHabitaciones (type INTEGER) (create-accessor read-write))
  )

  (defclass Hostal
    (is-a Alojamiento)
    (role concrete)
    (pattern-match reactive)
    (multislot habitacionCompartida (type SYMBOL) (create-accessor read-write))
  )

  (defclass Hotel
    (is-a Alojamiento)
    (role concrete)
    (pattern-match reactive)
    (multislot servicio (type SYMBOL) (create-accessor read-write))
  )

; ---------------------------------------------------------
; CLASES TRANSPORTE
; ---------------------------------------------------------

  (defclass Transporte
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot Origen (type INSTANCE) (create-accessor read-write))
    (slot Destino (type INSTANCE) (create-accessor read-write))
    (slot accesibilidad (type SYMBOL) (create-accessor read-write))
    (slot capacidad (type INTEGER) (create-accessor read-write))
    (slot contaminacion (type SYMBOL) (create-accessor read-write))
    (slot duracionViaje (type SYMBOL) (create-accessor read-write))
    (slot precioTransporte (type INTEGER) (create-accessor read-write))
  )

  (defclass Autobus
    (is-a Transporte)
    (role concrete)
    (pattern-match reactive)
    (multislot claseAsiento (type SYMBOL) (create-accessor read-write))
  )

  (defclass Avion
    (is-a Transporte)
    (role concrete)
    (pattern-match reactive)
    (multislot claseAsiento (type SYMBOL) (create-accessor read-write))
  )

  (defclass Barco
    (is-a Transporte)
    (role concrete)
    (pattern-match reactive)
    (multislot claseAsiento (type SYMBOL) (create-accessor read-write))
  )

  (defclass Coche
    (is-a Transporte)
    (role concrete)
    (pattern-match reactive)
    (multislot conductorExterno (type SYMBOL) (create-accessor read-write))
  )

  (defclass Tren
    (is-a Transporte)
    (role concrete)
    (pattern-match reactive)
    (multislot claseAsiento (type SYMBOL) (create-accessor read-write))
  )

; ---------------------------------------------------------
; CLASES CIUDAD
; ---------------------------------------------------------

  (defclass Ciudad
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot Contienen (type INSTANCE) (create-accessor read-write))      
    (multislot Hablan_en (type INSTANCE) (create-accessor read-write))     
    (multislot Requiere_de (type INSTANCE) (create-accessor read-write))   
    (multislot Se_celebra (type INSTANCE) (create-accessor read-write))    
    (multislot Tiene_un_conjunto_de (type INSTANCE) (create-accessor read-write))
    (multislot Tipo_de_ciudad (type INSTANCE) (create-accessor read-write))  
    (slot estiloVida (type STRING) (create-accessor read-write))
    (slot pais (type STRING) (create-accessor read-write))
    (slot continente (type STRING) (create-accessor read-write))
    (slot precioMedio (type INTEGER) (create-accessor read-write))
  )

; ---------------------------------------------------------
; CLASES EVENTOS ESPECIALES
; ---------------------------------------------------------

  (defclass Eventos_especiales
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot aptoParaNinos (type SYMBOL) (create-accessor read-write))
    (slot esAccesible (type SYMBOL) (create-accessor read-write))
    (slot precioEntrada (type INTEGER) (create-accessor read-write))
    (slot puntuacion (type SYMBOL) (create-accessor read-write))
    (slot tiempo (type SYMBOL) (create-accessor read-write))
  )

; ---------------------------------------------------------
; CLASES IDIOMAS
; ---------------------------------------------------------

  (defclass Idioma
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
  )

; ---------------------------------------------------------
; CLASES MATERIALES
; ---------------------------------------------------------

  (defclass Material
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
  )

; ---------------------------------------------------------
; CLASES OBJETIVOS
; ---------------------------------------------------------

  (defclass Objetivo
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
  )

; ---------------------------------------------------------
; CLASES PUNTOS DE INTERES
; ---------------------------------------------------------

  (defclass Punto_de_Interes
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot precioEntrada (type INTEGER) (create-accessor read-write))
    (slot puntuacion (type SYMBOL) (create-accessor read-write))
    (slot aptoParaNinos (type SYMBOL) (create-accessor read-write))
    (slot esAccessible (type SYMBOL) (create-accessor read-write))
  )

; ---------------------------------------------------------
; CLASES TEMATICA
; ---------------------------------------------------------

  (defclass Tematica
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
  )

; ---------------------------------------------------------
; CLASES TEMPORADA
; ---------------------------------------------------------

  (defclass Temporada
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot clima (type SYMBOL) (create-accessor read-write))
    (slot turismo (type SYMBOL) (create-accessor read-write))
  )

; ---------------------------------------------------------
; CLASES VIAJE
; ---------------------------------------------------------

  (defclass Viaje
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot Enfocado_en (type INSTANCE) (create-accessor read-write))   
    (slot Incluye_un_conjunto_de (type INSTANCE) (create-accessor read-write)) 
    (multislot Quieren_visitar (type INSTANCE) (create-accessor read-write))   
    (multislot Se_desplaza_en (type INSTANCE) (create-accessor read-write))    
    (multislot Tiene_como_objetivo (type INSTANCE) (create-accessor read-write))
    (multislot Viaja_en (type INSTANCE) (create-accessor read-write))
    (multislot Viajan_por (type INSTANCE) (create-accessor read-write))
    (slot duracion (type INTEGER) (create-accessor read-write))
    (slot presupuestoViaje (type INTEGER) (create-accessor read-write))
  )