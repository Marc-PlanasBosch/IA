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

## D-006: TripObjective values modeled as `NamedIndividual`s, not subclasses
**Date:** 2026-05-10
**Context:** The five canonical trip objectives — `rest`, `cultural`, `fun`, `romantic`, `honeymoon` — are a closed enumeration. They could be subclasses of `TripObjective`, individuals of `TripObjective`, or string values of a `themeTag` data property.
**Decision:** Use `owl:NamedIndividual`s of class `TripObjective`. Then `User hasPreference romantic` is a clean object property assertion.
**Alternatives:** Subclasses (rejected — would require punning to also use them as values, since OWL DL doesn't allow a class to fill an object-property slot directly). String values (rejected — loses structure; reasoner can't enforce the closed set; lookups in CLIPS would need string compares).
**Trade-off:** If we later need to attach data to an objective (e.g. a description), we already have the individual to hang it on. The closed set isn't enforced by OWL — we'd need an `owl:oneOf` axiom on `TripObjective` to do that, which we can add later.

---

## D-007: `priceEUR` is one shared property over `Accommodation ∪ Transport ∪ Trip`
**Date:** 2026-05-10
**Context:** Three classes need a price attribute. We could declare three properties (`accommodationPrice`, `transportPrice`, `tripPrice`) or one shared one.
**Decision:** One shared `priceEUR` data property with a union domain over the three classes. Marked `owl:FunctionalProperty` (each individual has one price). Range `xsd:decimal`.
**Alternatives:** Three separate properties (rejected — duplicates the concept; the ontology graph PNG becomes cluttered; the report has to justify the duplication). One property with no domain restriction (rejected — too permissive; e.g. nothing would prevent setting `priceEUR` on a `User`).
**Trade-off:** The semantic meaning of "price" differs slightly per class (per-night for accommodations, per-segment for transport, total per-person for trips). Documented in the property's `rdfs:comment` rather than encoded structurally.

---

## D-008: CLIPS scaffold mirrors the OWL ontology one-to-one
**Date:** 2026-05-10
**Context:** Two formal representations of the same domain — the ontology (`p2/al-fin-del-mundo.rdf`) and the rule-base (`p2/clips/`) — could drift apart. The rubric (§5.1 Implementation) wants "adequate ontology representation" in the code.
**Decision:** Each ontology class with intrinsic attributes maps to a CLIPS `defclass` (`CITY`, `ACCOMMODATION`, `TRANSPORT`); each object property navigation maps to an `INSTANCE-NAME` slot (`ACCOMMODATION located-in CITY`, `plan accommodations`, `plan transport`). Names are aligned: ontology class `Hotel` ↔ CLIPS slot value `(kind Hotel)`. The OWL individuals (`HotelRitzParis`, `TGVHighSpeed`, …) appear verbatim as CLIPS instance names in `data.clp`.
**Alternatives:** Generate CLIPS from OWL programmatically with a converter (rejected — overkill for this size; the ontology will keep changing during Sprint 5; debugging the converter would cost more than just keeping the two in sync by hand). Use the ontology purely as documentation, with a CLIPS-only domain (rejected — fails the rubric's "adequate ontology representation" check).
**Trade-off:** Manual sync. Mitigation: a single canonical naming convention and the matching convention listed in `data.clp` / `main.clp` comments. If divergence becomes painful, revisit and consider a generator.

---

<!-- Append future entries here. Each entry gets a fresh D-NNN. -->
