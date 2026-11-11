import 'package:flutter/material.dart';

import '../demo_copy.dart';
import '../widgets/language_picker.dart';

/// Sample-only legal-layout exercise. This is NOT a real Terms of Use.
class SandboxTermsScreen extends StatefulWidget {
  const SandboxTermsScreen({
    super.key,
    required this.language,
    required this.onLanguageChanged,
    required this.onBack,
  });

  final String language;
  final ValueChanged<String> onLanguageChanged;
  final VoidCallback onBack;

  @override
  State<SandboxTermsScreen> createState() => _SandboxTermsScreenState();
}

class _SandboxTermsScreenState extends State<SandboxTermsScreen> {
  bool _agreed = false;
  bool _confirmed = false;

  @override
  Widget build(BuildContext context) {
    final copy = DemoCopy(widget.language);
    return Scaffold(
      key: const Key('sandbox-terms'),
      appBar: AppBar(
        leading: IconButton(
          key: const Key('back-to-landing'),
          onPressed: widget.onBack,
          icon: const Icon(Icons.arrow_back),
          tooltip: copy.text('back'),
        ),
        title: Text(copy.text('termsTitle')),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 620),
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                SandboxLanguagePicker(
                  language: widget.language,
                  onChanged: widget.onLanguageChanged,
                ),
                const SizedBox(height: 20),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          copy.text('sampleNotice'),
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(height: 20),
                        Text(copy.text('termsIntro')),
                        const SizedBox(height: 16),
                        Text(copy.text('termsOne')),
                        const SizedBox(height: 12),
                        Text(copy.text('termsTwo')),
                        const SizedBox(height: 12),
                        Text(copy.text('termsThree')),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                CheckboxListTile(
                  key: const Key('accept-demo-checkbox'),
                  title: Text(copy.text('agree')),
                  value: _agreed,
                  onChanged: (value) => setState(() {
                    _agreed = value ?? false;
                    _confirmed = false;
                  }),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                const SizedBox(height: 14),
                ElevatedButton(
                  key: const Key('confirm-sample-terms'),
                  onPressed: _agreed
                      ? () => setState(() => _confirmed = true)
                      : null,
                  child: Text(copy.text('confirm')),
                ),
                if (_confirmed) ...[
                  const SizedBox(height: 20),
                  Semantics(
                    liveRegion: true,
                    child: Text(
                      copy.text('accepted'),
                      key: const Key('local-acceptance-result'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
