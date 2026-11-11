import 'package:flutter/material.dart';

import '../../design_system/atoms/app_button.dart';
import '../../design_system/foundation/app_colors.dart';
import '../../design_system/foundation/app_gradients.dart';
import '../demo_copy.dart';
import '../widgets/language_picker.dart';

class SandboxLandingScreen extends StatelessWidget {
  const SandboxLandingScreen({
    super.key,
    required this.language,
    required this.onLanguageChanged,
    required this.onOpenTerms,
  });

  final String language;
  final ValueChanged<String> onLanguageChanged;
  final VoidCallback onOpenTerms;

  @override
  Widget build(BuildContext context) {
    final copy = DemoCopy(language);
    return Scaffold(
      key: const Key('sandbox-landing'),
      body: DecoratedBox(
        decoration: const BoxDecoration(gradient: AppGradients.primaryBackground),
        child: SizedBox.expand(
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Icon(
                        Icons.local_shipping_outlined,
                        color: AppColors.textOnDarkPrimary,
                        size: 64,
                      ),
                      const SizedBox(height: 18),
                      Text(
                        copy.text('title'),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: AppColors.textOnDarkPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        copy.text('subtitle'),
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: AppColors.textOnDarkPrimary),
                      ),
                      const SizedBox(height: 24),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(22),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                copy.text('welcome'),
                                style: Theme.of(context).textTheme.headlineSmall,
                              ),
                              const SizedBox(height: 8),
                              Text(copy.text('description')),
                              const SizedBox(height: 20),
                              SandboxLanguagePicker(
                                language: language,
                                onChanged: onLanguageChanged,
                              ),
                              const SizedBox(height: 18),
                              AppButton(
                                key: const Key('open-sample-terms'),
                                label: copy.text('termsButton'),
                                expand: true,
                                onPressed: onOpenTerms,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      Text(
                        copy.text('sampleNotice'),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColors.textOnDarkPrimary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
