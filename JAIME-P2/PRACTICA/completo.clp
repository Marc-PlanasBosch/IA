;; ============================================================================
;; CLASE  USUARIO
;; Representa el perfil general de cualquier viajero.
;; ============================================================================
(defclass Usuario
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    
    ;; Relaciones (Instancias de otras clases)
    (multislot Habla_en          (type INSTANCE) (create-accessor read-write))
    (multislot Solicita_un      (type INSTANCE) (create-accessor read-write))
    (multislot Tiene            (type INSTANCE) (create-accessor read-write))
    (multislot Usuario          (type INSTANCE) (create-accessor read-write))
    (multislot Vive_en          (type INSTANCE) (create-accessor read-write))
    
    ;; Atributos propios
    (slot profesion             (type SYMBOL)  (allowed-symbols artes ciencias humanidades ninguno salud tecnico) (create-accessor read-write))
    (slot añosEstudio           (type INTEGER) (create-accessor read-write))
    (slot edad                  (type INTEGER) (create-accessor read-write))
    (slot paisesVisitados       (type INTEGER) (create-accessor read-write))
    (slot presupuestoMaximo     (type INTEGER) (create-accessor read-write))
    (slot viajesRealizados      (type INTEGER) (create-accessor read-write))
    (slot requiereAccesibilidad (type SYMBOL)  (allowed-symbols si no) (default no) (create-accessor read-write))
)

;; Subclases de Usuario (Especializaciones del tipo de viajero)

(defclass Familia
    (is-a Usuario)
    (role concrete)
    (pattern-match reactive)
    (multislot atributosFamilia (type INTEGER) (create-accessor read-write))
    (multislot edadNiños        (type INTEGER) (create-accessor read-write))
    (slot nAdultos              (type INTEGER) (create-accessor read-write))
    (slot nNiños                (type INTEGER) (create-accessor read-write))
)

(defclass Grupo_de_amigos
    (is-a Usuario)
    (role concrete)
    (pattern-match reactive)
    (slot nPersonas             (type INTEGER) (create-accessor read-write))
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

;; ============================================================================
;; CLASE ALOJAMIENTO
;; Define las características comunes para pernoctar.
;; ============================================================================
(defclass Alojamiento
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot accesibilidad     (type SYMBOL)  (allowed-symbols si no) (default no) (create-accessor read-write))
    (slot ambiente          (type SYMBOL)  (allowed-symbols SOCIAL TRANQUILO) (create-accessor read-write))
    (slot calidadAlojamiento(type INTEGER) (allowed-integers 1 2 3 4 5) (create-accessor read-write))
    (slot precioAlojamiento (type INTEGER) (create-accessor read-write))
)

;; Subclases de Alojamiento
(defclass Apartamento
    (is-a Alojamiento)
    (role concrete)
    (pattern-match reactive)
    (slot capacidad         (type INTEGER) (create-accessor read-write))
)

(defclass Hostal
    (is-a Alojamiento)
    (role concrete)
    (pattern-match reactive)
)

(defclass Hotel
    (is-a Alojamiento)
    (role concrete)
    (pattern-match reactive)
    (slot servicio          (type SYMBOL)  (allowed-symbols si no) (default no) (create-accessor read-write))
)

;; ============================================================================
;; CLASE TRANSPORTE
;; Define cómo se desplazan los usuarios entre el origen y el destino.
;; ============================================================================
(defclass Transporte
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot Origen            (type SYMBOL)  (create-accessor read-write))
    (slot Destino           (type SYMBOL)  (create-accessor read-write))
    (slot accesibilidad     (type SYMBOL)  (allowed-symbols si no) (create-accessor read-write))
    (slot capacidad         (type INTEGER) (create-accessor read-write))
    (slot contaminacion     (type SYMBOL)  (allowed-symbols alta media baja) (create-accessor read-write))
    (slot duracionViaje     (type SYMBOL)  (allowed-symbols corta media larga muy-larga) (create-accessor read-write))
    (slot precioTransporte  (type INTEGER) (create-accessor read-write))
    (slot medio             (type SYMBOL)  (create-accessor read-write))
    (slot claseAsiento      (type SYMBOL)  (create-accessor read-write))
)

;; Subclases de Transporte según el medio utilizado
(defclass Autobus
    (is-a Transporte)
    (role concrete)
    (pattern-match reactive)
)

(defclass Avion
    (is-a Transporte)
    (role concrete)
    (pattern-match reactive)
)

(defclass Barco
    (is-a Transporte)
    (role concrete)
    (pattern-match reactive)
)

(defclass Coche
    (is-a Transporte)
    (role concrete)
    (pattern-match reactive)
    (slot cocheAlquiler    (type SYMBOL)  (allowed-symbols si no) (create-accessor read-write))
)

(defclass Tren
    (is-a Transporte)
    (role concrete)
    (pattern-match reactive)
)

;; ============================================================================
;; CLASE: Ciudad
;; Representa el destino principal del viaje.
;; ============================================================================
(defclass Ciudad
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    
    ;; Relaciones con otras entidades
    (multislot Contienen             (type INSTANCE) (create-accessor read-write))
    (multislot Hablan_en             (type INSTANCE) (create-accessor read-write))
    (multislot Requiere_de           (type INSTANCE) (create-accessor read-write))
    (multislot Se_celebra            (type INSTANCE) (create-accessor read-write))
    (multislot Tiene_un_conjunto_de  (type INSTANCE) (create-accessor read-write))
    (multislot Tipo_de_ciudad        (type INSTANCE) (create-accessor read-write))
    
    ;; Información geográfica y socioeconómica
    (slot continente                 (type SYMBOL)   (create-accessor read-write))
    (slot estiloVida                 (type STRING)   (create-accessor read-write))
    (slot pais                       (type STRING)   (create-accessor read-write))
    (slot precioMedio                (type INTEGER)  (create-accessor read-write))
)

;; ============================================================================
;; CLASES: Puntos de Interés y Eventos
;; Actividades y lugares que se pueden visitar en el destino.
;; ============================================================================
(defclass Punto_de_Interes
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot aptoParaNiños     (type SYMBOL)  (allowed-symbols si no) (create-accessor read-write))
    (slot esAccessible      (type SYMBOL)  (allowed-symbols si no) (create-accessor read-write))
    (slot precioEntrada     (type INTEGER) (create-accessor read-write))
    (slot puntuacion        (type SYMBOL)  (allowed-symbols alta media baja) (create-accessor read-write))
)

(defclass Eventos_especiales
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot aptoParaNiños     (type SYMBOL)  (allowed-symbols si no) (create-accessor read-write))
    (slot esAccesible       (type SYMBOL)  (allowed-symbols si no) (create-accessor read-write))
    (slot precioEntrada     (type INTEGER) (create-accessor read-write))
    (slot puntuacion        (type SYMBOL)  (allowed-symbols alta media baja) (create-accessor read-write))
    (slot tiempo            (type SYMBOL)  (create-accessor read-write))
)

;; ============================================================================
;; CLASES MAESTRAS (Auxiliares/Etiquetas)
;; Clases simples utilizadas principalmente para categorización.
;; ============================================================================
(defclass Idioma
    (is-a USER) (role concrete) (pattern-match reactive)
)

(defclass Material
    (is-a USER) (role concrete) (pattern-match reactive)
)

(defclass Objetivo
    (is-a USER) (role concrete) (pattern-match reactive)
)

(defclass Tematica
    (is-a USER) (role concrete) (pattern-match reactive)
)

(defclass Temporada
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot clima             (type SYMBOL) (create-accessor read-write))
    (slot turismo           (type SYMBOL) (create-accessor read-write))
)

;; ============================================================================
;; CLASE PRINCIPAL: Viaje
;; Conecta todas las entidades anteriores en una propuesta/instancia de viaje.
;; ============================================================================
(defclass Viaje
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    
    ;; Relaciones que componen el viaje completo
    (multislot Enfocado_en          (type INSTANCE) (create-accessor read-write))
    (multislot Quieren_visitar      (type INSTANCE) (create-accessor read-write))
    (multislot Se_alojan_en         (type INSTANCE) (create-accessor read-write))
    (multislot Se_desplaza_en       (type INSTANCE) (create-accessor read-write))
    (multislot Tiene_como_objetivo  (type INSTANCE) (create-accessor read-write))
    (multislot Viaja_en             (type INSTANCE) (create-accessor read-write))
    (multislot Viajan_por           (type INSTANCE) (create-accessor read-write))
    
    ;; Detalles económicos y de tiempo
    (slot Incluye_un_conjunto_de    (type INSTANCE) (create-accessor read-write))
    (slot duracion                  (type INTEGER)  (create-accessor read-write))
    (slot presupuestoViaje          (type INTEGER)  (create-accessor read-write))
)


; ---------------------------------------------------------
; INSTANCIAS
; ---------------------------------------------------------

(definstances instancias-viaje

; =========================================================
; TEMÁTICAS
; =========================================================

(cultura     of Tematica)
(playa       of Tematica)
(montana     of Tematica)
(romantica   of Tematica)
(aventura    of Tematica)
(gastronomia of Tematica)
(fiesta      of Tematica)
(naturaleza  of Tematica)
(historia    of Tematica)
(tecnologia  of Tematica)

; =========================================================
; IDIOMAS
; =========================================================

(espanol   of Idioma)
(frances   of Idioma)
(ingles    of Idioma)
(italiano  of Idioma)
(portugues of Idioma)
(aleman    of Idioma)
(japones   of Idioma)
(chino     of Idioma)
(arabe     of Idioma)

; =========================================================
; OBJETIVOS
; =========================================================

(obj-descanso    of Objetivo)
(obj-cultural    of Objetivo)
(obj-diversion   of Objetivo)
(obj-romantico   of Objetivo)
(obj-aventura    of Objetivo)
(obj-gastronomia of Objetivo)
(obj-negocios    of Objetivo)
(obj-familiar    of Objetivo)
(obj-mochilero   of Objetivo)
(obj-fotografia  of Objetivo)
(obj-naturaleza  of Objetivo)

; =========================================================
; TEMPORADAS
; =========================================================

(temp-verano    of Temporada (clima CALIDO)   (turismo alto))
(temp-invierno  of Temporada (clima MUY-FRIO) (turismo bajo))
(temp-primavera of Temporada (clima TEMPLADO) (turismo medio))
(temp-otono     of Temporada (clima FRIO)     (turismo medio))

; =========================================================
; MATERIALES
; =========================================================

(material-montana  of Material)
(material-playa    of Material)
(material-invierno of Material)
(material-urbano   of Material)
(material-camping  of Material)
(material-senderismo of Material)
(material-fotografia of Material)

; =========================================================
; EVENTOS ESPECIALES — ESPAÑA
; =========================================================

(FeriaAbrilSevilla  of Eventos_especiales (precioEntrada 0)  (esAccesible si) (puntuacion alta) (tiempo 5h)  (aptoParaNiños si))
(SanFermines        of Eventos_especiales (precioEntrada 0)  (esAccesible si) (puntuacion alta) (tiempo 24h) (aptoParaNiños no))
(Tomatina           of Eventos_especiales (precioEntrada 12) (esAccesible no) (puntuacion media)(tiempo 3h)  (aptoParaNiños no))
(LasFallasValencia  of Eventos_especiales (precioEntrada 0)  (esAccesible si) (puntuacion alta) (tiempo 12h) (aptoParaNiños si))
(FeriaLibroMadrid   of Eventos_especiales (precioEntrada 0)  (esAccesible si) (puntuacion alta) (tiempo 8h)  (aptoParaNiños si))
(PrimaveraSoundBCN  of Eventos_especiales (precioEntrada 180)(esAccesible si) (puntuacion alta) (tiempo 10h) (aptoParaNiños no))

; =========================================================
; EVENTOS ESPECIALES — EUROPA
; =========================================================

(OktoberfestMunich  of Eventos_especiales (precioEntrada 0)  (esAccesible si) (puntuacion alta) (tiempo 6h)  (aptoParaNiños no))
(LucesNavidadParis  of Eventos_especiales (precioEntrada 0)  (esAccesible si) (puntuacion media)(tiempo 3h)  (aptoParaNiños si))
(FestivalCineCannes of Eventos_especiales (precioEntrada 0)  (esAccesible si) (puntuacion alta) (tiempo 8h)  (aptoParaNiños no))
(FestivalJazzMontreux of Eventos_especiales (precioEntrada 120)(esAccesible si)(puntuacion alta)(tiempo 6h)(aptoParaNiños no))

; =========================================================
; EVENTOS ESPECIALES — AMÉRICA
; =========================================================

(AnoNuevoTimesSquare of Eventos_especiales (precioEntrada 0) (esAccesible si) (puntuacion alta) (tiempo 10h) (aptoParaNiños si))
(DiaDeMuertosMexico  of Eventos_especiales (precioEntrada 0) (esAccesible si) (puntuacion alta) (tiempo 24h) (aptoParaNiños si))
(CarnavalRio         of Eventos_especiales (precioEntrada 50)(esAccesible si) (puntuacion alta) (tiempo 8h)  (aptoParaNiños no))

; =========================================================
; EVENTOS ESPECIALES — ASIA
; =========================================================

(HanamiTokyo         of Eventos_especiales (precioEntrada 0) (esAccesible si) (puntuacion alta) (tiempo 4h)  (aptoParaNiños si))
(FestivalLinternasTaiwan of Eventos_especiales (precioEntrada 0)(esAccesible si)(puntuacion alta)(tiempo 6h)(aptoParaNiños si))

; =========================================================
; EVENTOS ESPECIALES — OCEANÍA
; =========================================================

(VividSydney         of Eventos_especiales (precioEntrada 0) (esAccesible si) (puntuacion alta) (tiempo 5h)  (aptoParaNiños si))


  ; =========================================================
; PUNTOS DE INTERÉS — ESPAÑA
; =========================================================

; -------------------------
; BARCELONA
; -------------------------

(SagradaFamilia of Punto_de_Interes (precioEntrada 26) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(ParcGuell of Punto_de_Interes (precioEntrada 10) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(CampNou of Punto_de_Interes (precioEntrada 28) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(BarrioGotico of Punto_de_Interes (precioEntrada 0) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(BeachBarcelona of Punto_de_Interes (precioEntrada 0) (esAccessible si) (puntuacion media) (aptoParaNiños si))
(MNAC of Punto_de_Interes (precioEntrada 12) (esAccessible si) (puntuacion alta) (aptoParaNiños no))
(MercadoBoqueria of Punto_de_Interes (precioEntrada 0) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(Tibidabo of Punto_de_Interes (precioEntrada 35) (esAccessible si) (puntuacion alta) (aptoParaNiños si))

; -------------------------
; MADRID
; -------------------------

(MuseoPrado of Punto_de_Interes (precioEntrada 15) (esAccessible si) (puntuacion alta) (aptoParaNiños no))
(RetiroPark of Punto_de_Interes (precioEntrada 0) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(PalacioReal of Punto_de_Interes (precioEntrada 12) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(MercadoSanMiguel of Punto_de_Interes (precioEntrada 0) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(BernabeuTour of Punto_de_Interes (precioEntrada 25) (esAccessible si) (puntuacion media) (aptoParaNiños si))
(ReinaSOfia of Punto_de_Interes (precioEntrada 10) (esAccessible si) (puntuacion alta) (aptoParaNiños no))
(TemploDebod of Punto_de_Interes (precioEntrada 0) (esAccessible si) (puntuacion alta) (aptoParaNiños si))

; -------------------------
; SEVILLA
; -------------------------

(CatedralSevilla of Punto_de_Interes (precioEntrada 10) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(AlcazarSevilla of Punto_de_Interes (precioEntrada 12) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(BarrioTriana of Punto_de_Interes (precioEntrada 0) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(PlazaEspana of Punto_de_Interes (precioEntrada 0) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(TorreDelOro of Punto_de_Interes (precioEntrada 3) (esAccessible si) (puntuacion media) (aptoParaNiños si))
(ArchivoIndias of Punto_de_Interes (precioEntrada 0) (esAccessible si) (puntuacion alta) (aptoParaNiños no))

; -------------------------
; VALENCIA
; -------------------------

(CiudadArtesCiencias of Punto_de_Interes (precioEntrada 38) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(PlayaMalvarrosa of Punto_de_Interes (precioEntrada 0) (esAccessible si) (puntuacion media) (aptoParaNiños si))
(MercadoCentral of Punto_de_Interes (precioEntrada 0) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(CatedralValencia of Punto_de_Interes (precioEntrada 8) (esAccessible si) (puntuacion media) (aptoParaNiños si))
(BioparcValencia of Punto_de_Interes (precioEntrada 20) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(Oceanografic of Punto_de_Interes (precioEntrada 31) (esAccessible si) (puntuacion alta) (aptoParaNiños si))

; -------------------------
; SAN SEBASTIÁN
; -------------------------

(PlayaConcha of Punto_de_Interes (precioEntrada 0) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(ParteVieja of Punto_de_Interes (precioEntrada 0) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(PintosSS of Punto_de_Interes (precioEntrada 0) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(MonteIgeldo of Punto_de_Interes (precioEntrada 5) (esAccessible si) (puntuacion media) (aptoParaNiños si))
(AcuarioSS of Punto_de_Interes (precioEntrada 15) (esAccessible si) (puntuacion alta) (aptoParaNiños si))

; -------------------------
; GRANADA
; -------------------------

(Alhambra of Punto_de_Interes (precioEntrada 15) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(Albaicin of Punto_de_Interes (precioEntrada 0) (esAccessible no) (puntuacion alta) (aptoParaNiños no))
(CathedralGranada of Punto_de_Interes (precioEntrada 5) (esAccessible si) (puntuacion media) (aptoParaNiños si))
(SierraNevadaGranada of Punto_de_Interes (precioEntrada 0) (esAccessible no) (puntuacion alta) (aptoParaNiños no))
(TablaosFlamenco of Punto_de_Interes (precioEntrada 30) (esAccessible si) (puntuacion alta) (aptoParaNiños no))

; =========================================================
; PUNTOS DE INTERÉS — EUROPA
; =========================================================

; -------------------------
; PARÍS
; -------------------------

(TorreEiffel of Punto_de_Interes (precioEntrada 28) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(Louvre of Punto_de_Interes (precioEntrada 17) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(Montmartre of Punto_de_Interes (precioEntrada 0) (esAccessible no) (puntuacion alta) (aptoParaNiños no))
(VersaillesP of Punto_de_Interes (precioEntrada 20) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(ChampsElysees of Punto_de_Interes (precioEntrada 0) (esAccessible si) (puntuacion media) (aptoParaNiños si))
(MuseeOrsay of Punto_de_Interes (precioEntrada 14) (esAccessible si) (puntuacion alta) (aptoParaNiños no))
(CatedralNotreDame of Punto_de_Interes (precioEntrada 0) (esAccessible no) (puntuacion alta) (aptoParaNiños no))

; -------------------------
; ROMA
; -------------------------

(Coliseo of Punto_de_Interes (precioEntrada 18) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(VaticanoCiudad of Punto_de_Interes (precioEntrada 20) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(FontanaTrevi of Punto_de_Interes (precioEntrada 0) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(ForoRomano of Punto_de_Interes (precioEntrada 16) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(PlazaNavona of Punto_de_Interes (precioEntrada 0) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(GaleriaGallese of Punto_de_Interes (precioEntrada 15) (esAccessible si) (puntuacion media) (aptoParaNiños no))

; -------------------------
; AMSTERDAM
; -------------------------

(RijksmuseumA of Punto_de_Interes (precioEntrada 22) (esAccessible si) (puntuacion alta) (aptoParaNiños no))
(CasaAnnaFrank of Punto_de_Interes (precioEntrada 14) (esAccessible si) (puntuacion alta) (aptoParaNiños no))
(CanalesAmsterdam of Punto_de_Interes (precioEntrada 0) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(VondelPark of Punto_de_Interes (precioEntrada 0) (esAccessible si) (puntuacion media) (aptoParaNiños si))
(BarrioRojoA of Punto_de_Interes (precioEntrada 0) (esAccessible si) (puntuacion media) (aptoParaNiños no))

; -------------------------
; LISBOA
; -------------------------

(TorreBelem of Punto_de_Interes (precioEntrada 6) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(MonasterioJeronimos of Punto_de_Interes (precioEntrada 10) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(BarrioAlfama of Punto_de_Interes (precioEntrada 0) (esAccessible no) (puntuacion alta) (aptoParaNiños no))
(CastilloSJorge of Punto_de_Interes (precioEntrada 10) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(PlazoComercioL of Punto_de_Interes (precioEntrada 0) (esAccessible si) (puntuacion media) (aptoParaNiños si))

; -------------------------
; PRAGA
; -------------------------

(CastilloPraga of Punto_de_Interes (precioEntrada 15) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(PuenteCarlos of Punto_de_Interes (precioEntrada 0) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(PlazaVenceslao of Punto_de_Interes (precioEntrada 0) (esAccessible si) (puntuacion media) (aptoParaNiños si))
(BarrioJudioPraga of Punto_de_Interes (precioEntrada 12) (esAccessible si) (puntuacion alta) (aptoParaNiños no))
(CatedralSanVito of Punto_de_Interes (precioEntrada 0) (esAccessible si) (puntuacion alta) (aptoParaNiños si))

; -------------------------
; BERLÍN
; -------------------------

(PuertaBrandeburgo of Punto_de_Interes (precioEntrada 0) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(MuroBerlin of Punto_de_Interes (precioEntrada 0) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(Reichstag of Punto_de_Interes (precioEntrada 0) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(MuseoPergamo of Punto_de_Interes (precioEntrada 19) (esAccessible si) (puntuacion alta) (aptoParaNiños no))
(CheckpointCharlie of Punto_de_Interes (precioEntrada 0) (esAccessible si) (puntuacion media) (aptoParaNiños si))

; =========================================================
; PUNTOS DE INTERÉS — AMÉRICA
; =========================================================

; -------------------------
; NUEVA YORK
; -------------------------

(EstatuaLibertad of Punto_de_Interes (precioEntrada 25) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(CentralPark of Punto_de_Interes (precioEntrada 0) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(TimesSquare of Punto_de_Interes (precioEntrada 0) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(EmpireState of Punto_de_Interes (precioEntrada 40) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(MetropolitanNY of Punto_de_Interes (precioEntrada 25) (esAccessible si) (puntuacion alta) (aptoParaNiños no))

; -------------------------
; BUENOS AIRES
; -------------------------

(TeatroColon of Punto_de_Interes (precioEntrada 15) (esAccessible si) (puntuacion alta) (aptoParaNiños no))
(ObeliscoBA of Punto_de_Interes (precioEntrada 0) (esAccessible si) (puntuacion media) (aptoParaNiños si))
(Caminito of Punto_de_Interes (precioEntrada 0) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(Recoleta of Punto_de_Interes (precioEntrada 0) (esAccessible si) (puntuacion media) (aptoParaNiños si))
(PuertoMaderoBA of Punto_de_Interes (precioEntrada 0) (esAccessible si) (puntuacion media) (aptoParaNiños si))

; =========================================================
; PUNTOS DE INTERÉS — ÁFRICA
; =========================================================

; -------------------------
; EL CAIRO
; -------------------------

(PiramidesGiza of Punto_de_Interes (precioEntrada 20) (esAccessible no) (puntuacion alta) (aptoParaNiños no))
(MuseoEgipcio of Punto_de_Interes (precioEntrada 12) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(KhanElKhalili of Punto_de_Interes (precioEntrada 0) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(CiudadelaCairo of Punto_de_Interes (precioEntrada 8) (esAccessible si) (puntuacion media) (aptoParaNiños si))

; -------------------------
; CIUDAD DEL CABO
; -------------------------

(TableMountain of Punto_de_Interes (precioEntrada 22) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(RobbenIsland of Punto_de_Interes (precioEntrada 30) (esAccessible si) (puntuacion alta) (aptoParaNiños no))
(CapePoint of Punto_de_Interes (precioEntrada 15) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(BouldersBeach of Punto_de_Interes (precioEntrada 10) (esAccessible si) (puntuacion alta) (aptoParaNiños si))

; =========================================================
; PUNTOS DE INTERÉS — ASIA
; =========================================================

; -------------------------
; TOKYO
; -------------------------

(TorreTokyoT of Punto_de_Interes (precioEntrada 12) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(TemploSensoji of Punto_de_Interes (precioEntrada 0) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(ShinjukuT of Punto_de_Interes (precioEntrada 0) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(AkihabaraTok of Punto_de_Interes (precioEntrada 0) (esAccessible si) (puntuacion media) (aptoParaNiños si))
(MonteFujiTok of Punto_de_Interes (precioEntrada 5) (esAccessible no) (puntuacion alta) (aptoParaNiños no))
(DisneySea of Punto_de_Interes (precioEntrada 80) (esAccessible si) (puntuacion alta) (aptoParaNiños si))

; -------------------------
; BANGKOK
; -------------------------

(GranPalacioBK of Punto_de_Interes (precioEntrada 15) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(WatArun of Punto_de_Interes (precioEntrada 5) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(MercadoChatuchak of Punto_de_Interes (precioEntrada 0) (esAccessible si) (puntuacion alta) (aptoParaNiños si))
(RioChaoPhrayaBK of Punto_de_Interes (precioEntrada 10) (esAccessible si) (puntuacion media) (aptoParaNiños si))


; =========================================================
; CIUDADES — ESPAÑA
; =========================================================

(Barcelona of Ciudad
   (pais "Espana")
   (continente Europa)
   (precioMedio 130)
   (estiloVida "cosmopolita")
   (Tipo_de_ciudad [cultura] [playa] [gastronomia])
   (Hablan_en [espanol])
   (Contienen [SagradaFamilia] [ParcGuell] [CampNou] [BarrioGotico]
              [BeachBarcelona] [MNAC] [MercadoBoqueria] [Tibidabo])
   (Tiene_un_conjunto_de [HotelArtsBarcelona] [HostalRamblasBarcelona] [ApartBarcelona1]
                         [HotelDiagonalSky] [HostalBornBackpackers] [ApartBCNBeach])
   (Requiere_de [material-urbano] [material-playa])
   (Se_celebra [FinalChampions] [PrimaveraSoundBCN]))

(Madrid of Ciudad
   (pais "Espana")
   (continente Europa)
   (precioMedio 110)
   (estiloVida "animada")
   (Tipo_de_ciudad [cultura] [gastronomia] [fiesta])
   (Hablan_en [espanol])
   (Contienen [MuseoPrado] [RetiroPark] [PalacioReal] [MercadoSanMiguel]
              [BernabeuTour] [ReinaSOfia] [TemploDebod])
   (Tiene_un_conjunto_de [HotelWMadrid] [HostalMadridCentro] [ApartMadrid1]
                         [HotelGranViaPremium] [HostalSolBackpackers] [ApartMadridCentro2])
   (Requiere_de [material-urbano])
   (Se_celebra [FeriaLibroMadrid]))

(Sevilla of Ciudad
   (pais "Espana")
   (continente Europa)
   (precioMedio 85)
   (estiloVida "tradicional")
   (Tipo_de_ciudad [cultura] [gastronomia] [romantica])
   (Hablan_en [espanol])
   (Contienen [CatedralSevilla] [AlcazarSevilla] [BarrioTriana]
              [PlazaEspana] [TorreDelOro] [ArchivoIndias])
   (Tiene_un_conjunto_de [HotelAlfonsXIII] [HostalSevillaCentro] [ApartSevilla1]
                         [HotelTrianaSuites] [HostalSantaCruz] [ApartSevillaRiverside])
   (Requiere_de [material-urbano])
   (Se_celebra [FeriaAbrilSevilla]))

(Valencia of Ciudad
   (pais "Espana")
   (continente Europa)
   (precioMedio 90)
   (estiloVida "mediterranea")
   (Tipo_de_ciudad [playa] [gastronomia] [cultura])
   (Hablan_en [espanol])
   (Contienen [CiudadArtesCiencias] [PlayaMalvarrosa] [MercadoCentral]
              [CatedralValencia] [BioparcValencia] [Oceanografic])
   (Tiene_un_conjunto_de [HotelSheratonValencia] [HostalValenciaCentro] [ApartValencia1]
                         [HotelRuzafaUrban] [HostalCarmen] [ApartValenciaBeach])
   (Requiere_de [material-playa] [material-urbano])
   (Se_celebra [LasFallasValencia]))

(SanSebastian of Ciudad
   (pais "Espana")
   (continente Europa)
   (precioMedio 140)
   (estiloVida "elegante")
   (Tipo_de_ciudad [gastronomia] [playa] [cultura])
   (Hablan_en [espanol])
   (Contienen [PlayaConcha] [ParteVieja] [PintosSS] [MonteIgeldo] [AcuarioSS])
   (Tiene_un_conjunto_de [HotelMariaDristinasSS] [HostalSSCentro] [ApartSS1]
                         [HotelZurriolaView] [HostalOldTown] [ApartSSBeach])
   (Requiere_de [material-playa] [material-invierno])
   (Se_celebra [SanFermines]))

(Granada of Ciudad
   (pais "Espana")
   (continente Europa)
   (precioMedio 75)
   (estiloVida "historica")
   (Tipo_de_ciudad [cultura] [romantica] [montana])
   (Hablan_en [espanol])
   (Contienen [Alhambra] [Albaicin] [CathedralGranada]
              [SierraNevadaGranada] [TablaosFlamenco])
   (Tiene_un_conjunto_de [HotelParadorGranada] [HostalGranadaCentro] [ApartGranada1]
                         [HotelAlbayzinSuites] [HostalRealejo] [ApartGranadaMirador])
   (Requiere_de [material-montana] [material-invierno]))

; =========================================================
; CIUDADES — EUROPA
; =========================================================

(Paris of Ciudad
   (pais "Francia")
   (continente Europa)
   (precioMedio 190)
   (estiloVida "romantica")
   (Tipo_de_ciudad [romantica] [cultura] [gastronomia])
   (Hablan_en [frances])
   (Contienen [TorreEiffel] [Louvre] [Montmartre] [VersaillesP]
              [ChampsElysees] [MuseeOrsay] [CatedralNotreDame])
   (Tiene_un_conjunto_de [HotelRitzParis] [HostalParisCentro] [ApartParis1]
                         [HotelMontmartreView] [HostalLatinQuarter] [ApartParisOpera])
   (Requiere_de [material-urbano])
   (Se_celebra [LucesNavidadParis] [FestivalCineCannes]))

(Roma of Ciudad
   (pais "Italia")
   (continente Europa)
   (precioMedio 150)
   (estiloVida "historica")
   (Tipo_de_ciudad [cultura] [gastronomia] [romantica])
   (Hablan_en [italiano])
   (Contienen [Coliseo] [VaticanoCiudad] [FontanaTrevi]
              [ForoRomano] [PlazaNavona] [GaleriaGallese])
   (Tiene_un_conjunto_de [HotelExcelsiorRoma] [HostalRomaCentro] [ApartRoma1]
                         [HotelTrastevereSuites] [HostalTermini] [ApartRomaColosseo])
   (Requiere_de [material-urbano]))

(Amsterdam of Ciudad
   (pais "Holanda")
   (continente Europa)
   (precioMedio 170)
   (estiloVida "liberal")
   (Tipo_de_ciudad [cultura] [fiesta] [aventura])
   (Hablan_en [ingles])
   (Contienen [RijksmuseumA] [CasaAnnaFrank] [CanalesAmsterdam]
              [VondelPark] [BarrioRojoA])
   (Tiene_un_conjunto_de [HotelPulitzerAmsterdam] [HostalAmsterdamCentro] [ApartAmsterdam1]
                         [HotelCanalView] [HostalJordaan] [ApartAmsterdamDock])
   (Requiere_de [material-urbano]))

(Lisboa of Ciudad
   (pais "Portugal")
   (continente Europa)
   (precioMedio 95)
   (estiloVida "nostalgica")
   (Tipo_de_ciudad [cultura] [gastronomia] [romantica])
   (Hablan_en [portugues])
   (Contienen [TorreBelem] [MonasterioJeronimos] [BarrioAlfama]
              [CastilloSJorge] [PlazoComercioL])
   (Tiene_un_conjunto_de [HotelBairroAltoLisboa] [HostalLisboaCentro] [ApartLisboa1]
                         [HotelChiadoSky] [HostalAlfama] [ApartLisboaRiver])
   (Requiere_de [material-urbano]))

(Praga of Ciudad
   (pais "Republica Checa")
   (continente Europa)
   (precioMedio 80)
   (estiloVida "medieval")
   (Tipo_de_ciudad [cultura] [fiesta] [romantica])
   (Hablan_en [ingles])
   (Contienen [CastilloPraga] [PuenteCarlos] [PlazaVenceslao]
              [BarrioJudioPraga] [CatedralSanVito])
   (Tiene_un_conjunto_de [HotelFourSeasonsPraga] [HostalPragaCentro] [ApartPraga1]
                         [HotelOldTownPraga] [HostalMalaStrana] [ApartPragaCastle])
   (Requiere_de [material-urbano]))

(Berlin of Ciudad
   (pais "Alemania")
   (continente Europa)
   (precioMedio 120)
   (estiloVida "alternativa")
   (Tipo_de_ciudad [cultura] [fiesta])
   (Hablan_en [aleman] [ingles])
   (Contienen [PuertaBrandeburgo] [MuroBerlin] [Reichstag]
              [MuseoPergamo] [CheckpointCharlie])
   (Tiene_un_conjunto_de [HotelAdlonBerlin] [HostalBerlinMitte] [ApartBerlin1]
                         [HotelKreuzbergUrban] [HostalPrenzlauer] [ApartBerlinWall])
   (Requiere_de [material-urbano])
   (Se_celebra [OktoberfestMunich]))

; =========================================================
; CIUDADES — OCEANÍA
; =========================================================

(Sydney of Ciudad
   (pais "Australia")
   (continente Oceania)
   (precioMedio 180)
   (estiloVida "relajada-playera")
   (Tipo_de_ciudad [playa] [cultura] [aventura])
   (Hablan_en [ingles])
   (Contienen [OperaHouse] [BondiBeach] [HarbourBridge] [TarongaZoo])
   (Tiene_un_conjunto_de [HotelParkHyattSyd] [HostalSydSurf] [ApartSyd1]
                         [HotelDarlingHarbour] [HostalBondi] [ApartSydOpera])
   (Requiere_de [material-urbano] [material-playa])
   (Se_celebra [VividSydney]))

(OperaHouse of Punto_de_Interes
   (precioEntrada 45)
   (esAccessible si)
   (puntuacion alta)
   (aptoParaNiños si))

(BondiBeach of Punto_de_Interes
   (precioEntrada 0)
   (esAccessible si)
   (puntuacion alta)
   (aptoParaNiños si))

(HarbourBridge of Punto_de_Interes
   (precioEntrada 0)
   (esAccessible si)
   (puntuacion media)
   (aptoParaNiños si))

(TarongaZoo of Punto_de_Interes
   (precioEntrada 35)
   (esAccessible si)
   (puntuacion alta)
   (aptoParaNiños si))

(HotelParkHyattSyd of Hotel
   (accesibilidad si)
   (ambiente TRANQUILO)
   (calidadAlojamiento 5)
   (precioAlojamiento 220)
   (servicio si))

(HostalSydSurf of Hostal
   (accesibilidad no)
   (ambiente SOCIAL)
   (calidadAlojamiento 3)
   (precioAlojamiento 35))

(ApartSyd1 of Apartamento
   (accesibilidad si)
   (ambiente TRANQUILO)
   (calidadAlojamiento 4)
   (precioAlojamiento 110)
   (capacidad 4))

(HotelDarlingHarbour of Hotel
   (accesibilidad si)
   (ambiente TRANQUILO)
   (calidadAlojamiento 4)
   (precioAlojamiento 160)
   (servicio si))

(HostalBondi of Hostal
   (accesibilidad no)
   (ambiente SOCIAL)
   (calidadAlojamiento 2)
   (precioAlojamiento 28))

(ApartSydOpera of Apartamento
   (accesibilidad si)
   (ambiente TRANQUILO)
   (calidadAlojamiento 4)
   (precioAlojamiento 130)
   (capacidad 3))

; =========================================================
; CIUDADES — AMÉRICA
; =========================================================

(NuevaYork of Ciudad
   (pais "EEUU")
   (continente America)
   (precioMedio 250)
   (estiloVida "frenetica")
   (Tipo_de_ciudad [cultura] [gastronomia] [aventura])
   (Hablan_en [ingles])
   (Contienen [EstatuaLibertad] [CentralPark] [TimesSquare]
              [EmpireState] [MetropolitanNY])
   (Tiene_un_conjunto_de [HotelMarriottNY] [HostalNYCentral] [ApartNY1]
                         [HotelBrooklynBridge] [HostalHarlem] [ApartNYMidtown])
   (Requiere_de [material-urbano])
   (Se_celebra [AnoNuevoTimesSquare]))

(BuenosAires of Ciudad
   (pais "Argentina")
   (continente America)
   (precioMedio 90)
   (estiloVida "bohemia")
   (Tipo_de_ciudad [cultura] [gastronomia] [romantica])
   (Hablan_en [espanol])
   (Contienen [TeatroColon] [ObeliscoBA] [Caminito]
              [Recoleta] [PuertoMaderoBA])
   (Tiene_un_conjunto_de [HotelAlvearBA] [HostalPalermo] [ApartBA1]
                         [HotelSanTelmo] [HostalLaBoca] [ApartBARecoleta])
   (Requiere_de [material-urbano])
   (Se_celebra [CarnavalRio]))

; =========================================================
; CIUDADES — ÁFRICA
; =========================================================

(ElCairo of Ciudad
   (pais "Egipto")
   (continente Africa)
   (precioMedio 60)
   (estiloVida "caotica-historica")
   (Tipo_de_ciudad [cultura] [aventura])
   (Hablan_en [ingles])
   (Contienen [PiramidesGiza] [MuseoEgipcio] [KhanElKhalili] [CiudadelaCairo])
   (Tiene_un_conjunto_de [HotelRitzCairo] [HostalCairoOld] [ApartCairo1]
                         [HotelNiloView] [HostalGiza] [ApartCairoMuseum])
   (Requiere_de [material-urbano]))

(HotelRitzCairo of Hotel
   (accesibilidad si)
   (ambiente TRANQUILO)
   (calidadAlojamiento 5)
   (precioAlojamiento 140)
   (servicio si))

(HostalCairoOld of Hostal
   (accesibilidad no)
   (ambiente SOCIAL)
   (calidadAlojamiento 2)
   (precioAlojamiento 18))

(ApartCairo1 of Apartamento
   (accesibilidad si)
   (ambiente TRANQUILO)
   (calidadAlojamiento 3)
   (precioAlojamiento 35)
   (capacidad 4))

(HotelNiloView of Hotel
   (accesibilidad si)
   (ambiente TRANQUILO)
   (calidadAlojamiento 4)
   (precioAlojamiento 90)
   (servicio si))

(HostalGiza of Hostal
   (accesibilidad no)
   (ambiente SOCIAL)
   (calidadAlojamiento 2)
   (precioAlojamiento 15))

(ApartCairoMuseum of Apartamento
   (accesibilidad si)
   (ambiente TRANQUILO)
   (calidadAlojamiento 3)
   (precioAlojamiento 40)
   (capacidad 3))

(HotelTheSilof of Hotel
   (accesibilidad si)
   (ambiente TRANQUILO)
   (calidadAlojamiento 5)
   (precioAlojamiento 200)
   (servicio si))

(HostalCapeBackpackers of Hostal
   (accesibilidad no)
   (ambiente SOCIAL)
   (calidadAlojamiento 2)
   (precioAlojamiento 22))

(ApartCape1 of Apartamento
   (accesibilidad si)
   (ambiente TRANQUILO)
   (calidadAlojamiento 4)
   (precioAlojamiento 70)
   (capacidad 4))

(HotelWaterfront of Hotel
   (accesibilidad si)
   (ambiente TRANQUILO)
   (calidadAlojamiento 4)
   (precioAlojamiento 150)
   (servicio si))

(HostalMuizenberg of Hostal
   (accesibilidad no)
   (ambiente SOCIAL)
   (calidadAlojamiento 2)
   (precioAlojamiento 20))

(ApartCapeHarbour of Apartamento
   (accesibilidad si)
   (ambiente TRANQUILO)
   (calidadAlojamiento 4)
   (precioAlojamiento 85)
   (capacidad 3))

(CiudadDelCabo of Ciudad
   (pais "Sudafrica")
   (continente Africa)
   (precioMedio 110)
   (estiloVida "natural")
   (Tipo_de_ciudad [aventura] [playa] [gastronomia])
   (Hablan_en [ingles])
   (Contienen [TableMountain] [RobbenIsland] [CapePoint] [BouldersBeach])
   (Tiene_un_conjunto_de [HotelTheSilof] [HostalCapeBackpackers] [ApartCape1]
                         [HotelWaterfront] [HostalMuizenberg] [ApartCapeHarbour])
   (Requiere_de [material-urbano] [material-playa]))

(HotelMandarinBK of Hotel
   (accesibilidad si)
   (ambiente TRANQUILO)
   (calidadAlojamiento 5)
   (precioAlojamiento 120)
   (servicio si))

(HotelSukhumvitSky of Hotel
   (accesibilidad si)
   (ambiente TRANQUILO)
   (calidadAlojamiento 4)
   (precioAlojamiento 80)
   (servicio si))

(HostalBKStreet of Hostal
   (accesibilidad no)
   (ambiente SOCIAL)
   (calidadAlojamiento 2)
   (precioAlojamiento 18))

(HostalKhaoSan of Hostal
   (accesibilidad no)
   (ambiente SOCIAL)
   (calidadAlojamiento 2)
   (precioAlojamiento 15))

(ApartBK1 of Apartamento
   (accesibilidad si)
   (ambiente TRANQUILO)
   (calidadAlojamiento 4)
   (precioAlojamiento 45)
   (capacidad 4))

(ApartBKRiver of Apartamento
   (accesibilidad si)
   (ambiente TRANQUILO)
   (calidadAlojamiento 4)
   (precioAlojamiento 55)
   (capacidad 3))

; =========================================================
; CIUDADES — ASIA
; =========================================================

(Bangkok of Ciudad
   (pais "Tailandia")
   (continente Asia)
   (precioMedio 50)
   (estiloVida "exotica")
   (Tipo_de_ciudad [gastronomia] [cultura] [aventura])
   (Hablan_en [ingles])
   (Contienen [GranPalacioBK] [WatArun] [MercadoChatuchak] [RioChaoPhrayaBK])
   (Tiene_un_conjunto_de [HotelMandarinBK] [HostalBKStreet] [ApartBK1]
                         [HotelSukhumvitSky] [HostalKhaoSan] [ApartBKRiver])
   (Requiere_de [material-urbano]))

(Tokyo of Ciudad
   (pais "Japon")
   (continente Asia)
   (precioMedio 200)
   (estiloVida "futurista")
   (Tipo_de_ciudad [cultura] [gastronomia] [aventura])
   (Hablan_en [japones])
   (Contienen [TorreTokyoT] [TemploSensoji] [ShinjukuT]
              [AkihabaraTok] [MonteFujiTok] [DisneySea])
   (Tiene_un_conjunto_de [HotelParkHyattTokyo] [HostalTokyoCentro] [ApartTokyo1]
                         [HotelShibuyaSky] [HostalAsakusa] [ApartTokyoGinza] [HostalShinjukuNight])
   (Requiere_de [material-urbano])
   (Se_celebra [HanamiTokyo]))

   (ApartTokyo1 of Apartamento
   (accesibilidad si)
   (ambiente TRANQUILO)
   (calidadAlojamiento 4)
   (precioAlojamiento 130)
   (capacidad 3))

(ApartTokyoGinza of Apartamento
   (accesibilidad si)
   (ambiente TRANQUILO)
   (calidadAlojamiento 4)
   (precioAlojamiento 150)
   (capacidad 2))

(HotelParkHyattTokyo of Hotel
   (accesibilidad si)
   (ambiente TRANQUILO)
   (calidadAlojamiento 5)
   (precioAlojamiento 260)
   (servicio si))

(HostalShinjukuNight of Hostal
   (accesibilidad no)
   (ambiente SOCIAL)
   (calidadAlojamiento 3)
   (precioAlojamiento 32))

(HostalTokyoCentro of Hostal
   (accesibilidad si)
   (ambiente SOCIAL)
   (calidadAlojamiento 3)
   (precioAlojamiento 40))

(HotelTokyoBay of Hotel
   (accesibilidad si)
   (ambiente TRANQUILO)
   (calidadAlojamiento 4)
   (precioAlojamiento 150)
   (servicio si))

(HotelShibuyaSky of Hotel
   (accesibilidad si)
   (ambiente TRANQUILO)
   (calidadAlojamiento 4)
   (precioAlojamiento 180)
   (servicio si))

(HostalAsakusa of Hostal
   (accesibilidad no)
   (ambiente SOCIAL)
   (calidadAlojamiento 2)
   (precioAlojamiento 28))

(HotelGinzaPremium of Hotel
   (accesibilidad si)
   (ambiente TRANQUILO)
   (calidadAlojamiento 5)
   (precioAlojamiento 220)
   (servicio si))

(Alicante of Ciudad
   (pais "Espana")
   (continente Europa)
   (precioMedio 95)
   (estiloVida "mediterranea")
   (Tipo_de_ciudad [playa] [gastronomia] [cultura])
   (Hablan_en [espanol])
   (Contienen [PlayaSanJuan] [CastilloSantaBarbara] [ExplanadaAlicante])
   (Tiene_un_conjunto_de [HotelMeliaAlicante] [HostalAlicanteCentro] [ApartAlicante1])
   (Requiere_de [material-playa] [material-urbano]))

(PlayaSanJuan of Punto_de_Interes
   (precioEntrada 0)
   (esAccessible si)
   (puntuacion alta)
   (aptoParaNiños si))

(CastilloSantaBarbara of Punto_de_Interes
   (precioEntrada 0)
   (esAccessible si)
   (puntuacion alta)
   (aptoParaNiños si))

(ExplanadaAlicante of Punto_de_Interes
   (precioEntrada 0)
   (esAccessible si)
   (puntuacion media)
   (aptoParaNiños si))

(HotelMeliaAlicante of Hotel
   (calidadAlojamiento 4)
   (precioAlojamiento 150)
   (servicio si)
   (accesibilidad si)
   (ambiente TRANQUILO))

(HostalAlicanteCentro of Hostal
   (calidadAlojamiento 2)
   (precioAlojamiento 35)
   (accesibilidad no)
   (ambiente SOCIAL))

(ApartAlicante1 of Apartamento
   (calidadAlojamiento 3)
   (precioAlojamiento 80)
   (capacidad 3)
   (accesibilidad si)
   (ambiente TRANQUILO))


  ; =========================================================
; ALOJAMIENTOS — ESPAÑA
; =========================================================

; -------------------------
; BARCELONA
; -------------------------

(HotelArtsBarcelona of Hotel
   (calidadAlojamiento 5)
   (precioAlojamiento 220)
   (servicio si)
   (accesibilidad si)
   (ambiente TRANQUILO))

(HostalRamblasBarcelona of Hostal
   (calidadAlojamiento 3)
   (precioAlojamiento 55)
   (accesibilidad no)
   (ambiente SOCIAL))

(ApartBarcelona1 of Apartamento
   (calidadAlojamiento 4)
   (precioAlojamiento 120)
   (capacidad 4)
   (accesibilidad si)
   (ambiente TRANQUILO))

(HotelDiagonalSky of Hotel
   (calidadAlojamiento 4)
   (precioAlojamiento 150)
   (servicio si)
   (accesibilidad si)
   (ambiente TRANQUILO))

(HostalBornBackpackers of Hostal
   (calidadAlojamiento 2)
   (precioAlojamiento 35)
   (accesibilidad no)
   (ambiente SOCIAL))

(ApartBCNBeach of Apartamento
   (calidadAlojamiento 3)
   (precioAlojamiento 95)
   (capacidad 3)
   (accesibilidad si)
   (ambiente TRANQUILO))

; -------------------------
; MADRID
; -------------------------

(HotelWMadrid of Hotel
   (calidadAlojamiento 5)
   (precioAlojamiento 210)
   (servicio si)
   (accesibilidad si)
   (ambiente TRANQUILO))

(HostalMadridCentro of Hostal
   (calidadAlojamiento 3)
   (precioAlojamiento 45)
   (accesibilidad no)
   (ambiente SOCIAL))

(ApartMadrid1 of Apartamento
   (calidadAlojamiento 4)
   (precioAlojamiento 110)
   (capacidad 4)
   (accesibilidad si)
   (ambiente TRANQUILO))

(HotelGranViaPremium of Hotel
   (calidadAlojamiento 4)
   (precioAlojamiento 160)
   (servicio si)
   (accesibilidad si)
   (ambiente TRANQUILO))

(HostalSolBackpackers of Hostal
   (calidadAlojamiento 2)
   (precioAlojamiento 30)
   (accesibilidad no)
   (ambiente SOCIAL))

(ApartMadridCentro2 of Apartamento
   (calidadAlojamiento 3)
   (precioAlojamiento 85)
   (capacidad 3)
   (accesibilidad si)
   (ambiente TRANQUILO))

; -------------------------
; SEVILLA
; -------------------------

(HotelAlfonsXIII of Hotel
   (calidadAlojamiento 5)
   (precioAlojamiento 230)
   (servicio si)
   (accesibilidad si)
   (ambiente TRANQUILO))

(HostalSevillaCentro of Hostal
   (calidadAlojamiento 3)
   (precioAlojamiento 40)
   (accesibilidad no)
   (ambiente SOCIAL))

(ApartSevilla1 of Apartamento
   (calidadAlojamiento 4)
   (precioAlojamiento 90)
   (capacidad 4)
   (accesibilidad si)
   (ambiente TRANQUILO))


(HotelTrianaSuites of Hotel
   (calidadAlojamiento 4)
   (precioAlojamiento 140)
   (servicio si)
   (accesibilidad si)
   (ambiente TRANQUILO))

(HostalSantaCruz of Hostal
   (calidadAlojamiento 2)
   (precioAlojamiento 28)
   (accesibilidad no)
   (ambiente SOCIAL))

(ApartSevillaRiverside of Apartamento
   (calidadAlojamiento 3)
   (precioAlojamiento 75)
   (capacidad 3)
   (accesibilidad si)
   (ambiente TRANQUILO))

; -------------------------
; VALENCIA
; -------------------------

(HotelSheratonValencia of Hotel
   (calidadAlojamiento 5)
   (precioAlojamiento 180)
   (servicio si)
   (accesibilidad si)
   (ambiente TRANQUILO))

(HostalValenciaCentro of Hostal
   (calidadAlojamiento 3)
   (precioAlojamiento 38)
   (accesibilidad no)
   (ambiente SOCIAL))

(ApartValencia1 of Apartamento
   (calidadAlojamiento 4)
   (precioAlojamiento 95)
   (capacidad 4)
   (accesibilidad si)
   (ambiente TRANQUILO))

(HotelRuzafaUrban of Hotel
   (calidadAlojamiento 4)
   (precioAlojamiento 130)
   (servicio si)
   (accesibilidad si)
   (ambiente TRANQUILO))

(HostalCarmen of Hostal
   (calidadAlojamiento 2)
   (precioAlojamiento 28)
   (accesibilidad no)
   (ambiente SOCIAL))

(ApartValenciaBeach of Apartamento
   (calidadAlojamiento 3)
   (precioAlojamiento 80)
   (capacidad 3)
   (accesibilidad si)
   (ambiente TRANQUILO))

; -------------------------
; SAN SEBASTIÁN
; -------------------------

(HotelMariaDristinasSS of Hotel
   (calidadAlojamiento 5)
   (precioAlojamiento 240)
   (servicio si)
   (accesibilidad si)
   (ambiente TRANQUILO))

(HostalSSCentro of Hostal
   (calidadAlojamiento 3)
   (precioAlojamiento 50)
   (accesibilidad no)
   (ambiente SOCIAL))

(ApartSS1 of Apartamento
   (calidadAlojamiento 4)
   (precioAlojamiento 120)
   (capacidad 4)
   (accesibilidad si)
   (ambiente TRANQUILO))

(HotelZurriolaView of Hotel
   (calidadAlojamiento 4)
   (precioAlojamiento 160)
   (servicio si)
   (accesibilidad si)
   (ambiente TRANQUILO))

(HostalOldTown of Hostal
   (calidadAlojamiento 2)
   (precioAlojamiento 32)
   (accesibilidad no)
   (ambiente SOCIAL))

(ApartSSBeach of Apartamento
   (calidadAlojamiento 3)
   (precioAlojamiento 85)
   (capacidad 3)
   (accesibilidad si)
   (ambiente TRANQUILO))

; -------------------------
; GRANADA
; -------------------------

(HotelParadorGranada of Hotel
   (calidadAlojamiento 5)
   (precioAlojamiento 200)
   (servicio si)
   (accesibilidad si)
   (ambiente TRANQUILO))

(HostalGranadaCentro of Hostal
   (calidadAlojamiento 3)
   (precioAlojamiento 35)
   (accesibilidad no)
   (ambiente SOCIAL))

(ApartGranada1 of Apartamento
   (calidadAlojamiento 4)
   (precioAlojamiento 85)
   (capacidad 4)
   (accesibilidad si)
   (ambiente TRANQUILO))

(HotelAlbayzinSuites of Hotel
   (calidadAlojamiento 4)
   (precioAlojamiento 140)
   (servicio si)
   (accesibilidad si)
   (ambiente TRANQUILO))

(HostalRealejo of Hostal
   (calidadAlojamiento 2)
   (precioAlojamiento 28)
   (accesibilidad no)
   (ambiente SOCIAL))

(ApartGranadaMirador of Apartamento
   (calidadAlojamiento 3)
   (precioAlojamiento 70)
   (capacidad 3)
   (accesibilidad si)
   (ambiente TRANQUILO))

; -------------------------
; PARIS
; -------------------------

(HotelRitzParis of Hotel
   (calidadAlojamiento 5)
   (precioAlojamiento 450)
   (servicio si)
   (accesibilidad si)
   (ambiente TRANQUILO))

(HostalParisCentro of Hostal
   (calidadAlojamiento 3)
   (precioAlojamiento 50)
   (accesibilidad no)
   (ambiente SOCIAL))

(ApartParis1 of Apartamento
   (calidadAlojamiento 4)
   (precioAlojamiento 180)
   (capacidad 4)
   (accesibilidad si)
   (ambiente TRANQUILO))

(HotelMontmartreView of Hotel
   (calidadAlojamiento 4)
   (precioAlojamiento 210)
   (servicio si)
   (accesibilidad si)
   (ambiente TRANQUILO))

(HostalLatinQuarter of Hostal
   (calidadAlojamiento 2)
   (precioAlojamiento 35)
   (accesibilidad no)
   (ambiente SOCIAL))

(ApartParisOpera of Apartamento
   (calidadAlojamiento 3)
   (precioAlojamiento 140)
   (capacidad 3)
   (accesibilidad si)
   (ambiente TRANQUILO))

; -------------------------
; ROMA
; -------------------------

(HotelExcelsiorRoma of Hotel
   (calidadAlojamiento 5)
   (precioAlojamiento 300)
   (servicio si)
   (accesibilidad si)
   (ambiente TRANQUILO))

(HostalRomaCentro of Hostal
   (calidadAlojamiento 3)
   (precioAlojamiento 45)
   (accesibilidad no)
   (ambiente SOCIAL))

(ApartRoma1 of Apartamento
   (calidadAlojamiento 4)
   (precioAlojamiento 130)
   (capacidad 4)
   (accesibilidad si)
   (ambiente TRANQUILO))

(HotelTrastevereSuites of Hotel
   (calidadAlojamiento 4)
   (precioAlojamiento 160)
   (servicio si)
   (accesibilidad si)
   (ambiente TRANQUILO))

(HostalTermini of Hostal
   (calidadAlojamiento 2)
   (precioAlojamiento 32)
   (accesibilidad no)
   (ambiente SOCIAL))

(ApartRomaColosseo of Apartamento
   (calidadAlojamiento 3)
   (precioAlojamiento 110)
   (capacidad 3)
   (accesibilidad si)
   (ambiente TRANQUILO))

; -------------------------
; AMSTERDAM
; -------------------------

(HotelPulitzerAmsterdam of Hotel
   (calidadAlojamiento 5)
   (precioAlojamiento 260)
   (servicio si)
   (accesibilidad si)
   (ambiente TRANQUILO))

(HostalAmsterdamCentro of Hostal
   (calidadAlojamiento 3)
   (precioAlojamiento 48)
   (accesibilidad no)
   (ambiente SOCIAL))

(ApartAmsterdam1 of Apartamento
   (calidadAlojamiento 4)
   (precioAlojamiento 150)
   (capacidad 4)
   (accesibilidad si)
   (ambiente TRANQUILO))


(HotelCanalView of Hotel
   (calidadAlojamiento 4)
   (precioAlojamiento 180)
   (servicio si)
   (accesibilidad si)
   (ambiente TRANQUILO))

(HostalJordaan of Hostal
   (calidadAlojamiento 2)
   (precioAlojamiento 30)
   (accesibilidad no)
   (ambiente SOCIAL))

(ApartAmsterdamDock of Apartamento
   (calidadAlojamiento 3)
   (precioAlojamiento 120)
   (capacidad 3)
   (accesibilidad si)
   (ambiente TRANQUILO))

; -------------------------
; LISBOA
; -------------------------

(HotelBairroAltoLisboa of Hotel
   (calidadAlojamiento 5)
   (precioAlojamiento 220)
   (servicio si)
   (accesibilidad si)
   (ambiente TRANQUILO))

(HostalLisboaCentro of Hostal
   (calidadAlojamiento 3)
   (precioAlojamiento 40)
   (accesibilidad no)
   (ambiente SOCIAL))

(ApartLisboa1 of Apartamento
   (calidadAlojamiento 4)
   (precioAlojamiento 110)
   (capacidad 4)
   (accesibilidad si)
   (ambiente TRANQUILO))

(HotelChiadoSky of Hotel
   (calidadAlojamiento 4)
   (precioAlojamiento 150)
   (servicio si)
   (accesibilidad si)
   (ambiente TRANQUILO))

(HostalAlfama of Hostal
   (calidadAlojamiento 2)
   (precioAlojamiento 28)
   (accesibilidad no)
   (ambiente SOCIAL))

(ApartLisboaRiver of Apartamento
   (calidadAlojamiento 3)
   (precioAlojamiento 90)
   (capacidad 3)
   (accesibilidad si)
   (ambiente TRANQUILO))

; -------------------------
; PRAGA
; -------------------------

(HotelFourSeasonsPraga of Hotel
   (calidadAlojamiento 5)
   (precioAlojamiento 260)
   (servicio si)
   (accesibilidad si)
   (ambiente TRANQUILO))

(HostalPragaCentro of Hostal
   (calidadAlojamiento 3)
   (precioAlojamiento 38)
   (accesibilidad no)
   (ambiente SOCIAL))

(ApartPraga1 of Apartamento
   (calidadAlojamiento 4)
   (precioAlojamiento 120)
   (capacidad 4)
   (accesibilidad si)
   (ambiente TRANQUILO))

(HotelOldTownPraga of Hotel
   (calidadAlojamiento 4)
   (precioAlojamiento 150)
   (servicio si)
   (accesibilidad si)
   (ambiente TRANQUILO))

(HostalMalaStrana of Hostal
   (calidadAlojamiento 2)
   (precioAlojamiento 28)
   (accesibilidad no)
   (ambiente SOCIAL))

(ApartPragaCastle of Apartamento
   (calidadAlojamiento 3)
   (precioAlojamiento 95)
   (capacidad 3)
   (accesibilidad si)
   (ambiente TRANQUILO))

; -------------------------
; BERLIN
; -------------------------

(HotelAdlonBerlin of Hotel
   (calidadAlojamiento 5)
   (precioAlojamiento 300)
   (servicio si)
   (accesibilidad si)
   (ambiente TRANQUILO))

(HostalBerlinMitte of Hostal
   (calidadAlojamiento 3)
   (precioAlojamiento 45)
   (accesibilidad no)
   (ambiente SOCIAL))

(ApartBerlin1 of Apartamento
   (calidadAlojamiento 4)
   (precioAlojamiento 130)
   (capacidad 4)
   (accesibilidad si)
   (ambiente TRANQUILO))

(HotelKreuzbergUrban of Hotel
   (calidadAlojamiento 4)
   (precioAlojamiento 160)
   (servicio si)
   (accesibilidad si)
   (ambiente TRANQUILO))

(HostalPrenzlauer of Hostal
   (calidadAlojamiento 2)
   (precioAlojamiento 30)
   (accesibilidad no)
   (ambiente SOCIAL))

(ApartBerlinWall of Apartamento
   (calidadAlojamiento 3)
   (precioAlojamiento 100)
   (capacidad 3)
   (accesibilidad si)
   (ambiente TRANQUILO))

; =========================================================
; ALOJAMIENTOS — AMÉRICA
; =========================================================

; -------------------------
; NUEVA YORK
; -------------------------

(HotelMarriottNY of Hotel
   (calidadAlojamiento 5)
   (precioAlojamiento 350)
   (servicio si)
   (accesibilidad si)
   (ambiente TRANQUILO))

(HostalNYCentral of Hostal
   (calidadAlojamiento 3)
   (precioAlojamiento 55)
   (accesibilidad no)
   (ambiente SOCIAL))

(ApartNY1 of Apartamento
   (calidadAlojamiento 4)
   (precioAlojamiento 200)
   (capacidad 4)
   (accesibilidad si)
   (ambiente TRANQUILO))

 

(HotelBrooklynBridge of Hotel
   (calidadAlojamiento 4)
   (precioAlojamiento 220)
   (servicio si)
   (accesibilidad si)
   (ambiente TRANQUILO))

(HostalHarlem of Hostal
   (calidadAlojamiento 2)
   (precioAlojamiento 40)
   (accesibilidad no)
   (ambiente SOCIAL))

(ApartNYMidtown of Apartamento
   (calidadAlojamiento 3)
   (precioAlojamiento 160)
   (capacidad 3)
   (accesibilidad si)
   (ambiente TRANQUILO))

; -------------------------
; BUENOS AIRES
; -------------------------

(HotelAlvearBA of Hotel
   (calidadAlojamiento 5)
   (precioAlojamiento 250)
   (servicio si)
   (accesibilidad si)
   (ambiente TRANQUILO))

(HostalPalermo of Hostal
   (calidadAlojamiento 3)
   (precioAlojamiento 35)
   (accesibilidad no)
   (ambiente SOCIAL))

(ApartBA1 of Apartamento
   (calidadAlojamiento 4)
   (precioAlojamiento 100)
   (capacidad 4)
   (accesibilidad si)
   (ambiente TRANQUILO))

(HotelSanTelmo of Hotel
   (calidadAlojamiento 4)
   (precioAlojamiento 140)
   (servicio si)
   (accesibilidad si)
   (ambiente TRANQUILO))

(HostalLaBoca of Hostal
   (calidadAlojamiento 2)
   (precioAlojamiento 25)
   (accesibilidad no)
   (ambiente SOCIAL))

(ApartBARecoleta of Apartamento
   (calidadAlojamiento 3)
   (precioAlojamiento 85)
   (capacidad 3)
   (accesibilidad si)
   (ambiente TRANQUILO))

(AvionMAD-Barcelona of Avion (Origen Madrid) (Destino Barcelona) (precioTransporte 60) (duracionViaje corta) (accesibilidad si) (medio avion))
(AvionBarcelona-MAD of Avion (Origen Barcelona) (Destino Madrid) (precioTransporte 60) (duracionViaje corta) (accesibilidad si) (medio avion))

(AvionMAD-Sevilla of Avion (Origen Madrid) (Destino Sevilla) (precioTransporte 55) (duracionViaje corta) (accesibilidad si) (medio avion))
(AvionSevilla-MAD of Avion (Origen Sevilla) (Destino Madrid) (precioTransporte 55) (duracionViaje corta) (accesibilidad si) (medio avion))

(AvionMAD-Valencia of Avion (Origen Madrid) (Destino Valencia) (precioTransporte 50) (duracionViaje corta) (accesibilidad si) (medio avion))
(AvionValencia-MAD of Avion (Origen Valencia) (Destino Madrid) (precioTransporte 50) (duracionViaje corta) (accesibilidad si) (medio avion))

(AvionMAD-SanSebastian of Avion (Origen Madrid) (Destino SanSebastian) (precioTransporte 70) (duracionViaje corta) (accesibilidad si) (medio avion))
(AvionSanSebastian-MAD of Avion (Origen SanSebastian) (Destino Madrid) (precioTransporte 70) (duracionViaje corta) (accesibilidad si) (medio avion))

(AvionMAD-Granada of Avion (Origen Madrid) (Destino Granada) (precioTransporte 65) (duracionViaje corta) (accesibilidad si) (medio avion))
(AvionGranada-MAD of Avion (Origen Granada) (Destino Madrid) (precioTransporte 65) (duracionViaje corta) (accesibilidad si) (medio avion))

(AvionMAD-Alicante of Avion (Origen Madrid) (Destino Alicante) (precioTransporte 55) (duracionViaje corta) (accesibilidad si) (medio avion))
(AvionAlicante-MAD of Avion (Origen Alicante) (Destino Madrid) (precioTransporte 55) (duracionViaje corta) (accesibilidad si) (medio avion))

(AvionMAD-Paris of Avion (Origen Madrid) (Destino Paris) (precioTransporte 120) (duracionViaje corta) (accesibilidad si) (medio avion))
(AvionParis-MAD of Avion (Origen Paris) (Destino Madrid) (precioTransporte 120) (duracionViaje corta) (accesibilidad si) (medio avion))

(AvionMAD-Roma of Avion (Origen Madrid) (Destino Roma) (precioTransporte 140) (duracionViaje corta) (accesibilidad si) (medio avion))
(AvionRoma-MAD of Avion (Origen Roma) (Destino Madrid) (precioTransporte 140) (duracionViaje corta) (accesibilidad si) (medio avion))

(AvionMAD-Amsterdam of Avion (Origen Madrid) (Destino Amsterdam) (precioTransporte 150) (duracionViaje corta) (accesibilidad si) (medio avion))
(AvionAmsterdam-MAD of Avion (Origen Amsterdam) (Destino Madrid) (precioTransporte 150) (duracionViaje corta) (accesibilidad si) (medio avion))

(AvionMAD-Lisboa of Avion (Origen Madrid) (Destino Lisboa) (precioTransporte 80) (duracionViaje corta) (accesibilidad si) (medio avion))
(AvionLisboa-MAD of Avion (Origen Lisboa) (Destino Madrid) (precioTransporte 80) (duracionViaje corta) (accesibilidad si) (medio avion))

(AvionMAD-Praga of Avion (Origen Madrid) (Destino Praga) (precioTransporte 160) (duracionViaje media) (accesibilidad si) (medio avion))
(AvionPraga-MAD of Avion (Origen Praga) (Destino Madrid) (precioTransporte 160) (duracionViaje media) (accesibilidad si) (medio avion))

(AvionMAD-Berlin of Avion (Origen Madrid) (Destino Berlin) (precioTransporte 150) (duracionViaje media) (accesibilidad si) (medio avion))
(AvionBerlin-MAD of Avion (Origen Berlin) (Destino Madrid) (precioTransporte 150) (duracionViaje media) (accesibilidad si) (medio avion))

(AvionMAD-NuevaYork of Avion (Origen Madrid) (Destino NuevaYork) (precioTransporte 550) (duracionViaje larga) (accesibilidad si) (medio avion))
(AvionNuevaYork-MAD of Avion (Origen NuevaYork) (Destino Madrid) (precioTransporte 550) (duracionViaje larga) (accesibilidad si) (medio avion))

(AvionMAD-BuenosAires of Avion (Origen Madrid) (Destino BuenosAires) (precioTransporte 700) (duracionViaje larga) (accesibilidad si) (medio avion))
(AvionBuenosAires-MAD of Avion (Origen BuenosAires) (Destino Madrid) (precioTransporte 700) (duracionViaje larga) (accesibilidad si) (medio avion))

(AvionMAD-Tokyo of Avion (Origen Madrid) (Destino Tokyo) (precioTransporte 780) (duracionViaje muy-larga) (accesibilidad si) (medio avion))
(AvionTokyo-MAD of Avion (Origen Tokyo) (Destino Madrid) (precioTransporte 780) (duracionViaje muy-larga) (accesibilidad si) (medio avion))

(AvionMAD-Bangkok of Avion (Origen Madrid) (Destino Bangkok) (precioTransporte 650) (duracionViaje larga) (accesibilidad si) (medio avion))
(AvionBangkok-MAD of Avion (Origen Bangkok) (Destino Madrid) (precioTransporte 650) (duracionViaje larga) (accesibilidad si) (medio avion))

(AvionMAD-ElCairo of Avion (Origen Madrid) (Destino ElCairo) (precioTransporte 300) (duracionViaje media) (accesibilidad si) (medio avion))
(AvionElCairo-MAD of Avion (Origen ElCairo) (Destino Madrid) (precioTransporte 300) (duracionViaje media) (accesibilidad si) (medio avion))

(AvionMAD-CiudadDelCabo of Avion (Origen Madrid) (Destino CiudadDelCabo) (precioTransporte 900) (duracionViaje muy-larga) (accesibilidad si) (medio avion))
(AvionCiudadDelCabo-MAD of Avion (Origen CiudadDelCabo) (Destino Madrid) (precioTransporte 900) (duracionViaje muy-larga) (accesibilidad si) (medio avion))

(AvionMAD-Sydney of Avion (Origen Madrid) (Destino Sydney) (precioTransporte 1100) (duracionViaje muy-larga) (accesibilidad si) (medio avion))
(AvionSydney-MAD of Avion (Origen Sydney) (Destino Madrid) (precioTransporte 1100) (duracionViaje muy-larga) (accesibilidad si) (medio avion))

(BarcoBCN-Roma of Barco (Origen Barcelona) (Destino Roma) (precioTransporte 80) (duracionViaje larga) (accesibilidad si) (medio barco))
(BarcoRoma-BCN of Barco (Origen Roma) (Destino Barcelona) (precioTransporte 80) (duracionViaje larga) (accesibilidad si) (medio barco))

(BarcoBCN-Lisboa of Barco (Origen Barcelona) (Destino Lisboa) (precioTransporte 70) (duracionViaje larga) (accesibilidad si) (medio barco))
(BarcoLisboa-BCN of Barco (Origen Lisboa) (Destino Barcelona) (precioTransporte 70) (duracionViaje larga) (accesibilidad si) (medio barco))

(BarcoValencia-Roma of Barco (Origen Valencia) (Destino Roma) (precioTransporte 75) (duracionViaje larga) (accesibilidad si) (medio barco))
(BarcoRoma-Valencia of Barco (Origen Roma) (Destino Valencia) (precioTransporte 75) (duracionViaje larga) (accesibilidad si) (medio barco))

(BarcoValencia-Lisboa of Barco (Origen Valencia) (Destino Lisboa) (precioTransporte 65) (duracionViaje larga) (accesibilidad si) (medio barco))
(BarcoLisboa-Valencia of Barco (Origen Lisboa) (Destino Valencia) (precioTransporte 65) (duracionViaje larga) (accesibilidad si) (medio barco))

(TrenBCN-Paris of Tren (Origen Barcelona) (Destino Paris) (precioTransporte 85) (duracionViaje larga) (accesibilidad si) (medio tren))
(TrenParis-BCN of Tren (Origen Paris) (Destino Barcelona) (precioTransporte 85) (duracionViaje larga) (accesibilidad si) (medio tren))

(TrenBCN-Lisboa of Tren (Origen Barcelona) (Destino Lisboa) (precioTransporte 90) (duracionViaje larga) (accesibilidad si) (medio tren))
(TrenLisboa-BCN of Tren (Origen Lisboa) (Destino Barcelona) (precioTransporte 90) (duracionViaje larga) (accesibilidad si) (medio tren))

(TrenBCN-Roma of Tren (Origen Barcelona) (Destino Roma) (precioTransporte 110) (duracionViaje muy-larga) (accesibilidad si) (medio tren))
(TrenRoma-BCN of Tren (Origen Roma) (Destino Barcelona) (precioTransporte 110) (duracionViaje muy-larga) (accesibilidad si) (medio tren))

(TrenMadrid-Paris of Tren (Origen Madrid) (Destino Paris) (precioTransporte 95) (duracionViaje larga) (accesibilidad si) (medio tren))
(TrenParis-Madrid of Tren (Origen Paris) (Destino Madrid) (precioTransporte 95) (duracionViaje larga) (accesibilidad si) (medio tren))

(TrenMadrid-Lisboa of Tren (Origen Madrid) (Destino Lisboa) (precioTransporte 60) (duracionViaje larga) (accesibilidad si) (medio tren))
(TrenLisboa-Madrid of Tren (Origen Lisboa) (Destino Madrid) (precioTransporte 60) (duracionViaje larga) (accesibilidad si) (medio tren))

(TrenParis-Berlin of Tren (Origen Paris) (Destino Berlin) (precioTransporte 100) (duracionViaje larga) (accesibilidad si) (medio tren))
(TrenBerlin-Paris of Tren (Origen Berlin) (Destino Paris) (precioTransporte 100) (duracionViaje larga) (accesibilidad si) (medio tren))

(TrenParis-Amsterdam of Tren (Origen Paris) (Destino Amsterdam) (precioTransporte 70) (duracionViaje media) (accesibilidad si) (medio tren))
(TrenAmsterdam-Paris of Tren (Origen Amsterdam) (Destino Paris) (precioTransporte 70) (duracionViaje media) (accesibilidad si) (medio tren))

(TrenAmsterdam-Berlin of Tren (Origen Amsterdam) (Destino Berlin) (precioTransporte 65) (duracionViaje media) (accesibilidad si) (medio tren))
(TrenBerlin-Amsterdam of Tren (Origen Berlin) (Destino Amsterdam) (precioTransporte 65) (duracionViaje media) (accesibilidad si) (medio tren))

(TrenBerlin-Praga of Tren (Origen Berlin) (Destino Praga) (precioTransporte 55) (duracionViaje media) (accesibilidad si) (medio tren))
(TrenPraga-Berlin of Tren (Origen Praga) (Destino Berlin) (precioTransporte 55) (duracionViaje media) (accesibilidad si) (medio tren))

(TrenParis-Roma of Tren (Origen Paris) (Destino Roma) (precioTransporte 120) (duracionViaje muy-larga) (accesibilidad si) (medio tren))
(TrenRoma-Paris of Tren (Origen Roma) (Destino Paris) (precioTransporte 120) (duracionViaje muy-larga) (accesibilidad si) (medio tren))

(TrenLisboa-Paris of Tren (Origen Lisboa) (Destino Paris) (precioTransporte 110) (duracionViaje muy-larga) (accesibilidad si) (medio tren))
(TrenParis-Lisboa of Tren (Origen Paris) (Destino Lisboa) (precioTransporte 110) (duracionViaje muy-larga) (accesibilidad si) (medio tren))

(AutobusMAD-Alicante of Autobus (Origen Madrid) (Destino Alicante) (precioTransporte 20) (duracionViaje media) (accesibilidad si) (medio autobus))
(AutobusAlicante-MAD of Autobus (Origen Alicante) (Destino Madrid) (precioTransporte 20) (duracionViaje media) (accesibilidad si) (medio autobus))

(AutobusMAD-Granada of Autobus (Origen Madrid) (Destino Granada) (precioTransporte 22) (duracionViaje media) (accesibilidad si) (medio autobus))
(AutobusGranada-MAD of Autobus (Origen Granada) (Destino Madrid) (precioTransporte 22) (duracionViaje media) (accesibilidad si) (medio autobus))

(AutobusValencia-Alicante of Autobus (Origen Valencia) (Destino Alicante) (precioTransporte 12) (duracionViaje corta) (accesibilidad si) (medio autobus))
(AutobusAlicante-Valencia of Autobus (Origen Alicante) (Destino Valencia) (precioTransporte 12) (duracionViaje corta) (accesibilidad si) (medio autobus))

(TrenBCN-SanSebastian of Tren (Origen Barcelona) (Destino SanSebastian) (precioTransporte 50) (duracionViaje media) (accesibilidad si) (medio tren))
(TrenSanSebastian-BCN of Tren (Origen SanSebastian) (Destino Barcelona) (precioTransporte 50) (duracionViaje media) (accesibilidad si) (medio tren))

(TrenValencia-Sevilla of Tren (Origen Valencia) (Destino Sevilla) (precioTransporte 48) (duracionViaje media) (accesibilidad si) (medio tren))
(TrenSevilla-Valencia of Tren (Origen Sevilla) (Destino Valencia) (precioTransporte 48) (duracionViaje media) (accesibilidad si) (medio tren))

(TrenAlicante-Granada of Tren (Origen Alicante) (Destino Granada) (precioTransporte 40) (duracionViaje media) (accesibilidad si) (medio tren))
(TrenGranada-Alicante of Tren (Origen Granada) (Destino Alicante) (precioTransporte 40) (duracionViaje media) (accesibilidad si) (medio tren))

(TrenMadrid-SanSebastian of Tren (Origen Madrid) (Destino SanSebastian) (precioTransporte 45) (duracionViaje media) (accesibilidad si) (medio tren))
(TrenSanSebastian-Madrid of Tren (Origen SanSebastian) (Destino Madrid) (precioTransporte 45) (duracionViaje media) (accesibilidad si) (medio tren)))


; ------------------------------------
;           MÓDULOS
; ------------------------------------
(defmodule MAIN 
  (export ?ALL))

(defmodule RECOPILACION-USUARIO
  (import MAIN ?ALL)
  (export ?ALL))

(defmodule INICIALIZACION
  (import MAIN ?ALL)
  (export ?ALL))

(defmodule ABSTRACCION-USUARIO
  (import MAIN ?ALL)
  (export ?ALL))

(defmodule HEURISTICA-USUARIO
  (import MAIN ?ALL)
  (export ?ALL))

(defmodule SINTESIS
  (import MAIN ?ALL)
  (export ?ALL))

(defmodule IMPRIMIR-RESULTADOS
  (import MAIN ?ALL)
  (export ?ALL))

; ------------------------------------
;           TEMPLATES
; ------------------------------------

  (deftemplate MAIN::datos-usuario
  (slot edad (type INTEGER) (default -1))
  (slot añosEstudio (type INTEGER) (default -1))
  (slot viajesRealizados (type INTEGER) (default -1))
  (slot paisesVisitados (type INTEGER) (default -1))
  (slot profesion (type SYMBOL) (allowed-symbols artes ciencias humanidades tecnico salud ninguno) (default ninguno))
  (multislot idiomas (type INSTANCE)) 
  (multislot ciudad (type INSTANCE))
  (slot motivo (type INSTANCE)) 
  (slot tipoGrupo (type SYMBOL)(allowed-symbols persona_individual pareja familia grupo_amigos) (default persona_individual))
  (slot numAdultos (type INTEGER) (default 1))
  (slot numNinos (type INTEGER) (default 0))
  (multislot edadesNinos (type INTEGER))
  (slot requiereAccesibilidad (type SYMBOL) (allowed-symbols si no) (default no))
  (multislot equipamiento (type INSTANCE)) 
)

(deftemplate MAIN::restricciones-viaje
  (slot presupuestoMaximo (type INTEGER) (default -1))
  (slot minDiasViaje (type INTEGER) (default -1))
  (slot maxDiasViaje (type INTEGER) (default -1))
  (slot calMinAlojamiento (type INTEGER) (default -1)) 
  (slot minNumCiudad (type INTEGER) (default -1))
  (slot maxNumCiudad (type INTEGER) (default -1))
  (multislot ciudadesObligatorias (type SYMBOL))
  (multislot lugarInteres (type INSTANCE))
  (multislot transportesDescartados (type INSTANCE)) 
)

(deftemplate MAIN::preferencias-viaje
  (slot nivelRitmo (type SYMBOL) (allowed-symbols relajado ajetreado indiferente) (default indiferente)) 
  (multislot tematicasPreferidas (type SYMBOL))
  (multislot transportesPreferidos (type SYMBOL))
  (slot preferenciaClima (type SYMBOL) (allowed-symbols indiferente calido frio templado) (default indiferente))
  (slot preferenciaPopularidad (type SYMBOL) (allowed-symbols indiferente turistica poco-conocida) (default indiferente))
  (slot criterioPrioridad (type SYMBOL) (allowed-symbols poco equilibrado mucho) (default equilibrado))
)

(deftemplate MAIN::ciudad-candidata
  (slot nombre (type SYMBOL))
  (slot puntuacion (type INTEGER) (default 0))
  (slot valida (type SYMBOL) (allowed-symbols si no) (default si))
)

(deftemplate MAIN::viaje-seleccionado
  (slot id (type INTEGER))
  (multislot ciudades (type SYMBOL))
  (multislot dias (type INTEGER))
  (multislot alojamientos (type SYMBOL)) 
  (multislot transportes (type SYMBOL))  
  (multislot num-trans-por-parada (type INTEGER))
  (multislot actividades-asignadas (type SYMBOL))
)

(deftemplate MAIN::sintesis-viaje
  (slot id (type INTEGER))
  (multislot ciudades)                   
  (multislot dias)                      
  (multislot alojamientos)               
  (multislot transportes)                
  (multislot num-trans-por-parada)       
  (multislot actividades-asignadas)     
  (slot dias-totales (type INTEGER) (default 0))
  (slot presupuesto-restante (type NUMBER) (default 0.0)) 
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
        (format t "  %d. %s%n" ?i (str-cat (instance-name (nth$ ?i ?instancias)))))
    (printout t "  0. Terminar seleccion" crlf)
    (bind ?lista (create$))
    (bind ?r (pregunta-numerica "Seleccione:" 0 (length$ ?instancias)))
    (while (neq ?r 0) do
        (bind ?seleccionada (nth$ ?r ?instancias))
        (if (not (member$ ?seleccionada ?lista))
            then 
                (bind ?lista (insert$ ?lista (+ (length$ ?lista) 1) ?seleccionada))
                (format t "  Anadido: %s%n" (str-cat (instance-name ?seleccionada)))
            else
                (printout t "  Ya seleccionado, elige otro." crlf))
        (bind ?r (pregunta-numerica "Seleccione (0 para terminar):" 0 (length$ ?instancias))))
    ?lista)

(deffunction MAIN::elegir-simbolo (?pregunta ?lista-simbolos)
  (printout t ?pregunta crlf)
  (loop-for-count (?i 1 (length$ ?lista-simbolos)) do
    (format t "  %d. %s%n" ?i (nth$ ?i ?lista-simbolos)))
  (bind ?res (pregunta-numerica "Seleccione numero" 1 (length$ ?lista-simbolos)))
  (nth$ ?res ?lista-simbolos))

; ------------------------------------
;           REGLA INICIAL
; ------------------------------------
(defrule MAIN::regla-inicial
    (declare (salience 10))
    =>
    (printout t "============================================" crlf)
    (printout t "    Sistema de Recomendacion de Viajes IA    " crlf)
    (printout t "============================================" crlf)
    (focus RECOPILACION-USUARIO))

(deffacts RECOPILACION-USUARIO::hechos-iniciales
  (Ciudad ask)
  (Idioma ask)
  (Usuario ask)
  (Profesion ask)
  (Temporada ask)
  (Punto_de_Interes ask)
  (transporte ask)
  (Tematica ask)
  (Edad ask)
  (AnosEstudio ask)
  (ViajesRealizados ask)
  (Presupuesto ask)
  (Duracion ask)
  (Ritmo ask)
  (Accesibilidad ask)
  (Calidad-Alojamiento ask)
  (Num-Ciudades ask)
  (Familia ask)
  (Grupo_de_amigos ask)
  (Objetivo ask)
  (Eventos_especiales ask)
  (Material ask)
  (Popularidad ask)
  (Criterio ask))

(defrule RECOPILACION-USUARIO::inicializar-usuario
  (not (datos-usuario))
  (not (recoleccion-finalizada))
  =>
  (assert (datos-usuario))
  (assert (restricciones-viaje))
  (assert (preferencias-viaje)))

(defrule RECOPILACION-USUARIO::obtener-edad-usuario
  (declare (salience 9))
  ?f <- (datos-usuario (edad ?e))
  ?h <- (Edad ask)
  (not (recoleccion-finalizada))
  =>
  (modify ?f (edad (pregunta-numerica "¿Cual es tu edad? " 18 110)))
  (retract ?h))

(defrule RECOPILACION-USUARIO::obtener-ciudad-usuario
  (declare (salience 9))
  ?f <- (datos-usuario)
  ?h <- (Ciudad ask)
  (not (recoleccion-finalizada))
  =>
  (modify ?f (ciudad (elegir-instancia Ciudad "¿Donde vives? (elige tu ciudad de origen)")))
  (retract ?h))

(defrule RECOPILACION-USUARIO::obtener-idioma-usuario
  (declare (salience 9))
  ?f <- (datos-usuario)
  ?h <- (Idioma ask)
  (not (recoleccion-finalizada))
  =>
  (modify ?f (idiomas (elegir-multinstancia Idioma "¿Que idiomas hablas?")))
  (retract ?h))

(defrule RECOPILACION-USUARIO::obtener-experiencia-viajera
  (declare (salience 9))
  ?f <- (datos-usuario (viajesRealizados ?vr) (paisesVisitados ?pv))
  ?h <- (ViajesRealizados ask)
  (not (recoleccion-finalizada))
  =>
  (modify ?f (viajesRealizados (pregunta-numerica "¿Cuantos viajes has hecho? " 0 100))
             (paisesVisitados (pregunta-numerica "¿Cuantos paises has visitado? " 0 100)))
  (retract ?h))

(defrule RECOPILACION-USUARIO::obtener-estudios-usuario
  (declare (salience 9))
  ?f <- (datos-usuario (añosEstudio ?c))
  ?h <- (AnosEstudio ask)
  (not (recoleccion-finalizada))
  =>
  (modify ?f (añosEstudio (pregunta-numerica "¿Cuantos anos has estudiado? " 0 40)))
  (retract ?h))

(defrule RECOPILACION-USUARIO::obtener-profesion-usuario
  (declare (salience 9))
  ?u <- (datos-usuario)
  ?h <- (Profesion ask)
  (not (recoleccion-finalizada))
  =>
  (retract ?h)
  (if (eq (pregunta-booleana "¿Trabajas?") si)
      then
        (bind ?sector (elegir-simbolo "Indique su sector:" (create$ artes ciencias humanidades tecnico salud ninguno)))
        (modify ?u (profesion ?sector))
      else
        (modify ?u (profesion ninguno))))

(defrule RECOPILACION-USUARIO::obtener-accesibilidad-usuario
  (declare (salience 9))
  ?f <- (datos-usuario)
  ?h <- (Accesibilidad ask)
  (not (recoleccion-finalizada))
  =>
  (bind ?acc (pregunta-booleana "¿Alguien en el grupo tiene alguna patologia o discapacidad (requiere accesibilidad)?"))
  (modify ?f (requiereAccesibilidad ?acc))
  (retract ?h))

(defrule RECOPILACION-USUARIO::obtener-equipamiento
   (declare (salience 9))
   ?f <- (datos-usuario)
   ?h <- (Material ask)
   (not (recoleccion-finalizada))
   =>
   (bind ?lista (create$))
   (if (eq (pregunta-booleana "¿Necesitas/tienes equipamiento para deportes de invierno?") si)
       then (bind ?lista (create$ ?lista material-invierno)))
   (if (eq (pregunta-booleana "¿Necesitas/tienes equipamiento de playa?") si)
       then (bind ?lista (create$ ?lista material-playa)))
   (if (eq (pregunta-booleana "¿Necesitas/tienes material de montaña?") si)
       then (bind ?lista (create$ ?lista material-montana)))
   (if (eq (pregunta-booleana "¿Necesitas/tienes equipamiento urbano?") si)
       then (bind ?lista (create$ ?lista material-urbano)))
   (if (eq (pregunta-booleana "¿Necesitas/tienes equipamiento de camping?") si)
       then (bind ?lista (create$ ?lista material-camping)))
   (modify ?f (equipamiento ?lista))
   (retract ?h))

(defrule RECOPILACION-USUARIO::obtener-tipo-usuario
   (declare (salience 8))
   ?f <- (datos-usuario)
   ?h <- (Usuario ask)
   (not (recoleccion-finalizada))
   =>
   (bind ?tipo (elegir-simbolo "¿Como viaja usted?"
                   (create$ persona_individual pareja familia grupo_amigos)))
   (modify ?f (tipoGrupo ?tipo))
   (retract ?h))

(defrule RECOPILACION-USUARIO::obtener-datos-familia
  (declare (salience 7))
  ?f <- (datos-usuario (tipoGrupo ?tg))
  (test (eq ?tg familia))
  ?h <- (Familia ask)
  (not (recoleccion-finalizada))
  =>
  (bind ?na (pregunta-numerica "¿Cuantos adultos viajan? " 1 10))
  (bind ?nn (pregunta-numerica "¿Cuantos ninos viajan? " 0 10))
  (bind ?lista (create$))
  (loop-for-count (?i 1 ?nn) do
      (printout t "Edad del niño " ?i ": ")
      (bind ?edad (pregunta-numerica "" 0 17))
      (bind ?lista (insert$ ?lista ?i ?edad)))
  (modify ?f (numAdultos ?na) (numNinos ?nn) (edadesNinos ?lista))
  (retract ?h))

(defrule RECOPILACION-USUARIO::obtener-datos-amigos
  (declare (salience 7))
  ?f <- (datos-usuario (tipoGrupo ?tg))
  (test (eq ?tg grupo_amigos))
  ?h <- (Grupo_de_amigos ask)
  (not (recoleccion-finalizada))
  =>
  (bind ?np (pregunta-numerica "¿Cuantas personas sois en el grupo de amigos? " 2 20))
  (modify ?f (numAdultos ?np))
  (retract ?h))

(defrule RECOPILACION-USUARIO::obtener-motivo
  (declare (salience 5))
  ?f <- (datos-usuario)
  ?h1 <- (Objetivo ask)
  ?h2 <- (Eventos_especiales ask)
  (not (recoleccion-finalizada))
  =>
  (if (eq (pregunta-booleana "¿El viaje es por algun evento especial?") si)
      then
        (modify ?f (motivo (elegir-instancia Eventos_especiales "¿Cual es el evento?")))
      else
        (if (eq (pregunta-booleana "¿El viaje tiene algun objetivo especifico?") si)
            then
              (modify ?f (motivo (elegir-instancia Objetivo "¿Cual es el objetivo?")))))
  (retract ?h1 ?h2))

(defrule RECOPILACION-USUARIO::obtener-presupuesto
  (declare (salience 5))
  ?f <- (restricciones-viaje)
  ?h <- (Presupuesto ask)
  (not (recoleccion-finalizada))
  =>
  (modify ?f (presupuestoMaximo (pregunta-numerica "¿Cual es tu presupuesto total maximo (euros)?" 1 50000)))
  (retract ?h))

(defrule RECOPILACION-USUARIO::obtener-duracion
  (declare (salience 5))
  ?f <- (restricciones-viaje)
  ?h <- (Duracion ask)
  (not (recoleccion-finalizada))
  =>
  (printout t "¿Cuanto quieres que dure el viaje en total?" crlf)
  (bind ?dmin (pregunta-numerica "   Dias totales minimos" 1 60))
  (bind ?dmax (pregunta-numerica "   Dias totales maximos" ?dmin 60))
  (modify ?f (minDiasViaje ?dmin) (maxDiasViaje ?dmax))
  (retract ?h))

(defrule RECOPILACION-USUARIO::obtener-num-ciudades
  (declare (salience 5))
  ?f <- (restricciones-viaje)
  ?h <- (Num-Ciudades ask)
  (not (recoleccion-finalizada))
  =>
  (printout t "¿Cuantas ciudades quieres visitar?" crlf)
  (bind ?ncmin (pregunta-numerica "   Numero minimo de ciudades" 1 10))
  (bind ?ncmax (pregunta-numerica "   Numero maximo de ciudades" ?ncmin 10))
  (modify ?f (minNumCiudad ?ncmin) (maxNumCiudad ?ncmax))
  (retract ?h))

(defrule RECOPILACION-USUARIO::obtener-transporte
  (declare (salience 5))
  ?f <- (restricciones-viaje)
  ?h <- (transporte ask)
  (not (recoleccion-finalizada))
  =>
  (if (eq (pregunta-booleana "¿Quiere excluir/descartar algun tipo de transporte?") si)
      then
        (modify ?f (transportesDescartados (elegir-multinstancia Transporte "Seleccione los transportes a EXCLUIR:"))))
  (retract ?h))

(defrule RECOPILACION-USUARIO::obtener-calidad-alojamiento
  (declare (salience 5))
  ?f <- (restricciones-viaje)
  ?h <- (Calidad-Alojamiento ask)
  (not (recoleccion-finalizada))
  =>
  (bind ?calidad (pregunta-numerica "¿Cual es la calidad minima de alojamiento deseada?" 0 5))
  (modify ?f (calMinAlojamiento ?calidad))
  (retract ?h))

(defrule RECOPILACION-USUARIO::obtener-ciudades-obligatorias
  (declare (salience 5))
  ?f <- (restricciones-viaje (ciudadesObligatorias))
  (not (recoleccion-finalizada))
  =>
  (if (eq (pregunta-booleana "¿Tienes ciudades fijas/obligatorias que quieras incluir?") si)
      then
        (modify ?f (ciudadesObligatorias (elegir-multinstancia Ciudad "Selecciona las ciudades obligatorias:")))))

(defrule RECOPILACION-USUARIO::obtener-punto-interes
  (declare (salience 5))
  ?f <- (restricciones-viaje)
  ?h <- (Punto_de_Interes ask)
  (not (recoleccion-finalizada))
  =>
  (if (eq (pregunta-booleana "¿Tiene interes en visitar puntos de interes especificos?") si)
      then
        (modify ?f (lugarInteres (elegir-multinstancia LugarInteres "Seleccione los puntos de interes deseados:"))))
  (retract ?h))

(defrule RECOPILACION-USUARIO::obtener-tematica
  (declare (salience 5))
  ?f <- (preferencias-viaje)
  ?h <- (Tematica ask)
  (not (recoleccion-finalizada))
  =>
  (modify ?f (tematicasPreferidas (elegir-multinstancia Tematica "¿Que tipo o tematica de ciudades quieres visitar?")))
  (retract ?h))

(defrule RECOPILACION-USUARIO::obtener-temporada
  (declare (salience 5))
  ?f <- (preferencias-viaje)
  ?h <- (Temporada ask)
  (not (recoleccion-finalizada))
  =>
  (modify ?f (preferenciaClima (elegir-simbolo "¿En que clima prefieres viajar?" (create$ indiferente calido frio templado))))
  (retract ?h))

(defrule RECOPILACION-USUARIO::obtener-ritmo-viaje
  (declare (salience 5))
  ?f <- (preferencias-viaje)
  ?h <- (Ritmo ask)
  (not (recoleccion-finalizada))
  =>
  (bind ?ritmo (elegir-simbolo "¿Prefieres tener un viaje relajado o ajetreado?" (create$ relajado ajetreado indiferente)))
  (modify ?f (nivelRitmo ?ritmo))
  (retract ?h))

(defrule RECOPILACION-USUARIO::obtener-popularidad
  (declare (salience 5))
  ?f <- (preferencias-viaje (preferenciaPopularidad indiferente))
  ?h <- (Popularidad ask)
  (not (recoleccion-finalizada))
  =>
  (modify ?f (preferenciaPopularidad 
                (elegir-simbolo 
                   "¿Prefieres destinos turisticos o poco conocidos?"
                   (create$ indiferente turistica poco_conocida))))
  (retract ?h))

(defrule RECOPILACION-USUARIO::obtener-criterio-prioridad
  (declare (salience 5))
  ?f <- (preferencias-viaje (criterioPrioridad equilibrado))
  ?h <- (Criterio ask)
  (not (recoleccion-finalizada))
  =>
  (modify ?f (criterioPrioridad
                (elegir-simbolo
                   "¿Durante la estancia en una ciudad, cuanto pretendes gastar?"
                   (create$ poco equilibrado mucho))))
  (retract ?h))

(defrule RECOPILACION-USUARIO::fin-recoleccion-datos
  (declare (salience -100))
  (not (recoleccion-finalizada))
  =>
  (assert (recoleccion-finalizada))
  (printout t crlf "--------------------------------------------" crlf)
  (printout t "        RECOLECCION DE DATOS HECHA          " crlf)
  (printout t "--------------------------------------------" crlf)
  (focus INICIALIZACION))

; ------------------------------------
;         MODULO INICIALIZACION
; ------------------------------------

(defrule INICIALIZACION::crear-instancia-individual
   ?f <- (datos-usuario (tipoGrupo ?tg))
   (test (eq ?tg persona_individual))
   (restricciones-viaje (presupuestoMaximo ?p))
   (not (instancia-creada))
   =>
   (make-instance [cliente] of Persona_Individual
      (edad (fact-slot-value ?f edad))
      (presupuestoMaximo ?p)
      (añosEstudio (fact-slot-value ?f añosEstudio))
      (viajesRealizados (fact-slot-value ?f viajesRealizados))
      (paisesVisitados (fact-slot-value ?f paisesVisitados))
      (profesion (fact-slot-value ?f profesion))
      (Habla_en (fact-slot-value ?f idiomas))
      (Vive_en (nth$ 1 (fact-slot-value ?f ciudad))))
   (assert (instancia-creada)))

(defrule INICIALIZACION::crear-instancia-pareja
   ?f <- (datos-usuario (tipoGrupo ?tg))
   (test (eq ?tg pareja))
   (restricciones-viaje (presupuestoMaximo ?p))
   (not (instancia-creada))
   =>
   (make-instance [cliente] of Pareja
      (edad (fact-slot-value ?f edad))
      (presupuestoMaximo ?p)
      (añosEstudio (fact-slot-value ?f añosEstudio))
      (viajesRealizados (fact-slot-value ?f viajesRealizados))
      (paisesVisitados (fact-slot-value ?f paisesVisitados))
      (profesion (fact-slot-value ?f profesion))
      (Habla_en (fact-slot-value ?f idiomas))
      (Vive_en (nth$ 1 (fact-slot-value ?f ciudad))))
   (assert (instancia-creada)))

(defrule INICIALIZACION::crear-instancia-familia
   ?f <- (datos-usuario (tipoGrupo ?tg))
   (test (eq ?tg familia))
   (restricciones-viaje (presupuestoMaximo ?p))
   (not (instancia-creada))
   =>
   (make-instance [cliente] of Familia
      (edad (fact-slot-value ?f edad))
      (presupuestoMaximo ?p)
      (añosEstudio (fact-slot-value ?f añosEstudio))
      (viajesRealizados (fact-slot-value ?f viajesRealizados))
      (paisesVisitados (fact-slot-value ?f paisesVisitados))
      (profesion (fact-slot-value ?f profesion))
      (Habla_en (fact-slot-value ?f idiomas))
      (Vive_en (nth$ 1 (fact-slot-value ?f ciudad)))
      (nAdultos (fact-slot-value ?f numAdultos))
      (nNiños (fact-slot-value ?f numNinos))
      (edadNiños (fact-slot-value ?f edadesNinos)))
   (assert (instancia-creada)))

(defrule INICIALIZACION::crear-instancia-amigos
   ?f <- (datos-usuario (tipoGrupo ?tg))
   (test (eq ?tg grupo_amigos))
   (restricciones-viaje (presupuestoMaximo ?p))
   (not (instancia-creada))
   =>
   (make-instance [cliente] of Grupo_de_amigos
      (edad (fact-slot-value ?f edad))
      (presupuestoMaximo ?p)
      (añosEstudio (fact-slot-value ?f añosEstudio))
      (viajesRealizados (fact-slot-value ?f viajesRealizados))
      (paisesVisitados (fact-slot-value ?f paisesVisitados))
      (profesion (fact-slot-value ?f profesion))
      (Habla_en (fact-slot-value ?f idiomas))
      (Vive_en (nth$ 1 (fact-slot-value ?f ciudad)))
      (nPersonas (fact-slot-value ?f numAdultos)))
   (assert (instancia-creada)))

(defrule INICIALIZACION::fin-inicializacion
  (declare (salience -100))
  (instancia-creada)
  (not (fin-inicializacion-ok))
  =>
  (assert (fin-inicializacion-ok))
  (printout t crlf)
  (printout t "--------------------------------------------" crlf)
  (printout t "            INSTANCIAS CREADAS              " crlf)
  (printout t "--------------------------------------------" crlf)
  (focus ABSTRACCION-USUARIO))

; ------------------------------------
;         MODULO ABSTRACCION-USUARIO
; ------------------------------------

(defrule ABSTRACCION-USUARIO::abstraer-datos-usuario
   ?u <- (object (is-a Usuario) 
                 (edad ?v-edad) 
                 (añosEstudio ?v-c) 
                 (viajesRealizados ?v-vr) 
                 (paisesVisitados ?v-pv) 
                 (Habla_en $?ids))
   (not (abstraer-datos-usuario-definido))
   =>
   (bind ?cat-edad
      (if (< ?v-edad 30) then joven
      else (if (< ?v-edad 65) then adulto
      else anciano)))

   (bind ?cat-c
      (if (< ?v-c 6) then bajo
      else (if (< ?v-c 15) then medio
      else alto)))

   (bind ?total-exp (+ ?v-vr ?v-pv))
   (bind ?cat-exp
      (if (< ?total-exp 5) then baja
      else (if (< ?total-exp 15) then media
      else alta)))

   (bind ?cat-id
      (if (or (member$ [ingles] ?ids) (> (length$ ?ids) 1))
          then internacional
          else local))

   (assert (nivel-cultural ?cat-c))
   (assert (experiencia-viajera ?cat-exp))
   (assert (problema-abstracto ?cat-edad ?cat-c ?cat-exp ?cat-id))
   (assert (abstraer-datos-usuario-definido))
   (format t "  [Abstraccion] Perfil: edad=%s / nivel-cultural=%s / experiencia=%s / idiomas=%s%n" ?cat-edad ?cat-c ?cat-exp ?cat-id))

(defrule ABSTRACCION-USUARIO::info-usuario-familia
   ?u <- (object (is-a Familia) 
                 (name [cliente]) 
                 (nAdultos ?numAdultos) 
                 (nNiños ?numNinos) 
                 (edadNiños $?edadesNinos)) 
   (not (info-usuario-definido-familia))
   =>
   (bind ?tipo-familia (if (> ?numAdultos 2) then varias-familias else una-familia))
   (bind ?numerosa (if (> ?numNinos 3) then si else no))
   (bind ?hay-bebe no)
   (progn$ (?edad ?edadesNinos)
      (if (< ?edad 3) then (bind ?hay-bebe si)))

   (assert (problema-familia ?tipo-familia ?numerosa ?hay-bebe))
   (assert (info-usuario-definido-familia))
   (format t "  [Abstraccion] Familia: %s / numerosa=%s / bebe=%s%n" ?tipo-familia ?numerosa ?hay-bebe)
   (if (eq ?hay-bebe si) then (assert (requiere-accesibilidad))))

(defrule ABSTRACCION-USUARIO::info-usuario-amigos
   (object (is-a Grupo_de_amigos) (name [cliente]) (nPersonas ?numPersonas))
   (not (info-usuario-definido-amigos))
   =>
   (bind ?categoria (if (> ?numPersonas 5) then numeroso else no-numeroso))
   (assert (problema-amigos ?categoria))
   (assert (info-usuario-definido-amigos))
   (format t "  [Abstraccion] Grupo amigos: %s%n" ?categoria)
   (if (> ?numPersonas 8) then (assert (requiere-transporte-grande))))

(defrule ABSTRACCION-USUARIO::abstraer-presupuesto
   (restricciones-viaje (presupuestoMaximo ?p) (maxDiasViaje ?d))
   (test (and (numberp ?p) (numberp ?d) (> ?p 0) (> ?d 0)))
   (not (perfil-economico ?))
   =>
   (bind ?ppd (/ ?p ?d))
   (bind ?nivel
      (if (< ?ppd 60) then bajo
      else (if (< ?ppd 150) then medio
      else alto)))
   (assert (perfil-economico ?nivel))
   (format t "  [Abstraccion] Presupuesto/dia: %d euros -> %s%n" (round ?ppd) ?nivel))

(defrule ABSTRACCION-USUARIO::abstraer-duracion
   (restricciones-viaje (maxDiasViaje ?d))
   (test (and (numberp ?d) (> ?d 0)))
   (not (perfil-duracion ?))
   =>
   (bind ?dur
      (if (<= ?d 3) then corta
      else (if (<= ?d 7) then media
      else larga)))
   (assert (perfil-duracion ?dur))
   (format t "  [Abstraccion] Duracion: %d dias -> %s%n" ?d ?dur))

(defrule ABSTRACCION-USUARIO::abstraer-accesibilidad
   (datos-usuario (requiereAccesibilidad ?acc))
   (not (accesibilidad-abstracta-hecho))
   =>
   (if (eq ?acc si)
      then (assert (restriccion-movilidad-critica si))
      else (assert (restriccion-movilidad-critica no)))
   (assert (accesibilidad-abstracta-hecho)))

(defrule ABSTRACCION-USUARIO::abstraer-ritmo
   (preferencias-viaje (nivelRitmo ?r))
   (not (ritmo-categoria ?))
   =>
   (bind ?cat (if (eq ?r indiferente) then normal else ?r))
   (assert (ritmo-categoria ?cat))
   (format t "  [Abstraccion] Ritmo: %s%n" ?cat))

(defrule ABSTRACCION-USUARIO::abstraer-calidad-alojamiento
   (restricciones-viaje (calMinAlojamiento ?a))
   (test (numberp ?a))
   (not (calidad-alojamiento ?))
   =>
   (bind ?cat
      (if (>= ?a 8) then lujo
      else (if (>= ?a 5) then estandar
      else economico)))
   (assert (calidad-alojamiento ?cat))
   (format t "  [Abstraccion] Calidad alojamiento minima: %s%n" ?cat))

(defrule ABSTRACCION-USUARIO::abstraer-num-ciudades
   (restricciones-viaje (minNumCiudad ?c) (maxDiasViaje ?d))
   (test (and (> ?c 0) (> ?d 0)))
   (not (duracion-ciudad-abstracta ?))
   =>
   (bind ?ratio (/ ?d ?c)) ; Dias por ciudad promedio
   (bind ?cat
      (if (< ?ratio 2.0) then expres ; menos de dos dias por ciudad es una paliza
      else (if (<= ?ratio 4.0) then normal
      else calmado)))
   (assert (duracion-ciudad-abstracta ?cat))
   (format t "  [Abstraccion] Ritmo de estancia en ciudades: %s%n" ?cat))

(defrule ABSTRACCION-USUARIO::deducir-objetivo-evento
   (datos-usuario (motivo ?m))
   (test (and (neq ?m ninguno) (neq ?m nil)))
   (object (is-a Eventos_especiales) (name ?m))
   (not (clase-objetivo ?))
   =>
   (if (or (eq ?m [boda]) (eq ?m [luna-miel]) (eq ?m [aniversario]))
      then (assert (clase-objetivo romantico))
      else (if (or (eq ?m [fin-curso]) (eq ?m [cumpleanos]))
         then (assert (clase-objetivo diversion))
         else (assert (clase-objetivo descanso))))
   (format t "  [Abstraccion] Objetivo deducido de evento: %s%n" ?m))

(defrule ABSTRACCION-USUARIO::abstraer-objetivo-directo
   (datos-usuario (motivo ?m))
   (test (and (neq ?m ninguno) (neq ?m nil)))
   (object (is-a Objetivo) (name ?m))
   (not (clase-objetivo ?))
   =>
   (assert (clase-objetivo ?m))
   (format t "  [Abstraccion] Objetivo directo: %s%n" ?m))

(defrule ABSTRACCION-USUARIO::objetivo-sin-motivo
   (datos-usuario (motivo ?m))
   (test (or (eq ?m ninguno) (eq ?m nil)))
   (not (clase-objetivo ?))
   =>
   (assert (clase-objetivo descanso))
   (format t "  [Abstraccion] Sin motivo explicito -> descanso por defecto%n"))

(defrule ABSTRACCION-USUARIO::abstraer-tematicas
   (preferencias-viaje (tematicasPreferidas $?temas))
   (not (tematicas-abstraidas))
   =>
   (if (> (length$ ?temas) 0)
      then
          (progn$ (?t ?temas)
              (assert (clase-tematica ?t))
              (format t "  [Abstraccion] Tematica activa: %s%n" ?t))
      else
          (assert (clase-tematica cultura))
          (format t "  [Abstraccion] Sin tematica -> cultura por defecto%n"))
   (assert (tematicas-abstraidas)))

(defrule ABSTRACCION-USUARIO::abstraer-clima-actividad
   (preferencias-viaje (preferenciaClima ?temp))
   (datos-usuario (equipamiento $?equipo))
   (not (perfil-clima-actividad ?))
   =>
   (bind ?perfil normal)
   (if (and (eq ?temp frio) (member$ material-invierno $?equipo))
      then (bind ?perfil nieve-esqui))
   (if (and (eq ?temp calido) (member$ material-playa $?equipo))
      then (bind ?perfil costa-relax))
   (if (member$ material-montana $?equipo)
      then (bind ?perfil aventura-trekking))
      
   (assert (perfil-clima-actividad ?perfil))
   (format t "  [Abstraccion] Fusión Actividad-Equipamiento: %s%n" ?perfil))

(defrule ABSTRACCION-USUARIO::abstraer-complejidad-logistica
   (or (problema-familia varias-familias si ?) ; Varias familias o con bebés
       (problema-amigos numeroso))              ; O grupo grande de amigos
   (not (logistica-viaje ?))
   =>
   (assert (logistica-viaje compleja))
   (format t "  [Abstraccion] Complejidad logistica del itinerario: COMPLEJA%n"))

(defrule ABSTRACCION-USUARIO::abstraer-complejidad-logistica-por-defecto
   (not (logistica-viaje ?))
   =>
   (assert (logistica-viaje estandar))
   (format t "  [Abstraccion] Complejidad logistica del itinerario: ESTANDAR%n"))


(defrule ABSTRACCION-USUARIO::fin-abstraccion
   (declare (salience -100))
   (perfil-economico ?)
   (perfil-duracion ?)
   (ritmo-categoria ?)
   (clase-objetivo ?)
   (nivel-cultural ?)
   (experiencia-viajera ?)
   (tematicas-abstraidas)
   (perfil-clima-actividad ?)
   (calidad-alojamiento ?)
   (duracion-ciudad-abstracta ?)
   (logistica-viaje ?)
   (not (fin-abstraccion-hecho))
   =>
   (assert (fin-abstraccion-hecho))
   (printout t crlf "--------------------------------------------" crlf)
   (printout t "              ABSTRACCION HECHA             " crlf)
   (printout t "--------------------------------------------" crlf)
   (focus HEURISTICA-USUARIO))


; ===================================================================
;                      HEURISTICA USUARIO
; ===================================================================

(defrule HEURISTICA-USUARIO::inicializar-ciudades
   (declare (salience 100))
   (object (is-a Ciudad) (name ?c))
   (not (ciudad-candidata (nombre ?c-sym&:(eq ?c-sym (instance-name-to-symbol ?c)))))
   =>
   (assert (ciudad-candidata (nombre (instance-name-to-symbol ?c)) (puntuacion 0) (valida si))))

(defrule HEURISTICA-USUARIO::puntos-presupuesto
   ?f <- (ciudad-candidata (nombre ?c) (valida si) (puntuacion ?p))
   (restricciones-viaje (presupuestoMaximo ?presupuesto) (maxDiasViaje ?dias))
   (preferencias-viaje (preferenciaClima ?temp))
   (object (is-a Ciudad) (name ?obj) (precioMedio ?pr))
   (test (eq (instance-name-to-symbol ?obj) ?c))
   (not (penalizado-presupuesto ?c))
   (test (and (> ?presupuesto 0) (> ?dias 0)))
   =>
   (bind ?precio-ajustado ?pr)
   (if (eq ?temp calido) then 
      (bind ?precio-ajustado (round (* ?pr 1.20)))
      (format t "  [Heuristica] %s se evalua con recargo de temporada alta: %d euros/dia.%n" ?c ?precio-ajustado))

   (bind ?limite (/ ?presupuesto ?dias))
   (if (> ?precio-ajustado ?limite) then
      (bind ?exceso (/ (- ?precio-ajustado ?limite) ?limite))  
      (bind ?penalizacion 0)
      (if (< ?exceso 0.25) then (bind ?penalizacion 5))
      (if (and (>= ?exceso 0.25) (< ?exceso 0.75)) then (bind ?penalizacion 15))
      (if (>= ?exceso 0.75) then (bind ?penalizacion 30))
      (modify ?f (puntuacion (- ?p ?penalizacion)))
      (format t "  [Heuristica] -%d a %s por presupuesto ajustado (Precio: %d, Limite: %d).%n" ?penalizacion ?c ?precio-ajustado (round ?limite)))
   (assert (penalizado-presupuesto ?c)))

(defrule HEURISTICA-USUARIO::puntos-transporte
   ?f <- (ciudad-candidata (nombre ?c) (valida si) (puntuacion ?p))
   (restricciones-viaje (presupuestoMaximo ?presupuesto))
   (object (is-a Transporte) (Destino ?dest) (precioTransporte ?pt))
   (test (eq (instance-name-to-symbol ?dest) ?c))
   (not (penalizado-transporte ?c))
   (test (> ?presupuesto 0))
   =>
   (bind ?limite-transporte (* ?presupuesto 0.20))  
   (if (> ?pt ?limite-transporte) then
      (bind ?exceso (/ (- ?pt ?limite-transporte) ?limite-transporte))
      (bind ?penalizacion 0)
      (if (< ?exceso 0.25) then (bind ?penalizacion 5))
      (if (and (>= ?exceso 0.25) (< ?exceso 0.75)) then (bind ?penalizacion 15))
      (if (>= ?exceso 0.75) then (bind ?penalizacion 30))
      (modify ?f (puntuacion (- ?p ?penalizacion))))
   (assert (penalizado-transporte ?c)))

(defrule HEURISTICA-USUARIO::filtro-distancia-continente
   (or  (perfil-duracion corta)
        (datos-usuario (tipoGrupo familia)))
   (datos-usuario (ciudad $?origen))
   ?f <- (ciudad-candidata (nombre ?c) (valida si))
   (object (is-a Ciudad)
           (name ?obj-dest)
           (continente ?cont-destino))
   (test (eq (instance-name-to-symbol ?obj-dest) ?c))
   (object (is-a Ciudad)
           (name ?obj-org)
           (continente ?cont-origen))
   (test (eq (instance-name-to-symbol ?obj-org) (nth$ 1 ?origen)))
   (test (neq ?cont-origen ?cont-destino))
   =>
   (modify ?f (valida no))
   (format t "  [Heuristica] DESCARTE: %s está en otro continente (%s) y el viaje requiere cercanía.%n" ?c ?cont-destino))


(defrule HEURISTICA-USUARIO::filtro-duracion-larga
   (perfil-duracion larga)
   ?f <- (ciudad-candidata (nombre ?c) (valida si))
   (object (is-a Ciudad) (name ?obj) (Contienen $?contienen))
   (test (eq (instance-name-to-symbol ?obj) ?c))
   (test (< (length$ ?contienen) 3))
   =>
   (modify ?f (valida no))
   (format t "  [Heuristica] DESCARTE: %s ofrece pocos puntos de interes para un viaje largo.%n" ?c))

(defrule HEURISTICA-USUARIO::filtro-restriccion-tematica
   ?f <- (ciudad-candidata (nombre ?c) (valida si))
   (preferencias-viaje (tematicasPreferidas $?temas-pref))
   (test (> (length$ ?temas-pref) 0))
   (object (is-a Ciudad) (name ?obj) (Tipo_de_ciudad $?tipos))
   (test (eq (instance-name-to-symbol ?obj) ?c))
   =>
   (bind ?encuentra no)
   (progn$ (?t ?temas-pref)
      (if (member$ ?t ?tipos) then (bind ?encuentra si)))
   (if (eq ?encuentra no) then
      (modify ?f (valida no))
      (format t "  [Heuristica] DESCARTE: %s no pertenece a ninguna tematica solicitada.%n" ?c)))

(defrule HEURISTICA-USUARIO::filtro-material-faltante
   ?f <- (ciudad-candidata (nombre ?c) (valida si))
   (datos-usuario (equipamiento $?mis-materiales))
   (object (is-a Ciudad) (name ?obj) (Requiere_de $?mat-req))
   (test (eq (instance-name-to-symbol ?obj) ?c))
   =>
   (bind ?faltante no)
   (progn$ (?m ?mat-req)
      (if (not (member$ (instance-name-to-symbol ?m) ?mis-materiales)) then (bind ?faltante si)))
   (if (eq ?faltante si) then
      (modify ?f (valida no))
      (format t "  [Heuristica] DESCARTE: %s requiere equipamiento que no posees.%n" ?c)))

(defrule HEURISTICA-USUARIO::filtro-calidad-alojamiento
   ?f <- (ciudad-candidata (nombre ?c) (valida si))
   (restricciones-viaje (calMinAlojamiento ?min-cal))
   (object (is-a Ciudad)
           (name ?obj)
           (Tiene_un_conjunto_de $?aloj-list))
   (test (eq (instance-name-to-symbol ?obj) ?c))
   =>
   (bind ?total 0)
   (bind ?n 0)

   (progn$ (?a ?aloj-list)
      (bind ?p (send ?a get-calidadAlojamiento))
      (bind ?total (+ ?total ?p))
      (bind ?n (+ ?n 1)))

   (if (> ?n 0)
       then (bind ?media (/ ?total ?n))
       else (bind ?media 0))

   (if (< ?media ?min-cal) then
       (modify ?f (valida no))
       (format t "  [Heuristica] DESCARTE: %s no cumple la calidad mínima (%d). Media=%d%n"
               ?c ?min-cal ?media)))

(defrule HEURISTICA-USUARIO::puntuar-tematica
   ?f <- (ciudad-candidata (nombre ?c) (valida si) (puntuacion ?p))
   (preferencias-viaje (tematicasPreferidas $?tematicas-usuario)) 
   (object (is-a Ciudad) (name ?obj) (Tipo_de_ciudad $?tipos-ciudad))
   (test (eq (instance-name-to-symbol ?obj) ?c))
   (not (puntuo-tematica ?c))
   =>
   (bind ?coincide no)
   (progn$ (?t ?tematicas-usuario)
      (if (member$ ?t ?tipos-ciudad) then (bind ?coincide si)))
   (if (eq ?coincide si) then
      (modify ?f (puntuacion (+ ?p 20)))
      (format t "  [Heuristica] +20 a %s por coincidir con la tematica deseada.%n" ?c))
   (assert (puntuo-tematica ?c)))

(defrule HEURISTICA-USUARIO::puntuar-alojamiento-y-perfil-gasto
   ?f <- (ciudad-candidata (nombre ?c) (valida si) (puntuacion ?p))
   (perfil-economico alto)
   (calidad-alojamiento lujo)
   (object (is-a Ciudad) (name ?obj) (Tipo_de_ciudad $?tipos))
   (test (eq (instance-name-to-symbol ?obj) ?c))
   (not (puntuo-alojamiento ?c))
   =>
   (modify ?f (puntuacion (+ ?p 35)))
   (format t "  [Heuristica] +35 a %s por excelente oferta de hoteles de alta gama para presupuesto alto.%n" ?c)
   (assert (puntuo-alojamiento ?c)))


(defrule HEURISTICA-USUARIO::puntuar-objetivo-grupo
   ?f <- (ciudad-candidata (nombre ?c) (valida si) (puntuacion ?p))
   (clase-objetivo ?obj-v)
   (object (is-a Ciudad) (name ?obj-inst) (Tipo_de_ciudad $?tipos))
   (test (eq (instance-name-to-symbol ?obj-inst) ?c))
   (not (puntuo-objetivo ?c))
   =>
   (bind ?bonus 0)
   (if (and (eq ?obj-v diversion) (member$ [fiesta] ?tipos)) then (bind ?bonus 40))
   (if (and (eq ?obj-v romantico) (member$ [romantica] ?tipos)) then (bind ?bonus 40))
   (if (and (eq ?obj-v descanso) (member$ [tranquila] ?tipos)) then (bind ?bonus 30))
   (if (> ?bonus 0) then
      (modify ?f (puntuacion (+ ?p ?bonus)))
      (format t "  [Heuristica] +%d a %s por cumplir el objetivo de viaje (%s).%n" ?bonus ?c ?obj-v))
   (assert (puntuo-objetivo ?c)))

(defrule HEURISTICA-USUARIO::puntuar-tipo-compania
   ?f <- (ciudad-candidata (nombre ?c) (valida si) (puntuacion ?p))
   (datos-usuario (tipoGrupo ?grupo))
   (object (is-a Ciudad) (name ?obj) (Tipo_de_ciudad $?tipos-ciudad))
   (test (eq (instance-name-to-symbol ?obj) ?c))
   (not (puntuo-grupo ?c))
   =>
   (if (member$ ?grupo ?tipos-ciudad) then
      (modify ?f (puntuacion (+ ?p 25)))
      (format t "  [Heuristica] +25 a %s por adecuacion al tipo de grupo viajero.%n" ?c))
   (assert (puntuo-grupo ?c)))

(defrule HEURISTICA-USUARIO::puntuar-nivel-cultural
   ?f <- (ciudad-candidata (nombre ?c) (valida si) (puntuacion ?p))
   (nivel-cultural ?cat-c)
   (object (is-a Ciudad) (name ?obj) (Tipo_de_ciudad $?tipos-ciudad))
   (test (eq (instance-name-to-symbol ?obj) ?c))
   (not (puntuo-cultural ?c))
   =>
   (bind ?bonus 0)
   (if (and (eq ?cat-c alto) (member$ [cultura] ?tipos-ciudad)) then (bind ?bonus 30)
   else (if (and (eq ?cat-c medio) (member$ [cultura] ?tipos-ciudad)) then (bind ?bonus 15)
   else (if (and (eq ?cat-c bajo) (or (member$ [playa] ?tipos-ciudad) (member$ [fiesta] ?tipos-ciudad))) then (bind ?bonus 10))))
   (if (> ?bonus 0) then
      (modify ?f (puntuacion (+ ?p ?bonus)))
      (format t "  [Heuristica] +%d a %s por afinidad con nivel cultural %s.%n" ?bonus ?c ?cat-c))
   (assert (puntuo-cultural ?c)))

(defrule HEURISTICA-USUARIO::puntuar-profesion
   ?f <- (ciudad-candidata (nombre ?c) (valida si) (puntuacion ?p))
   (datos-usuario (profesion ?prof))
   (test (neq ?prof ninguno))
   (object (is-a Ciudad) (name ?obj) (Tipo_de_ciudad $?tipos-ciudad))
   (test (eq (instance-name-to-symbol ?obj) ?c))
   (not (puntuo-profesion ?c))
   =>
   (bind ?bonus 0)
   (if (and (eq ?prof artes) (member$ [cultura] ?tipos-ciudad)) then (bind ?bonus 25))
   (if (and (eq ?prof ciencias) (or (member$ [cultura] ?tipos-ciudad) (member$ [aventura] ?tipos-ciudad))) then (bind ?bonus 20))
   (if (and (eq ?prof humanidades) (or (member$ [cultura] ?tipos-ciudad) (member$ [romantica] ?tipos-ciudad))) then (bind ?bonus 20))
   (if (and (eq ?prof tecnico) (member$ [aventura] ?tipos-ciudad)) then (bind ?bonus 15))
   (if (and (eq ?prof salud) (or (member$ [montana] ?tipos-ciudad) (member$ [playa] ?tipos-ciudad))) then (bind ?bonus 20))
   (if (> ?bonus 0) then
      (modify ?f (puntuacion (+ ?p ?bonus)))
      (format t "  [Heuristica] +%d a %s por afinidad con la profesion %s.%n" ?bonus ?c ?prof))
   (assert (puntuo-profesion ?c)))

(defrule HEURISTICA-USUARIO::puntuar-ciudad-obligatoria
   ?f <- (ciudad-candidata (nombre ?c) (valida si) (puntuacion ?p))
   (restricciones-viaje (ciudadesObligatorias $?lista))
   (test (member$ ?c $?lista))
   (not (puntuo-obligatoria ?c))
   =>
   (assert (puntuo-obligatoria ?c))
   (modify ?f (puntuacion (+ ?p 1000)))
   (format t "  [Heuristica] +1000 a %s por ser ciudad obligatoria (Prioridad Absoluta).%n" ?c))

(deffunction HEURISTICA-USUARIO::hay-interseccion (?l1 ?l2)
   (progn$ (?x ?l1)
      (if (member$ ?x ?l2) then (return TRUE)))
   (return FALSE))

(defrule HEURISTICA-USUARIO::puntuar-punto-interes
   ?f <- (ciudad-candidata (nombre ?c) (valida si) (puntuacion ?p))
   (restricciones-viaje (lugarInteres $?lugares-deseados))
   (object (is-a Ciudad) (name ?obj) (Contienen $?puntos-ciudad))
   (test (eq (instance-name-to-symbol ?obj) ?c))
   (test (HEURISTICA-USUARIO::hay-interseccion ?lugares-deseados ?puntos-ciudad))
   (not (puntuo-lugar-interes ?c))
   =>
   (assert (puntuo-lugar-interes ?c))
   (modify ?f (puntuacion (+ ?p 500)))
   (format t "  [Heuristica] +500 a %s por contener puntos de interes deseados.%n" ?c))

(defrule HEURISTICA-USUARIO::puntuar-idioma
   ?f <- (ciudad-candidata (nombre ?c) (valida si) (puntuacion ?p))
   (datos-usuario (idiomas $?idiomas-usuario))
   (object (is-a Ciudad) (name ?obj) (Hablan_en $?idiomas-ciudad))
   (test (eq (instance-name-to-symbol ?obj) ?c))
   (not (puntuo-idioma ?c))
   =>
   (bind ?coincide no)
   (progn$ (?id ?idiomas-usuario)
      (if (member$ ?id ?idiomas-ciudad) then (bind ?coincide si)))
   (if (eq ?coincide si) then
      (modify ?f (puntuacion (+ ?p 5)))
      (format t "  [Heuristica] +5 a %s por coincidir con los idiomas hablados.%n" ?c))
   (assert (puntuo-idioma ?c)))

(defrule HEURISTICA-USUARIO::filtrar-transportes-descartados
   ?f <- (ciudad-candidata (nombre ?c) (valida si))
   (restricciones-viaje (transportesDescartados $?descartados))
   (object (is-a Transporte) (Destino ?dest) (medio ?m)) 
   (test (eq (instance-name-to-symbol ?dest) ?c))
   (test (and (> (length$ ?descartados) 0) (member$ ?m ?descartados)))
   =>
   (modify ?f (valida no))
   (format t "  [Heuristica] DESCARTE: %s utiliza un transporte excluido (%s).%n" ?c ?m))

(defrule HEURISTICA-USUARIO::fin-heuristica
   (declare (salience -100))
   (not (fin-heuristica-hecho))
   =>
   (printout t crlf "--------------------------------------------" crlf)
   (printout t "            HEURISTICA TERMINADA            " crlf)
   (printout t "--------------------------------------------" crlf)
   (printout t crlf "--- LISTA DE CIUDADES CANDIDATAS ---" crlf)
   (bind ?lista (find-all-facts ((?f ciudad-candidata)) TRUE))
   (progn$ (?f ?lista)
      (format t "  Ciudad: %s | Puntos: %d | Valida: %s%n" 
        (fact-slot-value ?f nombre) 
        (fact-slot-value ?f puntuacion) 
        (fact-slot-value ?f valida)))
   (printout t "------------------------------------" crlf)
   (assert (fin-heuristica-hecho))
   (focus SINTESIS))

; =============================================================================
;                               MODULO SINTESIS
; =============================================================================

(deffunction SINTESIS::valor-calidad (?cal)
  (if (eq ?cal baja) then (return 1))
  (if (eq ?cal media) then (return 2))
  (if (eq ?cal alta) then (return 3))
  (if (eq ?cal economico) then (return 1))
  (if (eq ?cal estandar) then (return 2))
  (if (eq ?cal lujo) then (return 3))
  (return 0))

(deffunction SINTESIS::req-calidad (?cal)
  (if (<= ?cal 3) then (return 1))
  (if (<= ?cal 7) then (return 2))
  (return 3))

;; ----------------------------------------------------------------------------
;; Paso 0: Inicialización del estado de la síntesis
;; ----------------------------------------------------------------------------
(defrule SINTESIS::iniciar-sintesis
  (not (sintesis-viaje))
  (restricciones-viaje (presupuestoMaximo ?p))
  =>
  (assert (sintesis-viaje 
            (id 1) 
            (paso 1) 
            (dias-totales 0) 
            (presupuesto-restante (float ?p)) 
            (num-trans-por-parada)
            (actividades-asignadas))))

;; ----------------------------------------------------------------------------
;; Paso 1: Selección de Ciudades Candidatas
;; ----------------------------------------------------------------------------
(defrule SINTESIS::seleccionar-ciudades
  (declare (salience 50))
  ?estado <- (sintesis-viaje (paso 1) (ciudades $?ciudades) (presupuesto-restante ?pr))
  (restricciones-viaje (minNumCiudad ?min) (maxNumCiudad ?max))
  (test (< (length$ ?ciudades) ?max))
  (exists (ciudad-candidata (valida si)))
  =>
  (bind ?cands (find-all-facts ((?f ciudad-candidata)) (eq ?f:valida si)))
  (bind ?mejor nil)
  (bind ?mejor-p -9999)
  (bind ?mejor-pr 999999)
  
  (progn$ (?cand ?cands)
    (bind ?p (fact-slot-value ?cand puntuacion))
    (bind ?n (fact-slot-value ?cand nombre))
    (bind ?pc 0)
    (do-for-all-instances ((?city Ciudad)) (eq (instance-name-to-symbol (instance-name ?city)) ?n)
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
          (modify ?mejor (valida no)) 
          (if (< ?pr ?gasto-est) 
            then (printout t "  [Sintesis] Aviso: Se supera el presupuesto para incluir el minimo de ciudades." crlf))
          (modify ?estado (ciudades (create$ ?ciudades ?c)) (presupuesto-restante (- ?pr ?gasto-est))))))

(defrule SINTESIS::fin-seleccion-ciudades
  (declare (salience -10))
  ?estado <- (sintesis-viaje (paso 1) (ciudades $?ciudades))
  =>
  (if (> (length$ ?ciudades) 0) then (modify ?estado (paso 2)) else (modify ?estado (paso 5))))

;; ----------------------------------------------------------------------------
;; Paso 2: Asignación de Días por Parada y Ajuste al Máximo
;; ----------------------------------------------------------------------------
(defrule SINTESIS::asignar-dias
  (declare (salience 50))
  ?estado <- (sintesis-viaje (paso 2) (ciudades $?ciudades) (dias $?dias) (dias-totales ?tot))
  (test (< (length$ ?dias) (length$ ?ciudades)))
  =>
  (bind ?d (+ 1 (mod (random) 3)))
  (modify ?estado (dias (create$ ?dias ?d)) (dias-totales (+ ?tot ?d))))

(defrule SINTESIS::ajustar-dias
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

;; ----------------------------------------------------------------------------
;; Paso 3: Asignación de Alojamiento según Calidad Mínima
;; ----------------------------------------------------------------------------
(defrule SINTESIS::asignar-alojamiento
  (declare (salience 50))
  ?estado <- (sintesis-viaje (paso 3) (ciudades $?ciudades) (alojamientos $?aloj))
  (test (< (length$ ?aloj) (length$ ?ciudades)))
  (restricciones-viaje (calMinAlojamiento ?cm))
  =>
  (bind ?c (nth$ (+ (length$ ?aloj) 1) ?ciudades))
  (bind ?r (req-calidad ?cm))
  (bind ?v (create$))
  
  (do-for-all-instances ((?city Ciudad)) (eq (instance-name-to-symbol (instance-name ?city)) ?c)
    (progn$ (?a ?city:Tiene_un_conjunto_de)
      (if (>= (valor-calidad (send ?a get-calidadAlojamiento)) ?r) then (bind ?v (create$ ?v ?a)))))
  
  (bind ?el ninguno) (bind ?pm 999999)
  (progn$ (?a ?v)
    (if (< (send ?a get-precioAlojamiento) ?pm) 
      then (bind ?pm (send ?a get-precioAlojamiento)) 
           (bind ?el (instance-name-to-symbol (instance-name ?a)))))
  (modify ?estado (alojamientos (create$ ?aloj ?el)))) 

(defrule SINTESIS::fin-asignar-alojamiento
  (declare (salience -10))
  ?estado <- (sintesis-viaje (paso 3) (alojamientos $?aloj) (ciudades $?ciudades))
  (test (= (length$ ?aloj) (length$ ?ciudades)))
  => 
  (modify ?estado (paso 4)))

;; ----------------------------------------------------------------------------
;; Paso 4: Encadenamiento de Transportes (Rutas Directas o 1 Escala)
;; ----------------------------------------------------------------------------
(defrule SINTESIS::asig-transporte
  (declare (salience 50))
  ?estado <- (sintesis-viaje (paso 4) (ciudades $?ciudades) (transportes $?tr) (num-trans-por-parada $?ntpp))
  (test (< (length$ ?ntpp) (length$ ?ciudades)))
  ;; CORREGIDO: Mapeado al multislot real de tu template 'transportesPreferidos'
  (preferencias-viaje (transportesPreferidos $?tp)) 
  (datos-usuario (ciudad $?origen-usuario))
  =>
  (bind ?idx (+ (length$ ?ntpp) 1))
  (bind ?dest (nth$ ?idx ?ciudades))
  
  (if (= ?idx 1)
    then (bind ?orig (instance-name-to-symbol (nth$ 1 ?origen-usuario)))
    else (bind ?orig (nth$ (- ?idx 1) ?ciudades)))
    
  (bind ?mejor-ruta (create$))
  (bind ?min-precio 999999)
  
  (if (eq ?orig ?dest)
    then
      (modify ?estado (num-trans-por-parada (create$ ?ntpp 0)))
    else
      ;; 1. Buscar Ruta Directa
      (do-for-all-instances ((?t Transporte)) (and (eq (instance-name-to-symbol ?t:Origen) ?orig) (eq (instance-name-to-symbol ?t:Destino) ?dest))
        (bind ?prec (send ?t get-precioTransporte))
        (if (< ?prec ?min-precio) then 
            (bind ?min-precio ?prec)
            (bind ?mejor-ruta (create$ (instance-name-to-symbol (instance-name ?t))))))
      
      ;; 2. Buscar Ruta con una Escala Intermedia
      (if (= (length$ ?mejor-ruta) 0) then
          (do-for-all-instances ((?t1 Transporte)) (eq (instance-name-to-symbol ?t1:Origen) ?orig)
             (bind ?int (instance-name-to-symbol ?t1:Destino))
             (do-for-all-instances ((?t2 Transporte)) (and (eq (instance-name-to-symbol ?t2:Origen) ?int) (eq (instance-name-to-symbol ?t2:Destino) ?dest))
                (bind ?prec (+ (send ?t1 get-precioTransporte) (send ?t2 get-precioTransporte)))
                (if (< ?prec ?min-precio) then
                    (bind ?min-precio ?prec)
                    (bind ?mejor-ruta (create$ (instance-name-to-symbol (instance-name ?t1)) 
                                               (instance-name-to-symbol (instance-name ?t2))))))))

      (if (= (length$ ?mejor-ruta) 0) then
          (printout t "  [Sintesis] Aviso: No se encontro ruta de " ?orig " a " ?dest crlf)
          (modify ?estado (transportes (create$ ?tr ninguno)) (num-trans-por-parada (create$ ?ntpp 1)))
        else
          (modify ?estado (transportes (create$ ?tr ?mejor-ruta)) 
                           (num-trans-por-parada (create$ ?ntpp (length$ ?mejor-ruta)))))))

(defrule SINTESIS::fin-transporte
  (declare (salience -10))
  ?estado <- (sintesis-viaje (id ?id) 
                             (paso 4) 
                             (ciudades $?ci) 
                             (dias $?di) 
                             (alojamientos $?al) 
                             (transportes $?tr) 
                             (num-trans-por-parada $?ntpp) 
                             (actividades-asignadas $?act)) ;; CORREGIDO: Nombre exacto de tu deftemplate
  (test (= (length$ ?ntpp) (length$ ?ci)))
  =>
  (assert (viaje-seleccionado 
            (id ?id) 
            (ciudades ?ci) 
            (dias ?di) 
            (alojamientos ?al) 
            (transportes ?tr) 
            (num-trans-por-parada ?ntpp)
            (actividades-asignadas ?act)))
            
  (if (= ?id 1) then
    (modify ?estado (id 2) 
                    (paso 1) 
                    (ciudades (create$)) 
                    (dias (create$)) 
                    (alojamientos (create$)) 
                    (transportes (create$)) 
                    (num-trans-por-parada (create$)) 
                    (actividades-asignadas (create$)) 
                    (dias-totales 0))
  else (modify ?estado (paso 5))))

(defrule SINTESIS::fin-sint
  (declare (salience 100))
  (sintesis-viaje (paso 5))
  =>
  (printout t crlf "============================================" crlf)
  (printout t "--- SINTESIS TERMINADA   ---" crlf)
  (printout t "============================================" crlf)
  (focus IMPRIMIR-RESULTADOS))


; =============================================================================
;                           MODULO IMPRIMIR RESULTADOS
; =============================================================================

(defrule IMPRIMIR-RESULTADOS::inicio
  (declare (salience 100))
  =>
  (printout t crlf "============================================" crlf)
  (printout t "         RECOMENDACION DE VIAJES            " crlf)
  (printout t "============================================" crlf))

(defrule IMPRIMIR-RESULTADOS::imprimir-plan
  (declare (salience 50))
  (viaje-seleccionado (id ?id) (ciudades $?ciudades) (dias $?dias) (alojamientos $?alojamientos) (transportes $?transportes) (num-trans-por-parada $?ntpp))
  (datos-usuario (idiomas $?idiomas-usuario))
  ;; CORREGIDO: Cambiado 'tematicas' por 'tematicasPreferidas' según tu deftemplate
  (preferencias-viaje (tematicasPreferidas $?tematicas-usuario)) 
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
      (do-for-all-instances ((?city Ciudad)) (eq (instance-name-to-symbol (instance-name ?city)) ?c)
          (bind ?precio-ciudad (* (send ?city get-precioMedio) ?d))
          
          (bind ?raw (send ?city get-Contienen))
          (bind ?clean (create$))
          (progn$ (?l ?raw) (bind ?clean (create$ ?clean (instance-name-to-symbol (instance-name ?l)))))
          (printout t "    - Lugares a visitar: " ?clean crlf))
          
      (printout t "    - Coste vida: " ?precio-ciudad " euros." crlf)
      (bind ?precio-total (+ ?precio-total ?precio-ciudad))
      
      (if (and (neq ?aloj ninguno) (neq ?aloj [ninguno])) then
          (bind ?precio-aloj 0)
          (do-for-all-instances ((?a Alojamiento)) (eq (instance-name-to-symbol (instance-name ?a)) ?aloj)
              (bind ?precio-aloj (* (send ?a get-precioAlojamiento) ?d))
              (printout t "    - Alojamiento: " ?aloj " (Calidad: " (send ?a get-calidadAlojamiento) ")" crlf))
          (printout t "    - Coste alojamiento: " ?precio-aloj " euros." crlf)
          (bind ?precio-total (+ ?precio-total ?precio-aloj))
      else
          (printout t "    - Alojamiento: Ninguno disponible que cumpla los requisitos." crlf))
      
      (printout t "    - Transporte de llegada:" crlf)
      (if (> ?n-trans 0) then
          (loop-for-count (?j 1 ?n-trans)
              (bind ?trans (nth$ ?t-idx ?transportes))
              (if (and (neq ?trans ninguno) (neq ?trans [ninguno])) then
                  (do-for-all-instances ((?t Transporte)) (eq (instance-name-to-symbol (instance-name ?t)) ?trans)
                      (bind ?p-t (send ?t get-precioTransporte))
                      (printout t "      * " ?trans " (" (class ?t) "): " ?p-t " euros." crlf)
                      (bind ?precio-total (+ ?precio-total ?p-t)))
              else
                  (printout t "      * Ninguno encontrado." crlf))
              (bind ?t-idx (+ ?t-idx 1)))
       else
          (printout t "      * Desplazamiento local o a pie interno." crlf)))
  
  (printout t "  ------------------------------------------" crlf)
  (printout t "  RESUMEN PLAN " ?id ":" crlf)
  (printout t "    - Duracion Total: " ?duracion-total " dias." crlf)
  (printout t "    - Precio Total Aproximado: " ?precio-total " euros." crlf)
  
  (printout t "    - Preferencias cumplidas en este plan: " crlf)
  (bind ?al-menos-una no)
  (progn$ (?c ?ciudades)
      (do-for-all-instances ((?city Ciudad)) (eq (instance-name-to-symbol (instance-name ?city)) ?c)
          (bind ?hablan (send ?city get-Hablan_en))
          (progn$ (?u-id ?idiomas-usuario)
              (bind ?u-id-sym (instance-name-to-symbol (instance-name ?u-id)))
              (bind ?lista-hablan-sym (create$))
              (progn$ (?h ?hablan) (bind ?lista-hablan-sym (create$ ?lista-hablan-sym (instance-name-to-symbol (instance-name ?h)))))
              (if (member$ ?u-id-sym ?lista-hablan-sym) then 
                  (printout t "      * Se habla tu idioma (" ?u-id-sym ") en " ?c crlf)
                  (bind ?al-menos-una si)))
          
          (bind ?tipos (send ?city get-Tipo_de_ciudad))
          (progn$ (?t ?tematicas-usuario)
              (bind ?lista-tipos-sym (create$))
              (progn$ (?tp ?tipos) (bind ?lista-tipos-sym (create$ ?lista-tipos-sym (instance-name-to-symbol (instance-name ?tp)))))
              (if (member$ ?t ?lista-tipos-sym) then 
                  (printout t "      * Coincide con tu temática preferida (" ?t ") en " ?c crlf)
                  (bind ?al-menos-una si)))))
                  
  (if (eq ?al-menos-una no) then
      (printout t "      * Se han cumplido las restricciones de presupuesto y/o distancia." crlf))
  (printout t "============================================" crlf))
