# RECEPTA ONTOLOGIA (Pregunta 1a del final — 2,5 punts)

> Sempre la mateixa feina: a partir d'un enunciat ple de descripcions, dibuixar una
> **jerarquia de conceptes** amb atributs, i dir què és **entrada** i què és **solució**.
> Model perfecte: la solució de `SBC-problema9-videojocs` (apartat a).

---

## Què has d'entregar SÍ o SÍ (els ho llisten gairebé sempre)

1. **Diagrama de l'ontologia**: conceptes (classes) + relacions entre ells.
2. **Atributs de cada concepte**: per cada atribut → **nom + tipus** (i si és enumeració, els **valors possibles**).
3. **Quins conceptes són dades d'ENTRADA** i quins són la **SOLUCIÓ**.
4. **Justificació de les decisions de disseny**, especialment **per què crees cada subclasse**.

---

## Pas 1 — Extreure els conceptes
Subratlla a l'enunciat tots els **substantius importants**. Cada un sol ser una classe.
- Ex. viatges: Destí, Allotjament (Hotel/Hostal/Alberg), Transport (Avió/Tren/Barco...), Activitat, Viatger, Petició, Usuari...

## Pas 2 — Relacions (les fletxes del diagrama)
Tipus de relacions que apareixen sempre:
- **`es_un` (taxonòmica / herència):** Avió **es_un** Transport, Hotel **es_un** Allotjament.
- **`parte_de` (composició):** sempre que l'enunciat digui "X es compon de Y" → **Y parte_de X**. (Espai parte_de Nivell, Nivell parte_de Joc).
- **Relacions associatives amb nom:** `situado_en`, `participa_en`, `da_acceso_a`, `tiene`, `asociado_a`, `depende_de`...

## Pas 3 — Decidir SUBCLASSE vs ATRIBUT "tipo" (la decisió que valoren)
> **Regla d'or:** crea una **subclasse** quan el subgrup té **atributs diferents i/o relacions diferents**.
> Si només canvia una "etiqueta" sense atributs propis → fes un **atribut `tipo` (enumeració)**.

- Exemple SÍ subclasse: *Pel·lícula* té director i premis que *Cançó* no té → subclasses de Producte.
- Exemple NO subclasse: *Hito Argumental* amb tema {missió/misteri/relació} → només atribut `tema`, perquè no tenen atributs propis diferents.
- **Heurístic extra (suma punts):** "branques germanes de la taxonomia haurien de tenir granularitat similar". Per això NO creïs superclasses artificials (ex. no facis `ObjecteAmbEnergia` només perquè Arma i Vehicle comparteixen un atribut).

## Pas 4 — Atributs amb tipus
Format per cada concepte:
```
Concepte: atribut1 (tipus), atribut2 (enumeració: {val1, val2, val3}), ...
```
Tipus possibles: `string`, `entero`, `real`, `booleano`, `fecha`, `hora`, `enumeración {…}`, `%`, unitats (km, minuts, €...).

Exemple real (videojocs):
```
Juego: título (string), año_publicación (entero),
       edad_recomendada (enum: {+0,+3,+5,+8,+12,+18}),
       online? (booleano), multijugador (booleano)
NPC:   enemigo? (booleano), nivel_IA (enum: {1..10})
```

## Pas 5 — ENTRADA vs SOLUCIÓ ⭐ (molt important, sovint l'obliden)
- **Entrada:** tots els conceptes que vénen de les dades (la BD, la petició de l'usuari, el catàleg...).
- **Solució:** els conceptes/atributs que el sistema **decideix o calcula**.
- 🔑 **El truc que connecta amb la pregunta 1b:** afegeix a l'ontologia, com a **atributs**, les **característiques abstractes** del problema i de la solució (les que després faràs servir a la classificació heurística). Així "tots els predicats de les regles estan suportats per l'ontologia".
  - Ex. videojocs: a *Jugador* hi posa `Tiempo_Exploración (enum: {mínimo,normal,elevado})`, i a *Partida* hi posa `AJUSTAR_NUM_ENEMIGOS (enum: {incrementar,mantener,reducir})`.

> **Nota de l'enunciat (recorda-ho):** "l'ontologia pot necessitar modificacions per adaptar-la a l'apartat b)". Vol dir: deixa lloc per les característiques abstractes i de solució.

---

## Plantilla de resposta (ordre recomanat)

1. Diagrama (classes + `es_un`/`parte_de`/relacions).
2. Paràgraf de justificació: per què aquestes subclasses (regla d'or) i per què NO d'altres (granularitat).
3. Llista d'atributs per concepte (nom + tipus + valors).
4. Llista explícita: **Conceptes d'entrada** = {…}; **Conceptes de solució** = {…}.

## Checklist
- [ ] Cada concepte de l'enunciat hi és?
- [ ] Cada subclasse està justificada (atributs/relacions propis)?
- [ ] Tot atribut té nom + tipus (+ valors si enum)?
- [ ] He marcat entrada vs solució?
- [ ] He inclòs com a atributs les característiques abstractes/solució que faré servir a 1b?
```