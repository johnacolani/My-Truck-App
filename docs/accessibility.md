# Accessibility checklist

This is a general development checklist, not a certification or a claim of compliance with any specific agency testing process.

- Do not convey status by color alone. Pair icons with meaningful titles and messages.
- Provide readable labels and semantic roles for meaningful controls and illustrations.
- Exclude purely decorative graphics from the accessibility tree when practical.
- Support platform text scaling. Avoid fixed heights around multi-line text.
- Keep controls easy to target, preferably at least 48 logical pixels in the reusable UI.
- Verify contrast of text, icons, and focus states in both themes, including disabled states.
- Keep keyboard focus and screen-reader reading order predictable.
- Make errors actionable and associate them with the appropriate control.
- Prefer caller-supplied localized strings and semantic labels.
- Test with Android TalkBack and iOS VoiceOver on real target devices.
- Validate against current WCAG guidance and any standards required by the consuming product.

## Validation guidance

Automated widget tests verify rendering and interaction, but do not replace device-based screen-reader, scaling, navigation, and contrast testing.
