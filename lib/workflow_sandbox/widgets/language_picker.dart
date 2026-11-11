import 'package:flutter/material.dart';

import '../demo_copy.dart';

/// Shared picker, so landing and terms always reflect the same language.
class SandboxLanguagePicker extends StatelessWidget {
  const SandboxLanguagePicker({
    super.key,
    required this.language,
    required this.onChanged,
  });

  final String language;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final copy = DemoCopy(language);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(copy.text('language'), style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: 6),
        DropdownButton<String>(
          key: const Key('demo-language'),
          isExpanded: true,
          value: language,
          items: const [
            DropdownMenuItem(value: 'en', child: Text('English')),
            DropdownMenuItem(value: 'es', child: Text('Español')),
            DropdownMenuItem(value: 'fr', child: Text('Français')),
          ],
          onChanged: (value) {
            if (value != null) onChanged(value);
          },
        ),
      ],
    );
  }
}
