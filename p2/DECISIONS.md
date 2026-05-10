# Design Decisions Log — P2 SBC

Running log of non-obvious engineering choices. Each entry is a short ADR (Architecture Decision Record): context, choice, alternative, trade-off. Cherry-pick entries when writing the Formalisation / Implementation sections of the report.

Format:
```
## D-NNN: <one-line title>
**Date:** YYYY-MM-DD
**Context:** what problem we faced
**Decision:** what we picked
**Alternatives:** what we ruled out and why
**Trade-off:** what we give up
```

---

## D-001: Ontology IRI uses an unhosted `upc.edu` URL
**Date:** 2026-05-10
**Context:** Protégé requires every ontology to have a globally unique IRI. Default (`http://www.semanticweb.org/<user>/ontologies/...`) leaks the local username and is not stable.
**Decision:** `http://upc.edu/ia/p2/jmm/al-fin-del-mundo`. The `jmm` segment encodes the team initials (Javier, Manel, Marc) so the IRI uniquely identifies our specific ontology even if other UPC IA P2 teams pick similar names.
**Alternatives:** `http://example.org/...` (placeholder, looks unprofessional). The GitHub repo URL (resolves to something real, but bakes a personal account into the IRI). `urn:ia:p2:al-fin-del-mundo` (valid but Protégé and most tutorials assume http-shape).
**Trade-off:** Nothing is hosted at this URL. That's fine — IRIs are identifiers, not links; nothing dereferences it.

---

## D-002: 5-phase module decomposition in CLIPS
**Date:** 2026-05-10
**Context:** The rubric (§5.3) requires "well-defined rule modules and advanced control mechanisms". A flat ruleset would lose this point.
**Decision:** Split into 5 modules driven by an explicit `(focus interview inference generate score present)` chain in `start`:
- `interview`  — elicit facts from the user
- `inference`  — derive new facts via common-sense rules (e.g. honeymoon → romantic)
- `generate`   — build candidate trip plans
- `score`      — annotate plans with which preferences they satisfy
- `present`    — print results / infeasibility
**Alternatives:** A single MAIN module with rule salience to order phases (rejected — fragile, doesn't scale, doesn't earn the modularity rubric point). Forward-chaining with explicit phase-flag facts (rejected — global-vars-by-another-name).
**Trade-off:** Slightly more boilerplate (`defmodule`, imports) but rules in each phase are independent and testable in isolation.

---

## D-003: Mix `deftemplate` and `defclass` (COOL) deliberately
**Date:** 2026-05-10
**Context:** The rubric explicitly wants both used. Naively, everything could be one or the other.
**Decision:** Use **`defclass`** (COOL) for domain *entities* that have intrinsic attributes and exist independently of any rule firing — currently `CITY`, with `ACCOMMODATION` and `TRANSPORT` planned. Use **`deftemplate`** for *facts* the engine asserts and retracts during reasoning — `user`, `inferred`, `plan`, `infeasible`.
**Alternatives:** All deftemplates (rejected — loses the COOL/object rubric point). All defclasses (rejected — verbose for transient facts, awkward pattern-matching).
**Trade-off:** Two slightly different syntaxes for accessing data — `?fact:slot` vs. `(send ?obj get-slot)` / `?obj:slot`.

---

## D-004: `locatedIn` uses `owl:unionOf` for its domain
**Date:** 2026-05-10
**Context:** Both `Accommodation` and `PointOfInterest` are "located in" a `City`. We want one property `locatedIn` reusable for both.
**Decision:** Declare the domain as `owl:unionOf({Accommodation, PointOfInterest})`. Range: `City`.
**Alternatives:** Two `rdfs:domain` lines (rejected — multiple `rdfs:domain` declarations are *intersected*, not unioned, in OWL semantics; this would force the subject to be **both** an Accommodation and a POI, which is empty). Two separate properties `accommodationIn` / `poiIn` (rejected — duplicates the meaning, and the report would have to justify the duplication).
**Trade-off:** Slightly more verbose RDF/XML; harder for beginners to read.

---

## D-005: `hasPOI` is **not** declared `owl:inverseOf locatedIn`
**Date:** 2026-05-10
**Context:** `hasPOI` (City → PointOfInterest) is the conceptual inverse of `locatedIn` *for the POI case*. Naively we'd add `owl:inverseOf`.
**Decision:** Keep them as two separate properties; document the relationship in `rdfs:comment` only.
**Alternatives:** `owl:inverseOf` (rejected — would force the reasoner to conclude that every Accommodation `locatedIn` a city is *also* a `hasPOI` value of that city, i.e. a PointOfInterest. Either inconsistency or wrong inferences). Subproperty axioms restricting the inverse to (City × PointOfInterest) only (rejected — beyond OWL2's clean expressivity, would need property chains).
**Trade-off:** The reasoner won't auto-derive `hasPOI` from `locatedIn`; CLIPS rules / hand-asserted instances must do it. Acceptable because reasoning happens in CLIPS, not OWL.

---

<!-- Append future entries here. Each entry gets a fresh D-NNN. -->
