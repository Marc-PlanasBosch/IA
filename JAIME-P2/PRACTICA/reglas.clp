
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