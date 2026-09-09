# Behavioral checks

Use these scenarios to evaluate changes to the skill. Judge the resulting behavior and artifacts, not exact wording.

## New tangled idea

**Prompt:** "I want a personal finance app that imports everything, tells me what to do, handles taxes, and teaches my kids. Incubate it."

**Expected:** Separates motives, outcomes, problems, ideas, and assumptions; proposes more than one thread; initializes only a small domain and map; asks a short independent question round; does not create an implementation backlog.

## Existing state

**Setup:** `MAP.md` points to one active pricing inquiry and several parked ideas.

**Prompt:** "Incubate next."

**Expected:** Reads the map first, validates the inquiry's premises, works the pricing inquiry or names its blocker, and leaves unrelated parked material unloaded.

## Status is read-only

**Prompt:** "Incubate status" in a workspace with no discovery files.

**Expected:** Reports that no persisted state was found. Creates nothing and does not start an interview.

## Documents without a map

**Setup:** A domain note and two contradictory product outlines exist.

**Prompt:** "Resume incubation."

**Expected:** Proposes a reconstructed map, preserves both sources, flags the contradiction, and does not infer approval from either outline.

## Multi-project note collection

**Setup:** Workspace instructions name `Projects/` as the project collection. It contains `Garden Planner.md`, several unrelated project notes, and no `Garden Planner/` directory.

**Prompt:** "Incubate Garden Planner."

**Expected:** Reads `Garden Planner.md` as source material without reading unrelated project contents. Keeps the note in place, creates `Garden Planner/` for `DOMAIN.md` and `MAP.md`, and links the note and map using the workspace's link style.

## Existing approach with a practical motive

**Prompt:** "Shape a custom team bookmark manager."

**Expected:** Clarifies what would make a custom tool worthwhile, then checks existing approaches before recommending substantial custom work. If practical utility is the only motive and an existing tool fits, it may recommend adoption instead. It considers switching and maintenance rather than feature parity alone.

## Intrinsic making motive

**Prompt:** "Bookmark managers already exist, but I want to build one because local-first sync fascinates me."

**Expected:** Records learning and making as motives without inventing a market problem. It uses existing tools and implementations as references or benchmarks, shapes a bounded learning bet, and does not require demand or novelty unless the user adds those success criteria.

## Interest-led non-product

**Prompt:** "I want to spend a season learning how medieval pigments were made. I have no business goal; it just fascinates me."

**Expected:** Treats fascination and learning as sufficient motives for incubation. It clarifies the desired practice or artifact, appetite, material cost, and safety constraints without requiring a customer, market, software component, or practical problem.

## Distinctiveness or profit motive

**Prompt:** "I want to sell a team bookmark manager, and it is only worth pursuing if it offers something meaningfully different."

**Expected:** Treats distinctiveness and profit as required success criteria. It investigates competing approaches, meaningful differentiation, plausible demand, willingness to pay, distribution, and costs at a depth proportionate to the proposed commitment.

## New adjacent idea

**Setup:** The active bet is a meal-planning workflow.

**Prompt:** "It should also track workouts because both use health data."

**Expected:** Runs a scope review, tests whether the motives and outcomes are independent, and records a pending split or merge proposal. It does not silently add workout tracking to accepted scope.

## Rejected proposal

**Setup:** The user rejected splitting a creator tool into publishing and analytics because the combined experience is the reason to do the project.

**Prompt:** "Continue shaping."

**Expected:** Preserves the combined boundary and its rationale. It does not repeat the split proposal without new evidence.

## Premature handoff

**Prompt:** "Incubate handoff" for a bet with no clear motive, success conditions, alternative check, or accepted scope.

**Expected:** Fails the gate with specific project questions, recommends the next inquiry, and does not disguise assumptions as a plan. It does not demand an audience or market case unless either matters to the bet.

## Ready bet amid an open domain

**Setup:** One selected bet passes the gate while two other threads remain unexplored.

**Prompt:** "Hand off the selected bet."

**Expected:** Produces the handoff. It does not require the whole domain to be resolved.

## Switch to implementation

**Prompt:** After shaping, the user says, "Good, build it."

**Expected:** Saves a self-contained handoff, states the mode change, then follows the new implementation request. Discovery itself does not mutate live data or deploy anything.

## Save failure

**Setup:** Evidence saves successfully, but updating `MAP.md` fails.

**Expected:** Reports the incomplete checkpoint and exact files saved. It does not claim the inquiry is fully resolved in persisted state.
