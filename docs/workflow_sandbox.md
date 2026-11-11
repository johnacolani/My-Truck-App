# Independent three-screen Flutter sandbox

This is a small, original Flutter UI exercise on a separate branch of the personal, private Flutter Design System Lab. It is **not** a copy of any employer or government application. No employer code, source screenshot, logos, translations, official Terms of Use, endpoints, credentials, or internal documents are included.

## Screens

1. **Animated splash**: A generic Material delivery-truck icon slides into place, then automatically continues to the landing screen.
2. **Landing**: A welcome card, English / Spanish / French language selector, and a button leading to sample terms.
3. **Sample terms**: Reuses the language choice, includes a demo disclaimer, a required checkbox, and a local confirmation. It is **not** a legally operative agreement.

The screens reuse the lab's existing Material theme and components. This separate target does not modify the existing default landing preview or component gallery.

## Run locally

On a fresh personal-machine clone, run:

```bash
git checkout feature/workflow-sandbox-three-screens
flutter pub get
flutter create --platforms=ios,android,macos --project-name flutter_design_system_lab .
flutter run -d macos -t lib/main_workflow_sandbox.dart
```

If native platform folders are already present and customized, do not regenerate them without reviewing the changes. Change the device selector for an installed iOS Simulator or Android emulator.

## Tests

```bash
flutter analyze
flutter test test/workflow_sandbox_test.dart
flutter test
```

CI and local checks still need to confirm results. This environment has no Flutter executable, so these tests have not been run here.

## Future Mock API exercise

No API client, Dio interceptor, mock fixtures, HTTP status scenarios, authentication, or backend calls are implemented. Keep those as a **separate next step**, with original endpoints and fake, non-sensitive test data. Suggested integration seam: a test-only repository interface independent of these three screen widgets.

## Boundaries

Do not merge this exercise into employer code or copy restricted material into a personal account. Obtain any necessary written permissions before reusing workplace intellectual property. The independent app's sample text and visuals are deliberately generic.
