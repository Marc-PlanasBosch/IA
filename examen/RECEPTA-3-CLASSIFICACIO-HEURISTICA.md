# RECEPTA CLASSIFICACIÓ HEURÍSTICA (Pregunta 1b del final — 2,5 punts)

> "El problema descrit és un problema d'ANÀLISI. Explica com el resoldries usant
> classificació heurística." → Sempre la mateixa metodologia de **fases + regles**.
> Model: `SBC-problema9-videojocs` (apartat b).

---

## La idea en 1 frase
No resolem el problema concret directament. **Abstraiem** les dades concretes a una
descripció abstracta, **associem** (per heurística) aquesta a una solució abstracta, i
si cal, **refinem** la solució abstracta a una solució concreta.

```
   Problema CONCRET  --(1) abstracció de dades-->  Problema ABSTRACTE
                                                          |
                                                          | (2) associació heurística
                                                          v
   Solució CONCRETA  <--(3) refinament----------   Solució ABSTRACTA
```

---

## Les FASES (sempre les mateixes)

### Fase 1 — Abstracció de dades (concret → problema abstracte)
Regles que converteixen **dades numèriques/concretes** en **valors qualitatius**.
```
si PersonajeJugador.salud < 10%        entonces Nivel_Salud = muy_bajo
si tiempo_medio_reacción(...) < 0.4seg entonces Tiempo_Reacción = rápido
si precio_max/num_viajeros < 200       entonces Presupuesto = bajo
```
> Aquí és on "neixen" les **variables del Problema Abstracte**.

### Fase 2 — Associació heurística (problema abstracte → solució abstracta)
El **cor del mètode**. Regles que lliguen característiques abstractes amb decisions abstractes.
```
si (Nivel_Salud = alta o Tiempo_Reacción = rápido)
   y Tipología_Juegos = (may_acción o may_competitivo)
   entonces AJUSTAR_NUM_ENEMIGOS = incrementar

si Presupuesto = alto y Riesgo = medio y Duración = (7-14 días)
   entonces Destino_recomendado = "Viaje por Asia"
```

### Fase 3 — Refinament (solució abstracta → solució concreta)
Només si l'enunciat demana una **resposta concreta** (un nombre exacte, un objecte concret).
```
si AJUSTAR_NUM_ENEMIGOS = incrementar
   entonces aumenta_num_Enemigos(salud, tiempo_reacción)   ; crida a funció amb dades concretes
```

---

## ⭐ El que SEMPRE has de respondre explícitament

1. **Cal refinament o no?** Justifica-ho:
   - **SÍ cal** si la solució demanada és un valor concret impossible de calcular només amb abstraccions (ex. "quants enemics afegir", "quina tarifa concreta", "quants metges enviar"). → 3 fases.
   - **NO cal** si la solució demanada ja és una categoria abstracta (ex. "classifica el pis a preu mercat / per sobre / per sota"). → 2 fases.
2. **Variables del Problema Abstracte** (nom + valors possibles). Són les característiques qualitatives.
3. **Variables de la Solució Abstracta** (nom + valors possibles).
4. **≥3 o ≥4 exemples de regles per CADA fase** (mira quants en demanen). Que siguin **variades** (que toquin conceptes diferents).

---

## Notació de les regles
Pots usar qualsevol de les dues (totes dues acceptades):
- **Alt nivell:** `si <condicions> entonces <conclusió>`
- **Estil CLIPS:** mentre quedin clars antecedent i conseqüent.

Usa **conceptes i atributs de la teva ontologia** (de la pregunta 1a). Si una regla usa
`Tipología_Juegos`, aquest atribut ha d'existir a l'ontologia.

---

## Plantilla de resposta (ordre recomanat)

1. Frase: "És un problema d'anàlisi; el resolc amb classificació heurística amb aquestes fases…"
2. **Justifica si cal refinament** (2 o 3 fases).
3. **Variables del Problema Abstracte** (llista nom + valors).
4. **Variables de la Solució Abstracta** (llista nom + valors).
5. **Regles Fase 1** (abstracció de dades) — 3-4 exemples.
6. **Regles Fase 2** (associació heurística) — 3-4 exemples.
7. **Regles Fase 3** (refinament) — 3-4 exemples (si cal).

---

## BONUS: Xarxa Bayesiana (apareix de vegades, ex. videojocs apartat c)
Si demanen modelar l'associació heurística com a **xarxa bayesiana**:
- **Nodes pare (esquerra):** característiques del Problema Abstracte.
- **Nodes fill (dreta):** característiques de la Solució Abstracta.
- **Fletxes:** del problema abstracte cap a la solució abstracta (+ dependències entre característiques si l'enunciat les dóna).
- Llista els **valors de cada variable**.
- Dóna **una taula de probabilitat** d'un node fill: files = combinacions dels pares, columnes = valors del fill. **Cada fila ha de sumar 1.** Posa més probabilitat als valors més correlacionats.

## Checklist
- [ ] He dit si cal refinament i per què?
- [ ] He llistat variables del Problema Abstracte (nom+valors)?
- [ ] He llistat variables de la Solució Abstracta (nom+valors)?
- [ ] Tinc regles d'exemple per a CADA fase (el nombre que demanen)?
- [ ] Les regles usen conceptes de la meva ontologia?
```