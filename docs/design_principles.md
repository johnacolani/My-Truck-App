# Design principles

1. **Semantic tokens.** Widgets use shared roles instead of duplicating raw hex values and spacing.
2. **One source of truth.** Typography, spacing, radii, sizing, elevation, colors, and gradients have separate foundation files.
3. **Themes.** Render every UI element under the consuming application's `ThemeData`. Test light and dark appearances.
4. **Composition.** Small building blocks form larger reusable UI without owning domain logic.
5. **Localization.** Consumer applications supply translated visible text and accessibility labels. Components avoid embedding app-specific messages.
6. **Architecture boundaries.** Design-system widgets do not call APIs, repositories, databases, or navigation services.
7. **Tests.** Cover user-facing states, interactions, semantics, and text growth before declaring a widget finished.
8. **No restricted materials.** This repository intentionally uses an independent palette, copy, samples, and component source.

## Layer map

- `foundation/`: visual constants and scales
- `theme/`: Material light and dark themes
- `atoms/`: buttons and other simple controls
- `molecules/`: status messages, fields, cards
- `organisms/`: loading/error/empty presentations
- `templates/`: common page composition

A consuming application is responsible for its domain/data/presentation layers, including state-management, validation, networking, navigation, and localization resources.
