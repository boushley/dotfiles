---
name: my-style
description: Apply Aaron's Pine on Juniper app style to application UI work, including new screens, restyling, prototypes, and visual reviews.
---

# My app style

Use Aaron's settled visual defaults without forcing every product into the same layout.

## Apply the style

1. Read [references/style-guide.md](references/style-guide.md) before changing or evaluating an interface. The work is ready when product needs, existing conventions, and the style's defaults have a clear priority.
2. Inspect the target app before editing. Preserve its framework, component system, interaction model, and accessibility semantics. The inspection is complete when you know where global tokens and shared components belong.
3. For new or restyled interfaces, map the semantic values from [assets/foundations.json](assets/foundations.json) into the project's existing token system. When plain CSS is appropriate, copy or import [assets/foundations.css](assets/foundations.css). The mapping is complete when components use semantic roles rather than copied hex values.
4. Apply the guide to the requested scope. Product-specific information architecture wins when it conflicts with the default shell. Keep deliberate deviations local and explain any that materially change the result.
5. Check the finished work against every relevant item in the guide's completion checklist.

For a visual review, stop after reporting concrete departures from the guide unless the user also asked for changes.

## Completion

The interface uses Pine on Juniper, Inter, the selected density and geometry, Tonal controls, and the accessibility rules wherever they apply. Product-driven exceptions are named. No required state depends on color, fill, or motion alone.
