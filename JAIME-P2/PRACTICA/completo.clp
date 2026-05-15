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

; ---------------------------------------------------------
; INSTANCIAS
; ---------------------------------------------------------

  (definstances instancias-viaje

  ; TEMATICAS
  (cultura     of Tematica)
  (playa       of Tematica)
  (montana     of Tematica)
  (romantica   of Tematica)
  (aventura    of Tematica)
  (gastronomia of Tematica)
  (fiesta      of Tematica)

  ; IDIOMAS
  (espanol   of Idioma)
  (frances   of Idioma)
  (ingles    of Idioma)
  (italiano  of Idioma)
  (portugues of Idioma)
  (aleman    of Idioma)
  (japones   of Idioma)

  ; OBJETIVOS
  (obj-descanso    of Objetivo)
  (obj-cultural    of Objetivo)
  (obj-diversion   of Objetivo)
  (obj-romantico   of Objetivo)
  (obj-aventura    of Objetivo)
  (obj-gastronomia of Objetivo)
  (obj-negocios    of Objetivo)
  (obj-familiar    of Objetivo)
  (obj-mochilero   of Objetivo)

  ; TEMPORADAS
  (temp-verano    of Temporada (clima CALIDO)   (turismo alto))
  (temp-invierno  of Temporada (clima MUY-FRIO) (turismo bajo))
  (temp-primavera of Temporada (clima TEMPLADO) (turismo medio))
  (temp-otono     of Temporada (clima FRIO)     (turismo medio))

  ; MATERIAL
  (material-montana  of Material)
  (material-playa    of Material)
  (material-invierno of Material)
  (material-urbano   of Material)
  (material-camping  of Material)

  ; EVENTOS ESPECIALES

  ; ESPAÑA
  (FeriaAbrilSevilla  of Eventos_especiales (precioEntrada 0)(esAccesible si)(puntuacion alta)(tiempo 5h)(aptoParaNinos si))
  (SanFermines        of Eventos_especiales (precioEntrada 0)(esAccesible si)(puntuacion alta)(tiempo 24h)(aptoParaNinos no))
  (Tomatina           of Eventos_especiales (precioEntrada 12)(esAccesible no)(puntuacion media)(tiempo 3h)(aptoParaNinos no))
  (LasFallasValencia  of Eventos_especiales (precioEntrada 0)(esAccesible si)(puntuacion alta)(tiempo 12h)(aptoParaNinos si))
  
  ; BRASIL
  (CarnavalRio        of Eventos_especiales (precioEntrada 50)(esAccesible si)(puntuacion alta)(tiempo 8h)(aptoParaNinos no))

  ; ALEMANIA
  (OktoberfestMunich  of Eventos_especiales (precioEntrada 0)(esAccesible si)(puntuacion alta)(tiempo 6h)(aptoParaNinos no))
 
  ; EEUU
  (AnoNuevoTimesSquare of Eventos_especiales (precioEntrada 0)(esAccesible si)(puntuacion alta)(tiempo 10h)(aptoParaNinos si))

  ; JAPON
  (HanamiTokyo        of Eventos_especiales (precioEntrada 0)(esAccesible si)(puntuacion alta)(tiempo 4h)(aptoParaNinos si))

  ; FRANCIA
  (LucesNavidadParis  of Eventos_especiales (precioEntrada 0)(esAccesible si)(puntuacion media)(tiempo 3h)(aptoParaNinos si))

  ; ITALIA
  (CarnavalVenecia    of Eventos_especiales (precioEntrada 0)(esAccesible no)(puntuacion alta)(tiempo 5h)(aptoParaNinos no))

  (FinalChampions     of Eventos_especiales (precioEntrada 300)(esAccesible si)(puntuacion alta)(tiempo 4h)(aptoParaNinos si))

  ; PUNTOS DE INTERES
  
  ; BARCELONA
  (SagradaFamilia of Punto_de_Interes (precioEntrada 26)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (ParcGuell of Punto_de_Interes (precioEntrada 10)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (CampNou of Punto_de_Interes (precioEntrada 28)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (BarrioGotico of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (BeachBarcelona of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion media)(aptoParaNinos si))
  (MNAC of Punto_de_Interes (precioEntrada 12)(esAccessible si)(puntuacion alta)(aptoParaNinos no))

  ; MADRID
  (MuseoPrado of Punto_de_Interes (precioEntrada 15)(esAccessible si)(puntuacion alta)(aptoParaNinos no))
  (RetiroPark of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (PalacioReal of Punto_de_Interes (precioEntrada 12)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (MercadoSanMiguel of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (BernabeuTour of Punto_de_Interes (precioEntrada 25)(esAccessible si)(puntuacion media)(aptoParaNinos si))
  (ReinaSOfia of Punto_de_Interes (precioEntrada 10)(esAccessible si)(puntuacion alta)(aptoParaNinos no))

  ; SEVILLA
  (CatedralSevilla of Punto_de_Interes (precioEntrada 10)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (AlcazarSevilla of Punto_de_Interes (precioEntrada 12)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (BarrioTriana of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (PlazaEspana of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (TorreDelOro of Punto_de_Interes (precioEntrada 3)(esAccessible si)(puntuacion media)(aptoParaNinos si))

  ; VALENCIA
  (CiudadArtesCiencias of Punto_de_Interes (precioEntrada 38)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (PlayaMalvarrosa of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion media)(aptoParaNinos si))
  (MercadoCentral of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (CatedralValencia of Punto_de_Interes (precioEntrada 8)(esAccessible si)(puntuacion media)(aptoParaNinos si))
  (BiopagoValencia of Punto_de_Interes (precioEntrada 20)(esAccessible si)(puntuacion alta)(aptoParaNinos si))

  ; SAN SEBASTIAN
  (PlayaConcha of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (ParteVieja of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (PintosSS of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (MonteIgeldo of Punto_de_Interes (precioEntrada 5)(esAccessible si)(puntuacion media)(aptoParaNinos si))
  (AcuarioSS of Punto_de_Interes (precioEntrada 15)(esAccessible si)(puntuacion alta)(aptoParaNinos si))

  ; GRANADA
  (Alhambra of Punto_de_Interes (precioEntrada 15)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (Albaicin of Punto_de_Interes (precioEntrada 0)(esAccessible no)(puntuacion alta)(aptoParaNinos no))
  (CathedralGranada of Punto_de_Interes (precioEntrada 5)(esAccessible si)(puntuacion media)(aptoParaNinos si))
  (SierraNevadaGranada of Punto_de_Interes (precioEntrada 0)(esAccessible no)(puntuacion alta)(aptoParaNinos no))
  (TablaosFlamenco of Punto_de_Interes (precioEntrada 30)(esAccessible si)(puntuacion alta)(aptoParaNinos no))

  ; PARIS
  (TorreEiffel of Punto_de_Interes (precioEntrada 28)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (Louvre of Punto_de_Interes (precioEntrada 17)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (Montmartre of Punto_de_Interes (precioEntrada 0)(esAccessible no)(puntuacion alta)(aptoParaNinos no))
  (VersaillesP of Punto_de_Interes (precioEntrada 20)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (ChampsElysees of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion media)(aptoParaNinos si))
  (MuseeOrsay of Punto_de_Interes (precioEntrada 14)(esAccessible si)(puntuacion alta)(aptoParaNinos no))

  ; ROMA
  (Coliseo of Punto_de_Interes (precioEntrada 18)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (VaticanoCiudad of Punto_de_Interes (precioEntrada 20)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (FontanaTrevi of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (ForoRomano of Punto_de_Interes (precioEntrada 16)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (PlazaNavona of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (GaleriaGallese of Punto_de_Interes (precioEntrada 15)(esAccessible si)(puntuacion media)(aptoParaNinos no))

  ; AMSTERDAM
  (RijksmuseumA of Punto_de_Interes (precioEntrada 22)(esAccessible si)(puntuacion alta)(aptoParaNinos no))
  (CasaAnnaFrank of Punto_de_Interes (precioEntrada 14)(esAccessible si)(puntuacion alta)(aptoParaNinos no))
  (CanalesAmsterdam of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (VondelPark of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion media)(aptoParaNinos si))
  (BarrioRojoA of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion media)(aptoParaNinos no))

  ; LISBOA
  (TorreBelem of Punto_de_Interes (precioEntrada 6)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (MonasterioJeronimos of Punto_de_Interes (precioEntrada 10)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (BarrioAlfama of Punto_de_Interes (precioEntrada 0)(esAccessible no)(puntuacion alta)(aptoParaNinos no))
  (CastilloSJorge of Punto_de_Interes (precioEntrada 10)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (PlazoComercioL of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion media)(aptoParaNinos si))

  ; PRAGA
  (CastilloPraga of Punto_de_Interes (precioEntrada 15)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (PuenteCarlos of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (PlazaVenceslao of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion media)(aptoParaNinos si))
  (BarriojudIo of Punto_de_Interes (precioEntrada 12)(esAccessible si)(puntuacion alta)(aptoParaNinos no))
  (CatedralSanVito of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))

  ; BERLIN
  (PuertaBrandeburgo of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (MuroBerlin of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (Reichstag of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (MuseoPergamo of Punto_de_Interes (precioEntrada 19)(esAccessible si)(puntuacion alta)(aptoParaNinos no))
  (CheckpointCharlie of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion media)(aptoParaNinos si))

  ; TOKYO
  (TorreTokyoT of Punto_de_Interes (precioEntrada 12)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (TemploSensoji of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (ShinjukuT of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (AkihabaraTok of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion media)(aptoParaNinos si))
  (MonteFujiTok of Punto_de_Interes (precioEntrada 5)(esAccessible no)(puntuacion alta)(aptoParaNinos no))
  (DisneySea of Punto_de_Interes (precioEntrada 80)(esAccessible si)(puntuacion alta)(aptoParaNinos si))

  ; NUEVA YORK
  (EstatuaLibertad of Punto_de_Interes (precioEntrada 25)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (CentralPark of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (TimesSquare of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (EmpireState of Punto_de_Interes (precioEntrada 40)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (MetropolitanNY of Punto_de_Interes (precioEntrada 25)(esAccessible si)(puntuacion alta)(aptoParaNinos no))

  ; BUENOS AIRES
  (TeatroColon of Punto_de_Interes (precioEntrada 15)(esAccessible si)(puntuacion alta)(aptoParaNinos no))
  (ObeliscoBA of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion media)(aptoParaNinos si))
  (Caminito of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (Recoleta of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion media)(aptoParaNinos si))
  (PuertoMaderaBA of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion media)(aptoParaNinos si))

  ; EL CAIRO
  (PiramidesGiza of Punto_de_Interes (precioEntrada 20)(esAccessible no)(puntuacion alta)(aptoParaNinos no))
  (MuseoEgipcio of Punto_de_Interes (precioEntrada 12)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (KhanElKhalili of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (CiudadelaCairo of Punto_de_Interes (precioEntrada 8)(esAccessible si)(puntuacion media)(aptoParaNinos si))

  ; CIUDAD DEL CABO
  (TableMountain of Punto_de_Interes (precioEntrada 22)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (RobbenIsland of Punto_de_Interes (precioEntrada 30)(esAccessible si)(puntuacion alta)(aptoParaNinos no))
  (CapePoint of Punto_de_Interes (precioEntrada 15)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (BouldersBeach of Punto_de_Interes (precioEntrada 10)(esAccessible si)(puntuacion alta)(aptoParaNinos si))

  ; SYDNEY
  (OperaHouse of Punto_de_Interes (precioEntrada 35)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (BondiBeach of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (HarbourBridge of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (TarongaZoo of Punto_de_Interes (precioEntrada 45)(esAccessible si)(puntuacion alta)(aptoParaNinos si))

  ; BANGKOK
  (GranPalacioBK of Punto_de_Interes (precioEntrada 15)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (WatArun of Punto_de_Interes (precioEntrada 5)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (MercadoChatuchak of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (RioChaoPhrayaBK of Punto_de_Interes (precioEntrada 10)(esAccessible si)(puntuacion media)(aptoParaNinos si))

  ; CIUDADES ESPANOLAS

  (Barcelona of Ciudad
    (pais "Espana")
    (precioMedio 130)
    (estiloVida "cosmopolita")
    (Tipo_de_ciudad [cultura] [playa] [gastronomia])
    (Hablan_en [espanol])
    (Contienen [SagradaFamilia] [ParcGuell] [CampNou] [BarrioGotico] [BeachBarcelona] [MNAC])
    (Tiene_un_conjunto_de [HotelArtsBarcelona] [HostalRamblasBarcelona] [ApartBarcelona1])
    (Requiere_de [material-urbano] [material-playa])
    (Se_celebra [FinalChampions]))

  (Madrid of Ciudad
    (pais "Espana")
    (precioMedio 110)
    (estiloVida "animada")
    (Tipo_de_ciudad [cultura] [gastronomia] [fiesta])
    (Hablan_en [espanol])
    (Contienen [MuseoPrado] [RetiroPark] [PalacioReal] [MercadoSanMiguel] [BernabeuTour] [ReinaSOfia])
    (Tiene_un_conjunto_de [HotelWMadrid] [HostalMadridCentro] [ApartMadrid1])
    (Requiere_de [material-urbano])
    (Se_celebra))

  (Sevilla of Ciudad
    (pais "Espana")
    (precioMedio 85)
    (estiloVida "tradicional")
    (Tipo_de_ciudad [cultura] [gastronomia] [romantica])
    (Hablan_en [espanol])
    (Contienen [CatedralSevilla] [AlcazarSevilla] [BarrioTriana] [PlazaEspana] [TorreDelOro])
    (Tiene_un_conjunto_de [HotelAlfonsXIII] [HostalSevillaCentro] [ApartSevilla1])
    (Requiere_de [material-urbano])
    (Se_celebra [FeriaAbrilSevilla]))

  (Valencia of Ciudad
    (pais "Espana")
    (precioMedio 90)
    (estiloVida "mediterranea")
    (Tipo_de_ciudad [playa] [gastronomia] [cultura])
    (Hablan_en [espanol])
    (Contienen [CiudadArtesCiencias] [PlayaMalvarrosa] [MercadoCentral] [CatedralValencia] [BiopagoValencia])
    (Tiene_un_conjunto_de [HotelSheratonValencia] [HostalValenciaCentro] [ApartValencia1])
    (Requiere_de [material-playa] [material-urbano])
    (Se_celebra [LasFallasValencia]))

  (SanSebastian of Ciudad
    (pais "Espana")
    (precioMedio 140)
    (estiloVida "elegante")
    (Tipo_de_ciudad [gastronomia] [playa] [cultura])
    (Hablan_en [espanol])
    (Contienen [PlayaConcha] [ParteVieja] [PintosSS] [MonteIgeldo] [AcuarioSS])
    (Tiene_un_conjunto_de [HotelMariaDristinasSS] [HostalSSCentro] [ApartSS1])
    (Requiere_de [material-playa] [material-invierno])
    (Se_celebra [SanFermines]))

  (Granada of Ciudad
    (pais "Espana")
    (precioMedio 75)
    (estiloVida "historica")
    (Tipo_de_ciudad [cultura] [romantica] [montana])
    (Hablan_en [espanol])
    (Contienen [Alhambra] [AlbaicIn] [CathedralGranada] [SierraNevadaGranada] [TablaosFlamenco])
    (Tiene_un_conjunto_de [HotelParadorGranada] [HostalGranadaCentro] [ApartGranada1])
    (Requiere_de [material-montana] [material-invierno])
    (Se_celebra))

  ; CIUDADES EUROPA

  (Paris of Ciudad
    (pais "Francia")
    (precioMedio 190)
    (estiloVida "romantica")
    (Tipo_de_ciudad [romantica] [cultura] [gastronomia])
    (Hablan_en [frances])
    (Contienen [TorreEiffel] [Louvre] [Montmartre] [VersaillesP] [ChampsElysees] [MuseeOrsay])
    (Tiene_un_conjunto_de [HotelRitzParis] [HostalParisCentro] [ApartParis1])
    (Requiere_de [material-urbano])
    (Se_celebra [LucesNavidadParis]))

  (Roma of Ciudad
    (pais "Italia")
    (precioMedio 150)
    (estiloVida "historica")
    (Tipo_de_ciudad [cultura] [gastronomia] [romantica])
    (Hablan_en [italiano])
    (Contienen [Coliseo] [VaticanoCiudad] [FontanaTrevi] [ForoRomano] [PlazaNavona] [GaleriaGallese])
    (Tiene_un_conjunto_de [HotelExcelsiorRoma] [HostalRomaCentro] [ApartRoma1])
    (Requiere_de [material-urbano])
    (Se_celebra))

  (Amsterdam of Ciudad
    (pais "Holanda")
    (precioMedio 170)
    (estiloVida "liberal")
    (Tipo_de_ciudad [cultura] [fiesta] [aventura])
    (Hablan_en [ingles])
    (Contienen [RijksmuseumA] [CasaAnnaFrank] [CanalesAmsterdam] [VondelPark] [BarrioRojoA])
    (Tiene_un_conjunto_de [HotelPulitzerAmsterdam] [HostalAmsterdamCentro] [ApartAmsterdam1])
    (Requiere_de [material-urbano])
    (Se_celebra))

  (Lisboa of Ciudad
    (pais "Portugal")
    (precioMedio 95)
    (estiloVida "nostalgica")
    (Tipo_de_ciudad [cultura] [gastronomia] [romantica])
    (Hablan_en [portugues])
    (Contienen [TorreBelem] [MonasterioJeronimos] [BarrioAlfama] [CastilloSJorge] [PlazoComercioL])
    (Tiene_un_conjunto_de [HotelBairroAltoLisboa] [HostalLisboaCentro] [ApartLisboa1])
    (Requiere_de [material-urbano])
    (Se_celebra))

  (Praga of Ciudad
    (pais "Republica Checa")
    (precioMedio 80)
    (estiloVida "medieval")
    (Tipo_de_ciudad [cultura] [fiesta] [romantica])
    (Hablan_en [ingles])
    (Contienen [CastilloPraga] [PuenteCarlos] [PlazaVenceslao] [BarriojudIo] [CatedralSanVito])
    (Tiene_un_conjunto_de [HotelFourSeasonsPraga] [HostalPragaCentro] [ApartPraga1])
    (Requiere_de [material-urbano])
    (Se_celebra))

  (Berlin of Ciudad
    (pais "Alemania")
    (precioMedio 120)
    (estiloVida "alternativa")
    (Tipo_de_ciudad [cultura] [fiesta])
    (Hablan_en [aleman] [ingles])
    (Contienen [PuertaBrandeburgo] [MuroBerlin] [Reichstag] [MuseoPergamo] [CheckpointCharlie])
    (Tiene_un_conjunto_de [HotelAdlonBerlin] [HostalBerlinMitte] [ApartBerlin1])
    (Requiere_de [material-urbano])
    (Se_celebra [OktoberfestMunich]))

  ; CIUDADES OCEANIA

  (Sydney of Ciudad
    (pais "Australia")
    (precioMedio 180)
    (estiloVida "relajada-playera")
    (Tipo_de_ciudad [playa] [cultura] [aventura])
    (Hablan_en [ingles])
    (Contienen [OperaHouse] [BondiBeach] [HarbourBridge] [TarongaZoo])
    (Tiene_un_conjunto_de [HotelParkHyattSyd] [HostalSydSurf] [ApartSyd1])
    (Requiere_de [material-urbano] [material-playa])
    (Se_celebra))

  ; CIUDADES AMERICA

  (NuevaYork of Ciudad
    (pais "EEUU")
    (precioMedio 250)
    (estiloVida "frenetica")
    (Tipo_de_ciudad [cultura] [gastronomia] [aventura])
    (Hablan_en [ingles])
    (Contienen [EstatuaLibertad] [CentralPark] [TimesSquare] [EmpireState] [MetropolitanNY])
    (Tiene_un_conjunto_de [HotelMarriottNY] [HostalNYCentral] [ApartNY1])
    (Requiere_de [material-urbano])
    (Se_celebra [AnoNuevoTimesSquare]))

  (BuenosAires of Ciudad
    (pais "Argentina")
    (precioMedio 90)
    (estiloVida "bohemia")
    (Tipo_de_ciudad [cultura] [gastronomia] [romantica])
    (Hablan_en [espanol])
    (Contienen [TeatroColon] [ObeliscoBA] [Caminito] [Recoleta] [PuertoMaderaBA])
    (Tiene_un_conjunto_de [HotelAlvearBA] [HostalPalermo] [ApartBA1])
    (Requiere_de [material-urbano])
    (Se_celebra [CarnavalRio]))

  ; CIUDADES AFRICA

  (ElCairo of Ciudad
    (pais "Egipto")
    (precioMedio 60)
    (estiloVida "caotica-historica")
    (Tipo_de_ciudad [cultura] [aventura])
    (Hablan_en [ingles])
    (Contienen [PiramidesGiza] [MuseoEgipcio] [KhanElKhalili] [CiudadelaCairo])
    (Tiene_un_conjunto_de [HotelRitzCairo] [HostalCairoOld] [ApartCairo1])
    (Requiere_de [material-urbano])
    (Se_celebra))

  (CiudadDelCabo of Ciudad
    (pais "Sudafrica")
    (precioMedio 110)
    (estiloVida "natural")
    (Tipo_de_ciudad [aventura] [playa] [gastronomia])
    (Hablan_en [ingles])
    (Contienen [TableMountain] [RobbenIsland] [CapePoint] [BouldersBeach])
    (Tiene_un_conjunto_de [HotelTheSilof] [HostalCapeBackpackers] [ApartCape1])
    (Requiere_de [material-urbano] [material-playa])
    (Se_celebra))

  ; CIUDADES ASIA

  (Bangkok of Ciudad
    (pais "Tailandia")
    (precioMedio 50)
    (estiloVida "exotica")
    (Tipo_de_ciudad [gastronomia] [cultura] [aventura])
    (Hablan_en [ingles])
    (Contienen [GranPalacioBK] [WatArun] [MercadoChatuchak] [RioChaoPhrayaBK])
    (Tiene_un_conjunto_de [HotelMandarinBK] [HostalBKStreet] [ApartBK1])
    (Requiere_de [material-urbano])
    (Se_celebra))

  (Tokyo of Ciudad
    (pais "Japon")
    (precioMedio 200)
    (estiloVida "futurista")
    (Tipo_de_ciudad [cultura] [gastronomia] [aventura])
    (Hablan_en [japones])
    (Contienen [TorreTokyoT] [TemploSensoji] [ShinjukuT] [AkihabaraTok] [MonteFujiTok] [DisneySea])
    (Tiene_un_conjunto_de [HotelParkHyattTokyo] [HostalTokyoCentro] [ApartTokyo1])
    (Requiere_de [material-urbano])
    (Se_celebra [HanamiTokyo]))

  ; ALOJAMIENTOS

  ; BARCELONA
  (HotelArtsBarcelona of Hotel (calidadAlojamiento alta)(precioAlojamiento 220)(servicio full)(apartamentoFamiliar no)(ambiente lujo))
  (HostalRamblasBarcelona of Hostal (calidadAlojamiento media)(precioAlojamiento 55)(habitacionCompartida si)(ambiente social)(apartamentoFamiliar no))
  (ApartBarcelona1 of Apartamento (calidadAlojamiento media)(precioAlojamiento 110)(numHabitaciones 3)(apartamentoFamiliar si)(ambiente familiar))

  ; MADRID
  (HotelWMadrid of Hotel (calidadAlojamiento alta)(precioAlojamiento 200)(servicio full)(apartamentoFamiliar no)(ambiente lujo))
  (HostalMadridCentro of Hostal (calidadAlojamiento media)(precioAlojamiento 45)(habitacionCompartida no)(ambiente tranquilo)(apartamentoFamiliar no))
  (ApartMadrid1 of Apartamento (calidadAlojamiento media)(precioAlojamiento 95)(numHabitaciones 2)(apartamentoFamiliar si)(ambiente familiar))

  ; SEVILLA
  (HotelAlfonsXIII of Hotel (calidadAlojamiento alta)(precioAlojamiento 180)(servicio full)(apartamentoFamiliar no)(ambiente lujo))
  (HostalSevillaCentro of Hostal (calidadAlojamiento baja)(precioAlojamiento 35)(habitacionCompartida si)(ambiente social)(apartamentoFamiliar no))
  (ApartSevilla1 of Apartamento (calidadAlojamiento media)(precioAlojamiento 70)(numHabitaciones 2)(apartamentoFamiliar si)(ambiente familiar))

  ; VALENCIA
  (HotelSheratonValencia of Hotel (calidadAlojamiento alta)(precioAlojamiento 160)(servicio full)(apartamentoFamiliar no)(ambiente lujo))
  (HostalValenciaCentro of Hostal (calidadAlojamiento media)(precioAlojamiento 40)(habitacionCompartida no)(ambiente tranquilo)(apartamentoFamiliar no))
  (ApartValencia1 of Apartamento (calidadAlojamiento media)(precioAlojamiento 80)(numHabitaciones 2)(apartamentoFamiliar si)(ambiente familiar))

  ; SAN SEBASTIAN
  (HotelMariaDristinasSS of Hotel (calidadAlojamiento alta)(precioAlojamiento 300)(servicio full)(apartamentoFamiliar no)(ambiente lujo))
  (HostalSSCentro of Hostal (calidadAlojamiento media)(precioAlojamiento 55)(habitacionCompartida no)(ambiente tranquilo)(apartamentoFamiliar no))
  (ApartSS1 of Apartamento (calidadAlojamiento media)(precioAlojamiento 130)(numHabitaciones 2)(apartamentoFamiliar si)(ambiente familiar))

  ; GRANADA
  (HotelParadorGranada of Hotel (calidadAlojamiento alta)(precioAlojamiento 170)(servicio full)(apartamentoFamiliar no)(ambiente lujo))
  (HostalGranadaCentro of Hostal (calidadAlojamiento baja)(precioAlojamiento 30)(habitacionCompartida si)(ambiente social)(apartamentoFamiliar no))
  (ApartGranada1 of Apartamento (calidadAlojamiento media)(precioAlojamiento 60)(numHabitaciones 2)(apartamentoFamiliar si)(ambiente familiar))

  ; PARIS
  (HotelRitzParis of Hotel (calidadAlojamiento alta)(precioAlojamiento 500)(servicio full)(apartamentoFamiliar no)(ambiente lujo))
  (HostalParisCentro of Hostal (calidadAlojamiento media)(precioAlojamiento 65)(habitacionCompartida si)(ambiente social)(apartamentoFamiliar no))
  (ApartParis1 of Apartamento (calidadAlojamiento media)(precioAlojamiento 150)(numHabitaciones 2)(apartamentoFamiliar si)(ambiente familiar))

  ; ROMA
  (HotelExcelsiorRoma of Hotel (calidadAlojamiento alta)(precioAlojamiento 280)(servicio full)(apartamentoFamiliar no)(ambiente lujo))
  (HostalRomaCentro of Hostal (calidadAlojamiento media)(precioAlojamiento 50)(habitacionCompartida si)(ambiente social)(apartamentoFamiliar no))
  (ApartRoma1 of Apartamento (calidadAlojamiento media)(precioAlojamiento 120)(numHabitaciones 2)(apartamentoFamiliar si)(ambiente familiar))

  ; AMSTERDAM
  (HotelPulitzerAmsterdam of Hotel (calidadAlojamiento alta)(precioAlojamiento 260)(servicio full)(apartamentoFamiliar no)(ambiente lujo))
  (HostalAmsterdamCentro of Hostal (calidadAlojamiento media)(precioAlojamiento 55)(habitacionCompartida si)(ambiente social)(apartamentoFamiliar no))
  (ApartAmsterdam1 of Apartamento (calidadAlojamiento media)(precioAlojamiento 130)(numHabitaciones 2)(apartamentoFamiliar si)(ambiente familiar))

  ; LISBOA
  (HotelBairroAltoLisboa of Hotel (calidadAlojamiento alta)(precioAlojamiento 190)(servicio full)(apartamentoFamiliar no)(ambiente lujo))
  (HostalLisboaCentro of Hostal (calidadAlojamiento media)(precioAlojamiento 40)(habitacionCompartida si)(ambiente social)(apartamentoFamiliar no))
  (ApartLisboa1 of Apartamento (calidadAlojamiento media)(precioAlojamiento 90)(numHabitaciones 2)(apartamentoFamiliar si)(ambiente familiar))

  ; PRAGA
  (HotelFourSeasonsPraga of Hotel (calidadAlojamiento alta)(precioAlojamiento 210)(servicio full)(apartamentoFamiliar no)(ambiente lujo))
  (HostalPragaCentro of Hostal (calidadAlojamiento baja)(precioAlojamiento 25)(habitacionCompartida si)(ambiente social)(apartamentoFamiliar no))
  (ApartPraga1 of Apartamento (calidadAlojamiento media)(precioAlojamiento 75)(numHabitaciones 2)(apartamentoFamiliar si)(ambiente familiar))

  ; BERLIN
  (HotelAdlonBerlin of Hotel (calidadAlojamiento alta)(precioAlojamiento 240)(servicio full)(apartamentoFamiliar no)(ambiente lujo))
  (HostalBerlinMitte of Hostal (calidadAlojamiento media)(precioAlojamiento 45)(habitacionCompartida si)(ambiente social)(apartamentoFamiliar no))
  (ApartBerlin1 of Apartamento (calidadAlojamiento media)(precioAlojamiento 110)(numHabitaciones 2)(apartamentoFamiliar si)(ambiente familiar))

  ; TOKYO
  (HotelParkHyattTokyo of Hotel (calidadAlojamiento alta)(precioAlojamiento 450)(servicio full)(apartamentoFamiliar no)(ambiente lujo))
  (HostalTokyoCentro of Hostal (calidadAlojamiento media)(precioAlojamiento 60)(habitacionCompartida si)(ambiente social)(apartamentoFamiliar no))
  (ApartTokyo1 of Apartamento (calidadAlojamiento media)(precioAlojamiento 180)(numHabitaciones 2)(apartamentoFamiliar si)(ambiente familiar))

  ; NUEVA YORK
  (HotelMarriottNY of Hotel (calidadAlojamiento alta)(precioAlojamiento 350)(servicio full)(apartamentoFamiliar no)(ambiente lujo))
  (HostalNYCentral of Hostal (calidadAlojamiento media)(precioAlojamiento 80)(habitacionCompartida si)(ambiente social)(apartamentoFamiliar no))
  (ApartNY1 of Apartamento (calidadAlojamiento alta)(precioAlojamiento 250)(numHabitaciones 2)(apartamentoFamiliar si)(ambiente familiar))

  ; BUENOS AIRES
  (HotelAlvearBA of Hotel (calidadAlojamiento alta)(precioAlojamiento 150)(servicio full)(apartamentoFamiliar no)(ambiente lujo))
  (HostalPalermo of Hostal (calidadAlojamiento media)(precioAlojamiento 25)(habitacionCompartida si)(ambiente social)(apartamentoFamiliar no))
  (ApartBA1 of Apartamento (calidadAlojamiento media)(precioAlojamiento 60)(numHabitaciones 2)(apartamentoFamiliar si)(ambiente familiar))

  ; EL CAIRO
  (HotelRitzCairo of Hotel (calidadAlojamiento alta)(precioAlojamiento 120)(servicio full)(apartamentoFamiliar no)(ambiente lujo))
  (HostalCairoOld of Hostal (calidadAlojamiento baja)(precioAlojamiento 15)(habitacionCompartida si)(ambiente social)(apartamentoFamiliar no))
  (ApartCairo1 of Apartamento (calidadAlojamiento media)(precioAlojamiento 45)(numHabitaciones 2)(apartamentoFamiliar si)(ambiente familiar))

  ; CIUDAD DEL CABO
  (HotelTheSilof of Hotel (calidadAlojamiento alta)(precioAlojamiento 210)(servicio full)(apartamentoFamiliar no)(ambiente lujo))
  (HostalCapeBackpackers of Hostal (calidadAlojamiento media)(precioAlojamiento 30)(habitacionCompartida si)(ambiente social)(apartamentoFamiliar no))
  (ApartCape1 of Apartamento (calidadAlojamiento media)(precioAlojamiento 85)(numHabitaciones 2)(apartamentoFamiliar si)(ambiente familiar))

  ; SYDNEY
  (HotelParkHyattSyd of Hotel (calidadAlojamiento alta)(precioAlojamiento 290)(servicio full)(apartamentoFamiliar no)(ambiente lujo))
  (HostalSydSurf of Hostal (calidadAlojamiento media)(precioAlojamiento 55)(habitacionCompartida si)(ambiente social)(apartamentoFamiliar no))
  (ApartSyd1 of Apartamento (calidadAlojamiento alta)(precioAlojamiento 160)(numHabitaciones 2)(apartamentoFamiliar si)(ambiente familiar))

  ; BANGKOK
  (HotelMandarinBK of Hotel (calidadAlojamiento alta)(precioAlojamiento 180)(servicio full)(apartamentoFamiliar no)(ambiente lujo))
  (HostalBKStreet of Hostal (calidadAlojamiento media)(precioAlojamiento 20)(habitacionCompartida si)(ambiente social)(apartamentoFamiliar no))
  (ApartBK1 of Apartamento (calidadAlojamiento media)(precioAlojamiento 55)(numHabitaciones 2)(apartamentoFamiliar si)(ambiente familiar))

  ; TRANSPORTES — AVIONES
  (VueloMadridBarcelona of Avion (precioTransporte 80)(duracionViaje corta)(accesibilidad media) (claseAsiento turista)(Origen [Madrid])(Destino [Barcelona]))
  (VueloMadridParis of Avion (precioTransporte 120)(duracionViaje corta)(accesibilidad media) (claseAsiento turista)(Origen [Madrid])(Destino [Paris]))
  (VueloMadridRoma of Avion (precioTransporte 110)(duracionViaje corta)(accesibilidad media) (claseAsiento turista)(Origen [Madrid])(Destino [Roma]))
  (VueloMadridAmsterdam of Avion (precioTransporte 130)(duracionViaje corta)(accesibilidad media) (claseAsiento turista)(Origen [Madrid])(Destino [Amsterdam]))
  (VueloMadridLisboa of Avion (precioTransporte 90)(duracionViaje corta)(accesibilidad media) (claseAsiento turista)(Origen [Madrid])(Destino [Lisboa]))
  (VueloMadridPraga of Avion (precioTransporte 140)(duracionViaje media)(accesibilidad media) (claseAsiento turista)(Origen [Madrid])(Destino [Praga]))
  (VueloMadridBerlin of Avion (precioTransporte 150)(duracionViaje corta)(accesibilidad media) (claseAsiento turista)(Origen [Madrid])(Destino [Berlin]))
  (VueloMadridTokyo of Avion (precioTransporte 750)(duracionViaje muy-larga)(accesibilidad media) (claseAsiento turista)(Origen [Madrid])(Destino [Tokyo]))
  (VueloMadridNY of Avion (precioTransporte 600)(duracionViaje larga)(accesibilidad media) (claseAsiento turista)(Origen [Madrid])(Destino [NuevaYork]))
  (VueloMadridBA of Avion (precioTransporte 850)(duracionViaje muy-larga)(accesibilidad media) (claseAsiento turista)(Origen [Madrid])(Destino [BuenosAires]))
  (VueloMadridCairo of Avion (precioTransporte 350)(duracionViaje media)(accesibilidad media) (claseAsiento turista)(Origen [Madrid])(Destino [ElCairo]))
  (VueloMadridCape of Avion (precioTransporte 900)(duracionViaje muy-larga)(accesibilidad media) (claseAsiento turista)(Origen [Madrid])(Destino [CiudadDelCabo]))
  (VueloMadridSydney of Avion (precioTransporte 1200)(duracionViaje muy-larga)(accesibilidad media) (claseAsiento turista)(Origen [Madrid])(Destino [Sydney]))
  (VueloMadridBangkok of Avion (precioTransporte 650)(duracionViaje muy-larga)(accesibilidad media) (claseAsiento turista)(Origen [Madrid])(Destino [Bangkok]))

  ; TRANSPORTES — TRENES

  (TrenMadridBarcelona of Tren (precioTransporte 50)(duracionViaje media)(accesibilidad alta) (claseAsiento turista)(Origen [Madrid])(Destino [Barcelona]))
  (TrenMadridSevilla of Tren (precioTransporte 40)(duracionViaje media)(accesibilidad alta) (claseAsiento turista)(Origen [Madrid])(Destino [Sevilla]))
  (TrenMadridValencia of Tren (precioTransporte 35)(duracionViaje media)(accesibilidad alta) (claseAsiento turista)(Origen [Madrid])(Destino [Valencia]))
  (TrenMadridSS of Tren (precioTransporte 55)(duracionViaje media)(accesibilidad alta) (claseAsiento turista)(Origen [Madrid])(Destino [SanSebastian]))
  (TrenMadridParis of Tren (precioTransporte 180)(duracionViaje larga)(accesibilidad alta) (claseAsiento turista)(Origen [Madrid])(Destino [Paris]))
  (TrenParisBerlin of Tren (precioTransporte 120)(duracionViaje media)(accesibilidad alta) (claseAsiento turista)(Origen [Paris])(Destino [Berlin]))

  ; TRANSPORTES — AUTOBUSES

  (AutobusMadridBarcelona of Autobus (precioTransporte 25)(duracionViaje larga)(accesibilidad alta) (claseAsiento turista)(Origen [Madrid])(Destino [Barcelona]))
  (AutobusMadridSevilla of Autobus (precioTransporte 20)(duracionViaje larga)(accesibilidad alta) (claseAsiento turista)(Origen [Madrid])(Destino [Sevilla]))
  (AutobusMadridValencia of Autobus (precioTransporte 18)(duracionViaje media)(accesibilidad alta) (claseAsiento turista)(Origen [Madrid])(Destino [Valencia]))
  (AutobusMadridSS of Autobus (precioTransporte 28)(duracionViaje larga)(accesibilidad alta) (claseAsiento turista)(Origen [Madrid])(Destino [SanSebastian]))
  (AutobusMadridGranada of Autobus (precioTransporte 18)(duracionViaje larga)(accesibilidad alta) (claseAsiento turista)(Origen [Madrid])(Destino [Granada]))
  (AutobusSsevillaGranada of Autobus (precioTransporte 12)(duracionViaje media)(accesibilidad alta) (claseAsiento turista)(Origen [Sevilla])(Destino [Granada]))
  (AutobusMadridLisboa of Autobus (precioTransporte 22)(duracionViaje larga)(accesibilidad alta) (claseAsiento turista)(Origen [Madrid])(Destino [Lisboa]))

  ; TRANSPORTES — COCHES
  
  (CocheAlquilerMadridSegovia of Coche (precioTransporte 45)(duracionViaje corta)(accesibilidad alta) (Origen [Madrid])(Destino [Segovia]))
  (CocheRutaAndalucia of Coche (precioTransporte 120)(duracionViaje media)(accesibilidad alta) (Origen [Sevilla])(Destino [Granada]))

  ; TRANSPORTES — BARCOS

  (FerryAlgecirasTanger of Barco (precioTransporte 40)(duracionViaje corta)(accesibilidad media) (claseAsiento turista)(Origen [Madrid])(Destino [ElCairo]))
  (CruceroBarcelonaRoma of Barco (precioTransporte 250)(duracionViaje larga)(accesibilidad alta) (claseAsiento primera)(Origen [Barcelona])(Destino [Roma]))
  (CruceroNilo of Barco (precioTransporte 300)(duracionViaje media)(accesibilidad media) (claseAsiento primera)(Origen [ElCairo])(Destino [ElCairo]))

  ; TRANSPORTES DE VUELTA (INVERSOS)
  (VueloBarcelonaMadrid of Avion (precioTransporte 80)(duracionViaje corta)(accesibilidad media) (claseAsiento turista)(Origen [Barcelona])(Destino [Madrid]))
  (VueloParisMadrid of Avion (precioTransporte 120)(duracionViaje corta)(accesibilidad media) (claseAsiento turista)(Origen [Paris])(Destino [Madrid]))
  (VueloRomaMadrid of Avion (precioTransporte 110)(duracionViaje corta)(accesibilidad media) (claseAsiento turista)(Origen [Roma])(Destino [Madrid]))
  (VueloAmsterdamMadrid of Avion (precioTransporte 130)(duracionViaje corta)(accesibilidad media) (claseAsiento turista)(Origen [Amsterdam])(Destino [Madrid]))
  (VueloLisboaMadrid of Avion (precioTransporte 90)(duracionViaje corta)(accesibilidad media) (claseAsiento turista)(Origen [Lisboa])(Destino [Madrid]))
  (VueloPragaMadrid of Avion (precioTransporte 140)(duracionViaje media)(accesibilidad media) (claseAsiento turista)(Origen [Praga])(Destino [Madrid]))
  (VueloBerlinMadrid of Avion (precioTransporte 150)(duracionViaje corta)(accesibilidad media) (claseAsiento turista)(Origen [Berlin])(Destino [Madrid]))
  (VueloTokyoMadrid of Avion (precioTransporte 750)(duracionViaje muy-larga)(accesibilidad media) (claseAsiento turista)(Origen [Tokyo])(Destino [Madrid]))
  (VueloNYMadrid of Avion (precioTransporte 600)(duracionViaje larga)(accesibilidad media) (claseAsiento turista)(Origen [NuevaYork])(Destino [Madrid]))
  (VueloBAMadrid of Avion (precioTransporte 850)(duracionViaje muy-larga)(accesibilidad media) (claseAsiento turista)(Origen [BuenosAires])(Destino [Madrid]))
  (VueloCairoMadrid of Avion (precioTransporte 350)(duracionViaje media)(accesibilidad media) (claseAsiento turista)(Origen [ElCairo])(Destino [Madrid]))
  (VueloCapeMadrid of Avion (precioTransporte 900)(duracionViaje muy-larga)(accesibilidad media) (claseAsiento turista)(Origen [CiudadDelCabo])(Destino [Madrid]))
  (VueloSydneyMadrid of Avion (precioTransporte 1200)(duracionViaje muy-larga)(accesibilidad media) (claseAsiento turista)(Origen [Sydney])(Destino [Madrid]))
  (VueloBangkokMadrid of Avion (precioTransporte 650)(duracionViaje muy-larga)(accesibilidad media) (claseAsiento turista)(Origen [Bangkok])(Destino [Madrid]))

  (TrenBarcelonaMadrid of Tren (precioTransporte 50)(duracionViaje media)(accesibilidad alta) (claseAsiento turista)(Origen [Barcelona])(Destino [Madrid]))
  (TrenSevillaMadrid of Tren (precioTransporte 40)(duracionViaje media)(accesibilidad alta) (claseAsiento turista)(Origen [Sevilla])(Destino [Madrid]))
  (TrenValenciaMadrid of Tren (precioTransporte 35)(duracionViaje media)(accesibilidad alta) (claseAsiento turista)(Origen [Valencia])(Destino [Madrid]))
  (TrenSSMadrid of Tren (precioTransporte 55)(duracionViaje media)(accesibilidad alta) (claseAsiento turista)(Origen [SanSebastian])(Destino [Madrid]))
  (TrenParisMadrid of Tren (precioTransporte 180)(duracionViaje larga)(accesibilidad alta) (claseAsiento turista)(Origen [Paris])(Destino [Madrid]))
  (TrenBerlinParis of Tren (precioTransporte 120)(duracionViaje media)(accesibilidad alta) (claseAsiento turista)(Origen [Berlin])(Destino [Paris]))

  (AutobusBarcelonaMadrid of Autobus (precioTransporte 25)(duracionViaje larga)(accesibilidad alta) (claseAsiento turista)(Origen [Barcelona])(Destino [Madrid]))
  (AutobusSevillaMadrid of Autobus (precioTransporte 20)(duracionViaje larga)(accesibilidad alta) (claseAsiento turista)(Origen [Sevilla])(Destino [Madrid]))
  (AutobusValenciaMadrid of Autobus (precioTransporte 18)(duracionViaje media)(accesibilidad alta) (claseAsiento turista)(Origen [Valencia])(Destino [Madrid]))
  (AutobusSSMadrid of Autobus (precioTransporte 28)(duracionViaje larga)(accesibilidad alta) (claseAsiento turista)(Origen [SanSebastian])(Destino [Madrid]))
  (AutobusGranadaMadrid of Autobus (precioTransporte 18)(duracionViaje larga)(accesibilidad alta) (claseAsiento turista)(Origen [Granada])(Destino [Madrid]))
  (AutobusGranadaSevilla of Autobus (precioTransporte 12)(duracionViaje media)(accesibilidad alta) (claseAsiento turista)(Origen [Granada])(Destino [Sevilla]))
  (AutobusLisboaMadrid of Autobus (precioTransporte 22)(duracionViaje larga)(accesibilidad alta) (claseAsiento turista)(Origen [Lisboa])(Destino [Madrid]))

  (CocheSegoviaMadrid of Coche (precioTransporte 45)(duracionViaje corta)(accesibilidad alta) (Origen [Segovia])(Destino [Madrid]))
  (CocheAndaluciaInversa of Coche (precioTransporte 120)(duracionViaje media)(accesibilidad alta) (Origen [Granada])(Destino [Sevilla]))

  (CruceroRomaBarcelona of Barco (precioTransporte 250)(duracionViaje larga)(accesibilidad alta) (claseAsiento primera)(Origen [Roma])(Destino [Barcelona]))

)

; ------------------------------------
;           MÓDULOS
; ------------------------------------
(defmodule MAIN (export ?ALL))

  (defmodule recopilacion-usuario
    (import MAIN ?ALL)
    (export ?ALL))

  (defmodule inicializacion
    (import MAIN ?ALL)
    (export ?ALL))

  (defmodule abstraccion-usuario
    (import MAIN ?ALL)
    (export ?ALL))

  (defmodule heuristica-usuario
    (import MAIN ?ALL)
    (export ?ALL))

(defmodule sintesis
    (import MAIN ?ALL)
    (export ?ALL))

(defmodule imprimir-resultados
    (import MAIN ?ALL)
    (export ?ALL))

; ------------------------------------
;           TEMPLATES
; ------------------------------------

  (deftemplate MAIN::datos-usuario
    (slot edad (type INTEGER) (default -1))
    (slot conocimiento (type INTEGER) (default -1))
    (slot experiencia (type INTEGER) (default -1))
    (slot profesion (type SYMBOL) (allowed-symbols nulo artes ciencias humanidades tecnico salud ninguno) (default nulo))
    (multislot idiomas (type INSTANCE) (allowed-classes Idioma))
    (multislot ciudad (type INSTANCE) (allowed-classes Ciudad))
    (slot motivo (type INSTANCE) (allowed-classes Eventos_especiales Objetivo))
    (slot tipoGrupo (type SYMBOL) (allowed-symbols nulo amigos familia individual pareja) (default nulo))
  )

  (deftemplate MAIN::restricciones-viaje
    (slot presupuestoMaximo (type INTEGER) (default -1))
    (slot minDiasViaje (type INTEGER) (default -1))
    (slot maxDiasViaje (type INTEGER) (default -1))
    (slot accesibilidad (type INTEGER) (default -1))
    (slot calMinAlojamiento (type INTEGER) (default -1))
    (slot minNumCiudad (type INTEGER) (default -1))
    (slot maxNumCiudad (type INTEGER) (default -1))
    (multislot ciudadesObligatorias (type INSTANCE) (allowed-classes Ciudad))
    (multislot lugarInteres (type INSTANCE) (allowed-classes Punto_de_Interes))
  )

  (deftemplate MAIN::preferencias-viaje
    (slot nivelRitmo (type INTEGER) (default -1)) 
    (multislot tematicas (type INSTANCE) (allowed-classes Tematica))
    (slot temporada (type INSTANCE) (allowed-classes Temporada))
    (multislot transporte (type SYMBOL) (allowed-symbols nulo avion barco tren coche autobus) (default nulo))
  )

  (deftemplate MAIN::datos-viaje-familia
    (slot numAdultos (type INTEGER))
    (slot numNinos (type INTEGER))
    (multislot edadesNinos (type INTEGER)))

  (deftemplate MAIN::datos-viaje-amigos
    (slot numPersonas (type INTEGER)))

  (deftemplate MAIN::ciudad-candidata
    (slot nombre (type INSTANCE))
    (slot puntuacion (type INTEGER) (default 0))
    (slot valida (type SYMBOL) (allowed-symbols si no) (default si))
  )

  (deftemplate MAIN::viaje-seleccionado
    (slot id)
    (multislot ciudades)
    (multislot dias)
    (multislot alojamientos)
    (multislot transportes)
    (multislot num-trans-por-parada)
  )

  (deftemplate MAIN::sintesis-viaje
    (slot id)
    (multislot ciudades)
    (multislot dias)
    (multislot alojamientos)
    (multislot transportes)
    (multislot num-trans-por-parada)
    (slot dias-totales (type INTEGER) (default 0))
    (slot presupuesto-restante (type FLOAT) (default 0.0))
    (slot paso (type INTEGER) (default 1))
  )

; ------------------------------------
;           FUNCIONES
; ------------------------------------

  (deffunction MAIN::pregunta-numerica (?preg ?min ?max)
    (format t "%s [%d-%d]: " ?preg ?min ?max)
    (bind ?r (read))
    (while (not (and (integerp ?r)(>= ?r ?min)(<= ?r ?max))) do
        (format t "  Valor incorrecto, %d-%d: " ?min ?max)
        (bind ?r (read)))
    ?r)

  (deffunction MAIN::pregunta-booleana (?preg)
    (format t "%s [1=Si / 2=No]: " ?preg)
    (bind ?r (read))
    (while (not (or (eq ?r 1)(eq ?r 2))) do
      (printout t "Por favor, responda 1 para Si o 2 para No: ")
       (bind ?r (read)))
    (if (eq ?r 1) then si else no))

  (deffunction MAIN::elegir-instancia (?clase ?pregunta)
    (bind ?instancias (find-all-instances ((?ins ?clase)) TRUE))
    (printout t ?pregunta crlf)
    (loop-for-count (?i 1 (length$ ?instancias)) do
      (printout t "  " ?i ". " (instance-name (nth$ ?i ?instancias)) crlf))
     (bind ?res (pregunta-numerica "Seleccione numero:" 1 (length$ ?instancias)))
    (nth$ ?res ?instancias))

  (deffunction MAIN::elegir-multinstancia (?clase ?pregunta)
    (bind ?instancias (find-all-instances ((?ins ?clase)) TRUE))
    (printout t crlf ?pregunta crlf)
    (loop-for-count (?i 1 (length$ ?instancias)) do
        (format t "  %d. %s%n" ?i (instance-name (nth$ ?i ?instancias))))
    (printout t "  0. Terminar seleccion" crlf)
    (bind ?lista (create$))
    (bind ?r (pregunta-numerica "Seleccione:" 0 (length$ ?instancias)))
    (while (neq ?r 0) do
        (bind ?seleccionada (nth$ ?r ?instancias))
        (if (not (member$ ?seleccionada ?lista))
            then 
                (bind ?lista (insert$ ?lista (+ (length$ ?lista) 1) ?seleccionada))
                (format t "  Anadido: %s%n" (instance-name ?seleccionada))
            else
                (printout t "  Ya seleccionado, elige otro." crlf))
        (bind ?r (pregunta-numerica "Seleccione (0 para terminar):" 0 (length$ ?instancias))))
    ?lista)

; ------------------------------------
;           REGLA INICIAL
; ------------------------------------
(defrule MAIN::regla-inicial
    (declare (salience 10))
    =>
    (printout t "============================================" crlf)
    (printout t "    Sistema de Recomendacion de Viajes IA    " crlf)
    (printout t "============================================" crlf)
    (focus recopilacion-usuario))

; ------------------------------------
;       MODULO RECOPILACION-USUARIO
; ------------------------------------

  (deffacts recopilacion-usuario::hechos-iniciales
    (Ciudad ask)
    (Idioma ask)
    (Usuario ask)
    (Temporada ask)
    (Punto_de_Interes ask)
    (transporte ask)
    (Tematica ask)
    (Edad ask)
    (Conocimiento ask)
    (Experiencia ask)
    (Presupuesto ask)
    (Duracion ask)
    (Ritmo ask)
    (Accesibilidad ask)
    (Calidad-Alojamiento ask)
    (Num-Ciudades ask)
    (Familia ask)
    (Grupo_de_amigos ask)
    (Objetivo ask)
    (Eventos_especiales ask))

  (defrule recopilacion-usuario::inicializar-usuario
    (not (datos-usuario))
    (not (recoleccion-finalizada))
    =>
    (assert (datos-usuario))
    (assert (restricciones-viaje))
    (assert (preferencias-viaje)))

  (defrule recopilacion-usuario::obtener-edad-usuario
    ?f <- (datos-usuario (edad ?e))
    ?h <- (Edad ask)
    (not (recoleccion-finalizada))
    =>
    (modify ?f (edad (pregunta-numerica "¿Cual es tu edad? " 18 110)))
    (retract ?h))

  (defrule recopilacion-usuario::obtener-conocimiento-usuario
    ?f <- (datos-usuario (conocimiento ?c))
    ?h <- (Conocimiento ask)
    (not (recoleccion-finalizada))
    =>
    (modify ?f (conocimiento (pregunta-numerica "¿Cuantos anos has estudiado? " 0 40)))
    (retract ?h))

  (defrule recopilacion-usuario::obtener-profesion-usuario
    ?u <- (datos-usuario (profesion ?p))
    ?h <- (Profesion ask)
    (not (recoleccion-finalizada))
    =>
    (if (eq (pregunta-booleana "¿Trabajas?") si)
        then
            (printout t "Indique su sector:" crlf)
            (printout t "  1. artes" crlf)
            (printout t "  2. ciencias" crlf)
            (printout t "  3. humanidades" crlf)
            (printout t "  4. tecnico" crlf)
            (printout t "  5. salud" crlf)
            (bind ?res (pregunta-numerica "Seleccione: " 1 5))
            (bind ?sector artes)
            (if (eq ?res 1) then (bind ?sector artes))
            (if (eq ?res 2) then (bind ?sector ciencias))
            (if (eq ?res 3) then (bind ?sector humanidades))
            (if (eq ?res 4) then (bind ?sector tecnico))
            (if (eq ?res 5) then (bind ?sector salud))
            (modify ?u (profesion ?sector))
        else
            (modify ?u (profesion ninguno))))

(defrule recopilacion-usuario::obtener-experiencia-usuario
    ?f <- (datos-usuario (experiencia ?e))
    ?h <- (Experiencia ask)
    (not (recoleccion-finalizada))
    =>
    (bind ?vr (pregunta-numerica "¿Cuantos viajes has hecho? " 0 100))
    (bind ?pv (pregunta-numerica "¿Cuantos paises has visitado? " 0 100))
    (modify ?f (experiencia (+ ?vr ?pv)))
    (retract ?h))

  (defrule recopilacion-usuario::obtener-idioma-usuario
    ?f <- (datos-usuario)
    ?h <- (Idioma ask)
    (not (recoleccion-finalizada))
    =>
    (modify ?f (idiomas (elegir-multinstancia Idioma "¿Que idiomas hablas?")))
    (retract ?h))

  (defrule recopilacion-usuario::obtener-ciudad-usuario
    ?f <- (datos-usuario)
    ?h <- (Ciudad ask)
    (not (recoleccion-finalizada))
    =>
    (bind ?ciudades (elegir-multinstancia Ciudad "¿Donde vives? (elige tu ciudad de origen)"))
    (modify ?f (ciudad ?ciudades))
    (retract ?h))

  (defrule recopilacion-usuario::obtener-tipo-usuario
    ?f <- (datos-usuario (tipoGrupo nulo))
    ?h <- (Usuario ask)
    (not (recoleccion-finalizada))
    =>
    (printout t "¿Como viaja usted?" crlf)
    (printout t "  1. Individual" crlf)
    (printout t "  2. Pareja" crlf)
    (printout t "  3. Familia" crlf)
    (printout t "  4. Amigos" crlf)
    (bind ?res (pregunta-numerica "Seleccione una opcion: " 1 4))
    (bind ?simbolo individual)
    (if (eq ?res 1) then (bind ?simbolo individual))
    (if (eq ?res 2) then (bind ?simbolo pareja))
    (if (eq ?res 3) then (bind ?simbolo familia))
    (if (eq ?res 4) then (bind ?simbolo amigos))
    (modify ?f (tipoGrupo ?simbolo))
    (retract ?h))

  (defrule recopilacion-usuario::obtener-datos-familia
    (datos-usuario (tipoGrupo familia))
    ?h <- (Familia ask)
    (not (recoleccion-finalizada))
    =>
    (bind ?na (pregunta-numerica "¿Cuantos adultos viajan? " 1 10))
    (bind ?nn (pregunta-numerica "¿Cuantos ninos viajan? " 0 10))
    (bind ?lista (create$))
    (loop-for-count (?i 1 ?nn) do
        (bind ?lista (insert$ ?lista ?i
            (pregunta-numerica
                (format nil "Cual es la edad del nino %d: " ?i) 0 17))))
    (assert (datos-viaje-familia
        (numAdultos ?na)
        (numNinos ?nn)
        (edadesNinos ?lista)))
    (retract ?h))

  (defrule recopilacion-usuario::obtener-datos-amigos
    (datos-usuario (tipoGrupo amigos))
    ?h <- (Grupo_de_amigos ask)
    (not (recoleccion-finalizada))
    =>
    (bind ?np (pregunta-numerica
        "¿Cuantas personas sois en el grupo de amigos? " 2 20))
    (assert (datos-viaje-amigos (numPersonas ?np)))
    (retract ?h))

  (defrule recopilacion-usuario::obtener-motivo
    ?f <- (datos-usuario)
    ?h1 <- (Objetivo ask)
    ?h2 <- (Eventos_especiales ask)
    (not (recoleccion-finalizada))
    =>
    (if (eq (pregunta-booleana "¿El viaje es por algun evento especial?") si)
        then
            (modify ?f (motivo
                (elegir-instancia Eventos_especiales "¿Cual es el evento?")))
        else
            (if (eq (pregunta-booleana
                "¿El viaje tiene algun objetivo especifico?") si)
                then
                    (modify ?f (motivo
                        (elegir-instancia Objetivo "¿Cual es el objetivo?")))
            ))
    (retract ?h1 ?h2))

  (defrule recopilacion-usuario::obtener-temporada
    ?f <- (preferencias-viaje)
    ?h <- (Temporada ask)
    (not (recoleccion-finalizada))
    =>
    (modify ?f (temporada
        (elegir-instancia Temporada "¿En que estacion quieres viajar?")))
    (retract ?h))

  (defrule recopilacion-usuario::obtener-duracion
    ?f <- (restricciones-viaje (minDiasViaje ?d))
    ?h <- (Duracion ask)
    (not (recoleccion-finalizada))
    =>
    (printout t "¿Cuanto quieres que dure el viaje?" crlf)
    (bind ?dmin (pregunta-numerica "  Dias totales minimos" 1 60))
    (bind ?dmax (pregunta-numerica "  Dias totales maximos" ?dmin 60))
    (modify ?f (minDiasViaje ?dmin) (maxDiasViaje ?dmax))
    (retract ?h))

  (defrule recopilacion-usuario::obtener-presupuesto
    ?f <- (restricciones-viaje (presupuestoMaximo ?p))
      ?h <- (Presupuesto ask)
    (not (recoleccion-finalizada))
    =>
    (modify ?f (presupuestoMaximo
        (pregunta-numerica "¿Cual es tu presupuesto total (euros)?" 1 50000)))
    (retract ?h))

  (defrule recopilacion-usuario::obtener-num-ciudades
    ?f <- (restricciones-viaje (minNumCiudad ?n))
    ?h <- (Num-Ciudades ask)
    (not (recoleccion-finalizada))
    =>
    (printout t "¿Cuantas ciudades quieres visitar?" crlf)
    (bind ?ncmin (pregunta-numerica "  Numero minimo" 1 10))
    (bind ?ncmax (pregunta-numerica "  Numero maximo" ?ncmin 10))
    (modify ?f (minNumCiudad ?ncmin) (maxNumCiudad ?ncmax))
    (retract ?h))

  (defrule recopilacion-usuario::obtener-ritmo-viaje
    ?f <- (preferencias-viaje (nivelRitmo ?r))
    ?h <- (Ritmo ask)
    (not (recoleccion-finalizada))
    =>
    (modify ?f (nivelRitmo
        (pregunta-numerica "¿Cual es el nivel de ritmo del viaje? (1=Tranquilo, 10=Intenso)" 1 10)))
    (retract ?h))

  (defrule recopilacion-usuario::obtener-accesibilidad-usuario
    ?f <- (restricciones-viaje (accesibilidad ?a))
    ?h <- (Accesibilidad ask)
    (not (recoleccion-finalizada))
    =>
    (modify ?f (accesibilidad
        (pregunta-numerica "¿Que grado de accesibilidad requiere?" 0 10)))
    (retract ?h))

  (defrule recopilacion-usuario::obtener-calidad-alojamiento
    ?f <- (restricciones-viaje (calMinAlojamiento ?c))
    ?h <- (Calidad-Alojamiento ask)
    (not (recoleccion-finalizada))
    =>
    (modify ?f (calMinAlojamiento
        (pregunta-numerica
            "¿Cual es la calidad minima de alojamiento?" 0 10)))
    (retract ?h))

  ;(defrule recopilacion-usuario::obtener-ciudades-y-punto-interes
   ; ?f <- (restricciones-viaje)
   ; ?h <- (Punto_de_Interes ask)
   ; (not (recoleccion-finalizada))
   ; =>
   ; (if (eq (pregunta-booleana "¿Tiene alguna ciudad que quiera visitar?") si)
   ;     then (modify ?f (ciudadesObligatorias
    ;        (elegir-multinstancia Ciudad "Seleccione las ciudades:"))))
    ;(if (eq (pregunta-booleana "¿Tiene algun lugar de interes que quiera visitar?") si)
    ;    then (modify ?f (lugarInteres
    ;        (elegir-multinstancia Punto_de_Interes "Seleccione los puntos:"))))
    ;(retract ?h))

  (defrule recopilacion-usuario::obtener-transporte
    ?f <- (preferencias-viaje)
    ?h <- (transporte ask)
    (not (recoleccion-finalizada))
    =>
    (printout t "¿Hay algun transporte que NO quiera usar?" crlf)
    (if (eq (pregunta-booleana "¿Quiere excluir algun transporte?") si)
        then
            (printout t "  1. Avion" crlf)
            (printout t "  2. Tren" crlf)
            (printout t "  3. Coche" crlf)
            (printout t "  4. Autobus" crlf)
            (printout t "  5. Barco" crlf)
            (bind ?res (pregunta-numerica "Seleccione uno: " 1 5))
            (bind ?simbolo avion)
            (if (eq ?res 1) then (bind ?simbolo avion))
            (if (eq ?res 2) then (bind ?simbolo tren))
            (if (eq ?res 3) then (bind ?simbolo coche))
            (if (eq ?res 4) then (bind ?simbolo autobus))
            (if (eq ?res 5) then (bind ?simbolo barco))
            (modify ?f (transporte ?simbolo)))
    (retract ?h))

  (defrule recopilacion-usuario::obtener-tematica
    ?f <- (preferencias-viaje)
    ?h <- (Tematica ask)
    (not (recoleccion-finalizada))
    =>
    (modify ?f (tematicas
        (elegir-multinstancia Tematica "¿Que tipo de ciudades quieres visitar?")))
    (retract ?h))

  (defrule recopilacion-usuario::fin-recoleccion-datos
    (declare (salience -100))
    (not (recoleccion-finalizada))
    =>
    (assert (recoleccion-finalizada))
    (printout t crlf "--------------------------------------------" crlf)
    (printout t " RECOLECCION DE DATOS HECHA " crlf)
    (printout t "--------------------------------------------" crlf)
    (focus inicializacion))

; ------------------------------------
;        MODULO INICIALIZACION
; ------------------------------------

  (defrule inicializacion::crear-instancia-individual
    ?f <- (datos-usuario (tipoGrupo individual) (edad ?e) (conocimiento ?est) (experiencia ?v) (idiomas $?ids) (ciudad $?orig))
    (restricciones-viaje (presupuestoMaximo ?p))
    (not (instancia-creada))
    =>
    (make-instance [cliente] of Persona_Individual
        (edad ?e)
        (presupuestoMaximo ?p)
        (anosEstudio ?est)
        (experiencia ?v)
        (Habla_en ?ids)
        (Vive_en (nth$ 1 ?orig)))
    (assert (instancia-creada)))

  (defrule inicializacion::crear-instancia-pareja
    ?f <- (datos-usuario (tipoGrupo pareja) (edad ?e) (conocimiento ?est) (experiencia ?v) (idiomas $?ids) (ciudad $?orig))
    (restricciones-viaje (presupuestoMaximo ?p))
    (not (instancia-creada))
    =>
    (make-instance [cliente] of Pareja
        (edad ?e)
        (presupuestoMaximo ?p)
        (anosEstudio ?est)
        (experiencia ?v)
        (Habla_en ?ids)
        (Vive_en (nth$ 1 ?orig)))
    (assert (instancia-creada)))

  (defrule inicializacion::crear-instancia-familia
    ?f <- (datos-usuario (tipoGrupo familia) (edad ?e) (conocimiento ?est) (experiencia ?v) (idiomas $?ids) (ciudad $?orig))
    (restricciones-viaje (presupuestoMaximo ?p))
    ?df <- (datos-viaje-familia (numAdultos ?na) (numNinos ?nn) (edadesNinos $?en))
    (not (instancia-creada))
    =>
    (make-instance [cliente] of Familia
        (edad ?e)
        (presupuestoMaximo ?p)
        (anosEstudio ?est)
        (experiencia ?v)
        (Habla_en ?ids)
        (Vive_en (nth$ 1 ?orig))
        (nAdultos ?na)
        (nNinos ?nn)
        (edadNinos ?en))
    (retract ?df)
    (assert (instancia-creada)))

  (defrule inicializacion::crear-instancia-amigos
    ?f <- (datos-usuario   (tipoGrupo amigos) (edad ?e) (conocimiento ?est) (experiencia ?v) (idiomas $?ids) (ciudad $?orig))
    (restricciones-viaje (presupuestoMaximo ?p))
    ?df <- (datos-viaje-amigos (numPersonas ?np))
    (not (instancia-creada))
    =>
    (make-instance [cliente] of Grupo_de_amigos
        (edad ?e)
        (presupuestoMaximo ?p)
        (anosEstudio ?est)
        (experiencia ?v)
        (Habla_en ?ids)
        (Vive_en (nth$ 1 ?orig))
        (nPersonas ?np))
    (retract ?df)
    (assert (instancia-creada)))

  (defrule inicializacion::fin-inicializacion
    (declare (salience -100))
    (instancia-creada)
    (not (fin-inicializacion-ok))
    =>
    (assert (fin-inicializacion-ok))
    (printout t crlf)
    (printout t "--------------------------------------------" crlf)
    (printout t " INSTANCIAS CREADAS                         " crlf)
    (printout t "--------------------------------------------" crlf)
    (focus abstraccion-usuario))

; ------------------------------------
;        MODULO ABSTRACCION-USUARIO
; ------------------------------------


  (defrule abstraccion-usuario::abstraer-datos-usuario
    ?u <- (object (is-a Usuario) (edad ?v-edad) (anosEstudio ?v-c) (experiencia ?v-exp) (Habla_en $?ids))
    (not (abstraer-datos-usuario-definido))
    =>
    (bind ?cat-edad
        (if (< ?v-edad 30) then joven
        else (if (< ?v-edad 65) then adulto
        else anciano)))

    (bind ?cat-c
        (if (< ?v-c 6) then poco
        else (if (< ?v-c 15) then medio
        else alto)))

    (bind ?cat-exp
        (if (>= ?v-exp 10) then alta
        else (if (>= ?v-exp 5) then media
        else baja)))

    (bind ?cat-id
        (if (or (member$ [ingles] ?ids)(> (length$ ?ids) 1))
            then internacional
            else local))

    (assert (problema-abstracto ?cat-edad ?cat-c ?cat-exp ?cat-id))
    (assert (abstraer-datos-usuario-definido))
    (printout t "  [Abstraccion] Perfil: "?cat-edad " / " ?cat-c " / " ?cat-exp " / " ?cat-id crlf))

  (defrule abstraccion-usuario::info-usuario-familia
    ?u <- (object (is-a Familia) (nAdultos ?numAdultos) (nNinos ?numNinos) (edadNinos $?edadesNinos))
    (not (info-usuario-definido-familia))
    =>
    (bind ?tipo-familia
        (if (> ?numAdultos 2) then varias-familias
        else una-familia))

    (bind ?numerosa
        (if (> ?numNinos 3) then si else no))

    (bind ?hay-bebe no)
    (progn$ (?edad ?edadesNinos)
        (if (< ?edad 3) then (bind ?hay-bebe si)))

    (assert (problema-familia ?tipo-familia ?numerosa ?hay-bebe))
    (assert (info-usuario-definido-familia))
    (printout t "  [Abstraccion] Familia: "?tipo-familia " / numerosa=" ?numerosa " / bebe=" ?hay-bebe crlf)

    (if (eq ?hay-bebe si)
        then (assert (requiere-accesibilidad))))

  (defrule abstraccion-usuario::info-usuario-amigos
    (object (is-a Grupo_de_amigos)(nPersonas ?numPersonas))
    (not (info-usuario-definido-amigos))
    =>
    (bind ?categoria
        (if (> ?numPersonas 5) then numeroso
        else no-numeroso))
    (assert (problema-amigos ?categoria))
    (assert (info-usuario-definido-amigos))
    (printout t "  [Abstraccion] Grupo amigos: " ?categoria crlf)

    (if (> ?numPersonas 8)
        then (assert (requiere-transporte-grande))))

  (defrule abstraccion-usuario::abstraer-presupuesto
    (restricciones-viaje (presupuestoMaximo ?p)(maxDiasViaje ?d))
    (test (and (numberp ?p)(numberp ?d)(> ?p 0)(> ?d 0)))
    (not (perfil-economico ?))
    =>
    (bind ?ppd (/ ?p ?d))
    (bind ?nivel
        (if (< ?ppd 60) then bajo
        else (if (< ?ppd 150) then medio
        else alto)))
    (assert (perfil-economico ?nivel))
    (printout t "  [Abstraccion] Presupuesto/dia: "
        (round ?ppd) "euros → " ?nivel crlf))

  (defrule abstraccion-usuario::abstraer-duracion
    (restricciones-viaje (maxDiasViaje ?d))
    (test (and (numberp ?d)(> ?d 0)))
    (not (perfil-duracion ?))
    =>
    (bind ?dur
        (if (<= ?d 4) then corta
        else (if (<= ?d 10) then media
        else larga)))
    (assert (perfil-duracion ?dur))
    (printout t "  [Abstraccion] Duracion: " ?d " dias → " ?dur crlf))

  (defrule abstraccion-usuario::abstraer-accesibilidad
    (restricciones-viaje (accesibilidad ?acc))
    (test (>= ?acc 0))
    (not (accesibilidad-abstracta-hecho))
    =>
    (if (> ?acc 5)
        then (assert (restriccion-movilidad-critica si))
        else (assert (restriccion-movilidad-critica no)))
    (assert (accesibilidad-abstracta-hecho)))

  (defrule abstraccion-usuario::abstraer-ritmo
    (preferencias-viaje (nivelRitmo ?r))
    (test (> ?r 0))
    (not (ritmo-categoria ?))
    =>
    (bind ?cat
        (if (<= ?r 3) then relajado
        else (if (<= ?r 7) then normal
        else frenetico)))
    (assert (ritmo-categoria ?cat))
    (printout t "  [Abstraccion] Ritmo: " ?r "/10 → " ?cat crlf))

  (defrule abstraccion-usuario::abstraer-calidad-alojamiento
    (restricciones-viaje (calMinAlojamiento ?a))
    (test (> ?a 0))
    (not (calidad-alojamiento ?))
    =>
    (bind ?cat
        (if (<= ?a 3) then economico
        else (if (<= ?a 7) then estandar
        else lujo)))
    (assert (calidad-alojamiento ?cat))
    (printout t "  [Abstraccion] Calidad alojamiento: " ?cat crlf))

  (defrule abstraccion-usuario::abstraer-num-ciudades
    (restricciones-viaje (minNumCiudad ?c))
    (test (> ?c 0))
    (not (duracion-ciudad-abstracta ?))
    =>
    (bind ?cat
        (if (<= ?c 1) then pocas
        else (if (<= ?c 3) then normal
        else muchas)))
    (assert (duracion-ciudad-abstracta ?cat)))


  (defrule abstraccion-usuario::deducir-objetivo-evento
    (datos-usuario (motivo ?m))
    (test (neq ?m nil))
    (object (is-a Eventos_especiales)(name ?m))
    (not (clase-objetivo ?))
    =>
    (if (or (eq ?m [boda])(eq ?m [luna-miel])(eq ?m [aniversario]))
        then (assert (clase-objetivo romantico))
        else (if (or (eq ?m [fin-curso])(eq ?m [cumpleanos]))
            then (assert (clase-objetivo diversion))
            else (assert (clase-objetivo descanso))))
    (printout t "  [Abstraccion] Objetivo deducido de evento: "
        (instance-name ?m) crlf))

  (defrule abstraccion-usuario::abstraer-objetivo-directo
    (datos-usuario (motivo ?m))
    (test (neq ?m nil))
    (object (is-a Objetivo)(name ?m))
    (not (clase-objetivo ?))
    =>
    (assert (clase-objetivo (instance-name ?m)))
    (printout t "  [Abstraccion] Objetivo directo: "
        (instance-name ?m) crlf))


  (defrule abstraccion-usuario::objetivo-sin-motivo
    (datos-usuario (motivo ?m))
    (test (eq ?m nil))
    (not (clase-objetivo ?))
    =>
    (assert (clase-objetivo descanso))
    (printout t "  [Abstraccion] Sin motivo → descanso" crlf))

  (defrule abstraccion-usuario::abstraer-tematicas
    (preferencias-viaje (tematicas $?temas))
    (not (tematicas-abstraidas))
    =>
    (if (> (length$ ?temas) 0)
        then
            (progn$ (?t ?temas)
                (assert (clase-tematica ?t))
                (printout t "  [Abstraccion] Tematica: "
                    (instance-name ?t) crlf))
        else
            (assert (clase-tematica [cultura]))
            (printout t "  [Abstraccion] Sin tematica → cultura por defecto" crlf))
    (assert (tematicas-abstraidas)))


  (defrule abstraccion-usuario::fin-abstraccion
    (declare (salience -100))
    (abstraer-datos-usuario-definido)
    (perfil-economico ?)
    (perfil-duracion ?)
    (ritmo-categoria ?)
    (clase-objetivo ?)
    (tematicas-abstraidas)
    (not (fin-abstraccion-hecho))
    =>
    (assert (fin-abstraccion-hecho))
    (printout t crlf)
    (printout t "--------------------------------------------" crlf)
    (printout t " ABSTRACCION HECHA    " crlf)
    (printout t "--------------------------------------------" crlf)
    (focus heuristica-usuario))

; ------------------------------------
;           HEURISTICA USUARIO
; ------------------------------------

  (defrule heuristica-usuario::inicializar-ciudades
    (declare (salience 100))
    (object (is-a Ciudad) (name ?c))
    (not (ciudad-candidata (nombre ?c)))
    =>
    (assert (ciudad-candidata (nombre ?c) (puntuacion 0) (valida si)))
  )

  (defrule heuristica-usuario::puntos-presupuesto
    ?f <- (ciudad-candidata (nombre ?c) (valida si) (puntuacion ?p))
    (restricciones-viaje (presupuestoMaximo ?presupuesto) (maxDiasViaje ?dias))
    (object (is-a Ciudad) (name ?c) (precioMedio ?pr))
    (not (penalizado-presupuesto ?c))
    =>
    (bind ?limite (/ ?presupuesto ?dias))
    
    (if (> ?pr ?limite) then
        (bind ?exceso (/ (- ?pr ?limite) ?limite))  
        (bind ?penalizacion 0)
        
        (if (< ?exceso 0.25) then      
            (bind ?penalizacion 5))
        (if (and (>= ?exceso 0.25)
                 (< ?exceso 0.75)) then  
            (bind ?penalizacion 15))
        (if (>= ?exceso 0.75) then       
            (bind ?penalizacion 30))
        
        (modify ?f (puntuacion (- ?p ?penalizacion)))
        (printout t "  [Heuristica] -" ?penalizacion " a " ?c " por precio (" ?pr " euros/dia, limite " (round ?limite) " euros/dia)." crlf)
    )
    (assert (penalizado-presupuesto ?c))
)

(defrule heuristica-usuario::puntos-transporte
    ?f <- (ciudad-candidata (nombre ?c) (valida si) (puntuacion ?p))
    (restricciones-viaje (presupuestoMaximo ?presupuesto))
    (object (is-a Transporte) (Destino ?c) (precioTransporte ?pt))
    (not (penalizado-transporte ?c))
    =>
    (bind ?limite-transporte (* ?presupuesto 0.20))  
    
    (if (> ?pt ?limite-transporte) then
        (bind ?exceso (/ (- ?pt ?limite-transporte) ?limite-transporte))
        (bind ?penalizacion 0)
        
        (if (< ?exceso 0.25) then
            (bind ?penalizacion 5))
        (if (and (>= ?exceso 0.25)
                 (< ?exceso 0.75)) then
            (bind ?penalizacion 15))
        (if (>= ?exceso 0.75) then
            (bind ?penalizacion 30))
        
        (modify ?f (puntuacion (- ?p ?penalizacion)))
        (printout t "  [Heuristica] -" ?penalizacion " a " ?c " por transporte caro (" ?pt " euros, limite " (round ?limite-transporte) " euros)." crlf)
    )
    (assert (penalizado-transporte ?c))
)

  (defrule heuristica-usuario::filtro-duracion-corta
    (perfil-duracion corta)
    (datos-usuario (ciudad $?origen))
    (test (> (length$ ?origen) 0))
    ?f <- (ciudad-candidata (nombre ?c)(valida si))
    (object (is-a Ciudad)(name ?c)(continente ?cont-destino))
    =>
    (bind ?ciudad-origen (nth$ 1 ?origen))
    (bind ?cont-origen (send ?ciudad-origen get-continente))
    (if (neq ?cont-origen ?cont-destino)
        then
            (modify ?f (valida no))
            (printout t "  [Heuristica] " (instance-name ?c)" descartada: viaje corto, continente diferente." crlf)))

  (defrule heuristica-usuario::filtro-duracion-larga
      (perfil-duracion larga)
      ?f <- (ciudad-candidata (nombre ?c) (valida si))
      (object (is-a Ciudad) (name ?c) (Contienen $?contienen))
      (test (< (length$ ?contienen) 3))
      =>
      (modify ?f (valida no))
      (printout t "  [Heuristica] Ciudad " (instance-name ?c) " descartada: muy pocos puntos de interes para viaje largo." crlf)
  )

  (defrule heuristica-usuario::puntuar-tematica
    ?f <- (ciudad-candidata (nombre ?c) (valida si) (puntuacion ?p))
    (preferencias-viaje(tematicas $?tematicas-usuario))
    (object (is-a Ciudad) (name ?c) (Tipo_de_ciudad $?tipos-ciudad))
    (not (puntuo-tematica ?c))
    =>
    (bind ?coincide no)
    (progn$ (?t ?tematicas-usuario)
        (if (member$ ?t ?tipos-ciudad) 
            then (bind ?coincide si))
    )
    (if (eq ?coincide si) then
        (modify ?f (puntuacion (+ ?p 20)))
        (printout t "  [Heuristica] +20 a " (instance-name ?c) " por coincidir con la tematica deseada." crlf)
    )
    
    (assert (puntuo-tematica ?c))
)

  (defrule heuristica-usuario::puntuar-ciudad-obligatoria
    ?f <- (ciudad-candidata (nombre ?c) (valida si) (puntuacion ?p))
    (restricciones-viaje (ciudadesObligatorias $?lista))
    (test (member$ ?c $?lista))
    (not (puntuo-obligatoria ?c))
    =>
    (assert (puntuo-obligatoria ?c))
    (modify ?f (puntuacion (+ ?p 500)))
    (printout t "  [Heuristica] +500 a " (instance-name ?c) " por ser ciudad obligatoria." crlf)
  )

  (deffunction heuristica-usuario::hay-interseccion (?l1 ?l2)
   (foreach ?x ?l1
      (if (member$ ?x ?l2) then
         (return TRUE)))
   (return FALSE)
  )

  (defrule heuristica-usuario::puntuar-punto-interes
   ?f <- (ciudad-candidata (nombre ?c) (valida si) (puntuacion ?p))
   (restricciones-viaje (lugarInteres $?lugares-deseados))
   (object (is-a Ciudad)(name ?c)(Contienen $?puntos-ciudad))
   (test (hay-interseccion ?lugares-deseados ?puntos-ciudad))
   (not (puntuo-lugar-interes ?c))
   =>
   (assert (puntuo-lugar-interes ?c))
   (modify ?f (puntuacion (+ ?p 500)))
   (printout t "  [Heuristica] +500 a " (instance-name ?c) " por puntos de interes." crlf)
  )

  (defrule heuristica-usuario::puntuar-idioma
    ?f <- (ciudad-candidata (nombre ?c) (valida si) (puntuacion ?p))
    (datos-usuario (idiomas $?idiomas-usuario))
    (object (is-a Ciudad) (name ?c) (Hablan_en $?idiomas-ciudad))
    (not (puntuo-idioma ?c))
    =>
    (bind ?coincide no)
    (progn$ (?id ?idiomas-usuario)
        (if (member$ ?id ?idiomas-ciudad) then (bind ?coincide si))
    )
    (if (eq ?coincide si) then
        (modify ?f (puntuacion (+ ?p 5)))
        (printout t "  [Heuristica] +5 a " (instance-name ?c) " por coincidir con los idiomas hablados." crlf)
    )
    (assert (puntuo-idioma ?c))
  )

  (defrule heuristica-usuario::fin-heuristica
    (declare (salience -100))
    (not (fin-heuristica-hecho))
    =>
    (assert (fin-heuristica-hecho))
    (printout t crlf "--------------------------------------------" crlf)
    (printout t " HEURISTICA TERMINADA " crlf)
    (printout t "--------------------------------------------" crlf)
    (printout t crlf "--- LISTA DE CIUDADES CANDIDATAS ---" crlf)
    (bind ?lista (find-all-facts ((?f ciudad-candidata)) TRUE))
    (progn$ (?f ?lista)
        (printout t "  Ciudad: " (fact-slot-value ?f nombre) " | Puntos: " (fact-slot-value ?f puntuacion) " | Valida: " (fact-slot-value ?f valida) crlf)
    )
    (printout t "------------------------------------" crlf)
    (focus sintesis))

; --------------------------------------------------
;           MODULO SINTESIS
; --------------------------------------------------

(deffunction sintesis::valor-calidad (?cal)
  (if (eq ?cal baja) then (return 1))
  (if (eq ?cal media) then (return 2))
  (if (eq ?cal alta) then (return 3))
  (if (eq ?cal economico) then (return 1))
  (if (eq ?cal estandar) then (return 2))
  (if (eq ?cal lujo) then (return 3))
  (return 0))

(deffunction sintesis::req-calidad (?cal)
  (if (<= ?cal 3) then (return 1))
  (if (<= ?cal 7) then (return 2))
  (return 3))

(defrule sintesis::iniciar-sintesis
  (not (sintesis-viaje))
  (restricciones-viaje (presupuestoMaximo ?p))
  =>
  (assert (sintesis-viaje (id 1) (paso 1) (dias-totales 0) (presupuesto-restante (float ?p)) (num-trans-por-parada))))

(defrule sintesis::seleccionar-ciudades
  (declare (salience 50))
  ?estado <- (sintesis-viaje (paso 1)(ciudades $?ciudades)(presupuesto-restante ?pr))
  (restricciones-viaje (minNumCiudad ?min)(maxNumCiudad ?max))
  (test (< (length$ ?ciudades) ?max))
  (exists (ciudad-candidata (valida si)))
  =>
  (bind ?cands (find-all-facts ((?f ciudad-candidata))(eq ?f:valida si)))
  (bind ?mejor nil)
  (bind ?mejor-p -9999)
  (bind ?mejor-pr 999999)
  (progn$ (?cand ?cands)
    (bind ?p (fact-slot-value ?cand puntuacion))
    (bind ?n (fact-slot-value ?cand nombre))
    (bind ?pc 0)
    (do-for-all-instances ((?city Ciudad)) (eq (instance-name ?city) ?n)
      (bind ?pc (send ?city get-precioMedio)))
    (if (or (> ?p ?mejor-p) (and (= ?p ?mejor-p) (< ?pc ?mejor-pr)))
      then (bind ?mejor ?cand) (bind ?mejor-p ?p) (bind ?mejor-pr ?pc)))

  (if (neq ?mejor nil)
    then
      (bind ?c (fact-slot-value ?mejor nombre))
      (bind ?gasto-est (+ (* ?mejor-pr 2) 80 50))
      
      (if (and (< ?pr ?gasto-est) (>= (length$ ?ciudades) ?min))
        then
          (printout t "  [Sintesis] Presupuesto limitado. Finalizando seleccion con " (length$ ?ciudades) " ciudades." crlf)
          (modify ?estado (paso 2))
        else
          (modify ?mejor (valida no)) ; IMPORTANTE: Descartar para no repetir
          (if (< ?pr ?gasto-est) 
            then (printout t "  [Sintesis] Aviso: Se supera el presupuesto para incluir el minimo de ciudades." crlf))
          (modify ?estado (ciudades (create$ ?ciudades ?c)) (presupuesto-restante (- ?pr ?gasto-est))))))

(defrule sintesis::fin-seleccion-ciudades
  (declare (salience -10))
  ?estado <- (sintesis-viaje (paso 1) (ciudades $?ciudades))
  =>
  (if (> (length$ ?ciudades) 0) then (modify ?estado (paso 2)) else (modify ?estado (paso 5))))

(defrule sintesis::asignar-dias
  (declare (salience 50))
  ?estado <- (sintesis-viaje (paso 2) (ciudades $?ciudades) (dias $?dias) (dias-totales ?tot))
  (test (< (length$ ?dias) (length$ ?ciudades)))
  =>
  (bind ?d (+ 1 (mod (random) 3)))
  (modify ?estado (dias (create$ ?dias ?d)) (dias-totales (+ ?tot ?d))))

(defrule sintesis::ajustar-dias
  (declare (salience -10))
  ?estado <- (sintesis-viaje (paso 2) (ciudades $?ciudades) (dias $?dias) (dias-totales ?tot))
  (test (= (length$ ?dias) (length$ ?ciudades)))
  (restricciones-viaje (maxDiasViaje ?max))
  =>
  (if (> ?tot ?max) then
    (bind ?nd (create$)) (bind ?s 0)
    (progn$ (?d ?dias)
      (bind ?a ?d)
      (if (> (+ ?s ?a) ?max) then (bind ?a (max 1 (- ?max ?s))))
      (bind ?s (+ ?s ?a))
      (bind ?nd (create$ ?nd ?a)))
    (modify ?estado (paso 3) (dias ?nd) (dias-totales ?s))
  else (modify ?estado (paso 3))))

(defrule sintesis::asignar-alojamiento
  (declare (salience 50))
  ?estado <- (sintesis-viaje (paso 3) (ciudades $?ciudades) (alojamientos $?aloj))
  (test (< (length$ ?aloj) (length$ ?ciudades)))
  (restricciones-viaje (calMinAlojamiento ?cm))
  =>
  (bind ?c (nth$ (+ (length$ ?aloj) 1) ?ciudades))
  (bind ?r (req-calidad ?cm))
  (bind ?v (create$))
  (do-for-all-instances ((?city Ciudad)) (eq (instance-name ?city) ?c)
    (progn$ (?a ?city:Tiene_un_conjunto_de)
      (if (>= (valor-calidad (send ?a get-calidadAlojamiento)) ?r) then (bind ?v (create$ ?v ?a)))))
  (bind ?el ninguno) (bind ?pm 999999)
  (progn$ (?a ?v)
    (if (< (send ?a get-precioAlojamiento) ?pm) then (bind ?pm (send ?a get-precioAlojamiento)) (bind ?el ?a)))
  (modify ?estado (alojamientos (create$ ?aloj ?el))))

(defrule sintesis::fin-asignar-alojamiento
  (declare (salience -10))
  ?estado <- (sintesis-viaje (paso 3) (alojamientos $?aloj) (ciudades $?ciudades))
  (test (= (length$ ?aloj) (length$ ?ciudades)))
  => (modify ?estado (paso 4)))

(defrule sintesis::asig-transporte
  (declare (salience 50))
  ?estado <- (sintesis-viaje (paso 4) (ciudades $?ciudades) (transportes $?tr) (num-trans-por-parada $?ntpp))
  (test (< (length$ ?ntpp) (length$ ?ciudades)))
  (preferencias-viaje (transporte ?p))
  (datos-usuario (ciudad $?origen-usuario))
  =>
  (bind ?idx (+ (length$ ?ntpp) 1))
  (bind ?dest (nth$ ?idx ?ciudades))
  (if (= ?idx 1)
    then (bind ?orig (nth$ 1 ?origen-usuario))
    else (bind ?orig (nth$ (- ?idx 1) ?ciudades)))
    
  (bind ?mejor-ruta (create$))
  (bind ?min-precio 999999)
  
  (if (eq ?orig ?dest)
    then
      (modify ?estado (num-trans-por-parada (create$ ?ntpp 0)))
    else
      ; 1. Buscar Directo
      (do-for-all-instances ((?t Transporte)) (and (eq ?t:Origen ?orig) (eq ?t:Destino ?dest))
        (bind ?prec (send ?t get-precioTransporte))
        (if (< ?prec ?min-precio) then 
            (bind ?min-precio ?prec)
            (bind ?mejor-ruta (create$ ?t))))
      (if (= (length$ ?mejor-ruta) 0) then
          (do-for-all-instances ((?t1 Transporte)) (eq ?t1:Origen ?orig)
             (bind ?int ?t1:Destino)
             (do-for-all-instances ((?t2 Transporte)) (and (eq ?t2:Origen ?int) (eq ?t2:Destino ?dest))
                (bind ?prec (+ (send ?t1 get-precioTransporte) (send ?t2 get-precioTransporte)))
                (if (< ?prec ?min-precio) then
                    (bind ?min-precio ?prec)
                    (bind ?mejor-ruta (create$ ?t1 ?t2))))))

      (if (= (length$ ?mejor-ruta) 0) then
          (printout t "  [Sintesis] Aviso: No se encontro ruta de " (instance-name ?orig) " a " (instance-name ?dest) crlf)
          (modify ?estado (transportes (create$ ?tr ninguno)) (num-trans-por-parada (create$ ?ntpp 1)))
        else
          (modify ?estado (transportes (create$ ?tr ?mejor-ruta)) 
                         (num-trans-por-parada (create$ ?ntpp (length$ ?mejor-ruta)))))))

(defrule sintesis::fin-transporte
  (declare (salience -10))
  ?estado <- (sintesis-viaje (id ?id) (paso 4) (ciudades $?ci) (dias $?di) (alojamientos $?al) (transportes $?tr) (num-trans-por-parada $?ntpp))
  (test (= (length$ ?ntpp) (length$ ?ci)))
  =>
  (assert (viaje-seleccionado (id ?id) (ciudades ?ci) (dias ?di) (alojamientos ?al) (transportes ?tr) (num-trans-por-parada ?ntpp)))
  (if (= ?id 1) then
    (modify ?estado (id 2) (paso 1) (ciudades (create$)) (dias (create$)) (alojamientos (create$)) (transportes (create$)) (num-trans-por-parada (create$)) (dias-totales 0))
  else (modify ?estado (paso 5))))

(defrule sintesis::fin-sint
  (declare (salience 100))
  (sintesis-viaje (paso 5))
  =>
  (printout t crlf "============================================" crlf)
  (printout t crlf "--- SINTESIS TERMINADA   ---" crlf)
  (printout t crlf "============================================" crlf)
  (focus imprimir-resultados))

; --------------------------------------------------
;           MODULO IMPRIMIR RESULTADOS
; --------------------------------------------------

  (defrule imprimir-resultados::inicio
    (declare (salience 100))
    =>
    (printout t crlf "============================================" crlf)
    (printout t " RECOMENDACION DE VIAJES " crlf)
    (printout t "============================================" crlf)
  )

  (defrule imprimir-resultados::imprimir-plan
    (declare (salience 50))
    (viaje-seleccionado (id ?id) (ciudades $?ciudades) (dias $?dias) (alojamientos $?alojamientos) (transportes $?transportes) (num-trans-por-parada $?ntpp))
    (datos-usuario (idiomas $?idiomas-usuario))
    (preferencias-viaje (tematicas $?tematicas-usuario))
    =>
    (printout t crlf " >>> PLAN DE VIAJE OPCION " ?id " <<<" crlf)
    
    (bind ?precio-total 0)
    (bind ?duracion-total 0)
    (bind ?t-idx 1)
    
    (loop-for-count (?i 1 (length$ ?ciudades))
        (bind ?c (nth$ ?i ?ciudades))
        (bind ?d (nth$ ?i ?dias))
        (bind ?duracion-total (+ ?duracion-total ?d))
        (bind ?aloj (nth$ ?i ?alojamientos))
        (bind ?n-trans (nth$ ?i ?ntpp))
        
        (printout t "  Parada " ?i ": " ?c " (" ?d " dias)" crlf)
        
        (bind ?precio-ciudad 0)
        (do-for-all-instances ((?city Ciudad)) (eq (instance-name ?city) ?c)
            (bind ?precio-ciudad (* (send ?city get-precioMedio) ?d))
            (printout t "    - Lugares a visitar: " (send ?city get-Contienen) crlf)
        )
        (printout t "    - Coste vida: " ?precio-ciudad " euros." crlf)
        (bind ?precio-total (+ ?precio-total ?precio-ciudad))
        
        (if (neq ?aloj [ninguno]) then
            (bind ?precio-aloj 0)
            (do-for-all-instances ((?a Alojamiento)) (eq (instance-name ?a) ?aloj)
                (bind ?precio-aloj (* (send ?a get-precioAlojamiento) ?d))
                (printout t "    - Alojamiento: " (instance-name ?aloj) " (Calidad: " (send ?a get-calidadAlojamiento) ")" crlf)
            )
            (printout t "    - Coste alojamiento: " ?precio-aloj " euros." crlf)
            (bind ?precio-total (+ ?precio-total ?precio-aloj))
        else
            (printout t "    - Alojamiento: Ninguno disponible que cumpla los requisitos." crlf)
        )
        
        (printout t "    - Transporte de llegada:" crlf)
        (loop-for-count (?j 1 ?n-trans)
            (bind ?trans (nth$ ?t-idx ?transportes))
            (if (neq ?trans ninguno) then
                (do-for-all-instances ((?t Transporte)) (eq (instance-name ?t) ?trans)
                    (bind ?p-t (send ?t get-precioTransporte))
                    (printout t "      * " (instance-name ?trans) " (" (class ?t) "): " ?p-t " euros." crlf)
                    (bind ?precio-total (+ ?precio-total ?p-t))
                )
            else
                (printout t "      * Ninguno encontrado." crlf)
            )
            (bind ?t-idx (+ ?t-idx 1))
        )
    )
    
    (printout t "  ------------------------------------------" crlf)
    (printout t "  RESUMEN PLAN " ?id ":" crlf)
    (printout t "   - Duracion Total: " ?duracion-total " dias." crlf)
    (printout t "   - Precio Total Aproximado: " ?precio-total " euros." crlf)
    
    (printout t "   - Preferencias cumplidas en este plan: " crlf)
    (bind ?al-menos-una no)
    (progn$ (?c ?ciudades)
        (do-for-all-instances ((?city Ciudad)) (eq (instance-name ?city) ?c)
            (bind ?hablan (send ?city get-Hablan_en))
            (progn$ (?u-id ?idiomas-usuario)
                (if (member$ ?u-id ?hablan) then 
                    (printout t "      * Se habla tu idioma (" ?u-id ") en " ?c crlf)
                    (bind ?al-menos-una si)
                )
            )
            (bind ?tipos (send ?city get-Tipo_de_ciudad))
            (progn$ (?t ?tematicas-usuario)
                (if (member$ ?t ?tipos) then 
                    (printout t "      * Coincide con tu tematica preferida (" ?t ") en " ?c crlf)
                    (bind ?al-menos-una si)
                )
            )
        )
    )
    (if (eq ?al-menos-una no) then
        (printout t "      * Se han cumplido las restricciones de presupuesto y/o distancia." crlf)
    )
    (printout t "============================================" crlf)
  )