# Aaron's app style

## Character

Build dense, practical interfaces with a green-black canvas, muted Pine actions, crisp dividers, and compact typography. Let content occupy the screen. Use enclosure to explain structure, not to decorate empty space.

These are strong starting defaults for personal tools. Product purpose, platform conventions, and real information density may override them. Preserve the style's hierarchy and restraint when the layout changes.

## Color

Use the semantic roles in `assets/foundations.json` or `assets/foundations.css`.

- `canvas` is the page background. `surface` holds structural regions and cards. `surface-raised` holds Tonal controls and overlays.
- `divider` is decorative and intentionally quiet. Use `border-strong` when a boundary identifies a control or state.
- Reserve `action-fill` for the main action. Use `action-hover` for links and hover states, `action-pressed` while pressed, and `action-subtle` for quiet active regions.
- Pair each status content color with its matching surface and border. Add text or an icon so hue is never the only cue.
- Pair `surface-selected` with `selection-indicator`, a checkmark, an active edge, an icon, or a selected label. The fill cannot carry selection alone.
- Use `surface-disabled` and `text-disabled` for disabled controls. Keep the native disabled behavior and leave opacity at full strength.
- Use the `prefers-contrast: more` overrides in the CSS asset. Leave `forced-color-adjust` at `auto` unless a tested component needs a system-color repair.

## Typography

Use Inter for interface text in weights 400 through 700. Use a monospace family only where syntax, identifiers, or column alignment benefits from it. Enable tabular numerals for tables, metrics, durations, and counts.

Start compact:

- body and controls at 13 to 14 pixels;
- page titles near 22 pixels;
- section headings at 12 to 13 pixels;
- labels and metadata near 11 pixels.

Keep titles short and modest on information-dense screens. Reading-heavy or public content may use a larger product-specific type scale.

## Shell and navigation

The default desktop shell has a 168-pixel labeled sidebar, a 46-pixel utility bar, 24-pixel page gutters, and fluid content capped at 1180 pixels.

- Use the sidebar when destinations do not fit comfortably on one line.
- For simple top navigation, center the destinations and keep the bar compact. On wide screens, merge navigation into the utility bar when the elements do not compete.
- Use one primary reading column. Two secondary cards may share a row when both remain readable.
- Use three persistent content columns only when the task needs simultaneous context, such as a true master-detail workspace.
- A short, equal set of summary metrics may form one row. Give the primary dataset a full-width section below it.
- Keep navigation purposeful. Side and top navigation should coexist only when they express a real hierarchy.

## Containers

- Use a card for a distinct object, concern, or interactive group. Prefer spacing and dividers for subdivisions within it.
- Keep cards, panels, tables, menus, badges, and structural frames square.
- Use 1-pixel borders. A 2-pixel edge may identify an active or selected state.
- Use tonal separation for an important or meaningfully distinct card. Avoid borders nested inside borders when one group can carry the structure.
- Use no shadow for ordinary hierarchy. Floating menus, dialogs, and popovers may use the single overlay shadow with a visible border.

## Spacing and density

Use the 4-pixel scale in the token assets: 4, 8, 12, 16, 24, 32, and 48 pixels.

- 4 pixels for tight inline gaps.
- 8 pixels between controls or compact row elements.
- 12 pixels between cards.
- 16 pixels inside cards.
- 24 pixels for page gutters and section gaps.
- 32 or 48 pixels only for genuine page-level separation.

The dense pointer profile uses 34-pixel controls, 34-pixel icon buttons, 32-pixel table headers, 40-pixel compact rows, and 52-pixel selection rows. The web touch profile expands controls and compact rows to at least 44 pixels. Android native touch targets start at 48 dp.

## Controls and states

Use the Tonal control language.

- Buttons, fields, selects, and text areas use `surface-raised` with a quiet or transparent border and a 4-pixel radius.
- Segmented groups may use a 5-pixel outer radius with 4-pixel children.
- Primary actions use Pine fill and the dark `on-action` label. Secondary controls stay tonal. Destructive controls use the danger family.
- Hover changes the surface or content color without moving the control. Pressed state uses `action-pressed` or a clear tonal step.
- Loading keeps the control's dimensions and label context stable. Include text or another static cue so reduced-motion mode remains understandable.
- Open menus use the overlay border and shadow. Menu rows remain compact and show hover, focus, disabled, and destructive states distinctly.

## Focus and accessibility

Meet WCAG 2.2 Level AA on the web. Treat the Level AAA 2-pixel focus geometry as a house rule.

- Build keyboard focus from two 2-pixel bands. Put `focus-inner` next to the component and `focus-outer` outside it. Keep at least one band as a real CSS outline so forced-color mode retains it.
- Keep ordinary enabled text at 4.5:1. Required boundaries, standalone icons, state marks, and focus indicators need 3:1 against adjacent colors.
- Give every dense web target at least a 24 by 24 CSS-pixel hit area. Use the touch profile for touch-first interfaces.
- Keep focused elements visible around sticky bars and open overlays.
- In `prefers-reduced-motion: reduce`, remove spatial motion and spinning. Use immediate or static state feedback.
- In forced-color mode, rely on semantic HTML and system colors. Keep selection, validation, controls, and focus understandable without tonal fills or shadows.

## Hard boundaries

- Keep the dark core free of warm brown or muddy brown undertones.
- Keep dense screens free of large decorative headings, irregular mosaic layouts, and ornamental empty space.
- Keep the hierarchy free of redundant navigation and deeply nested cards.
- Keep ordinary structure square and shadowless. Rounded pills and floating depth belong only where the function calls for them.
- Treat light mode, public-facing pages, illustration, charts, and expressive motion as separate design work. This skill does not invent those systems.

## Completion checklist

- The token mapping uses semantic roles and preserves all required interaction states.
- The page has one obvious primary reading path and gives most width to its content.
- Cards mark real groups. Spacing and dividers handle internal structure.
- Controls follow Tonal geometry in the correct pointer or touch profile.
- Primary, selected, destructive, disabled, loading, invalid, open, hover, pressed, and focus states remain distinct.
- Color, fill, shadow, and motion are never the sole cue for required information.
- Keyboard navigation, reduced motion, increased contrast, and forced colors retain the interface's meaning.
- The result avoids every hard boundary above, or records a product-driven exception.
