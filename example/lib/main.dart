import 'package:flutter/material.dart';
import 'package:flutter_design_system_lab/design_system.dart';

void main() => runApp(const DesignSystemDemo());

class DesignSystemDemo extends StatefulWidget {
  const DesignSystemDemo({super.key});

  @override
  State<DesignSystemDemo> createState() => _DesignSystemDemoState();
}

class _DesignSystemDemoState extends State<DesignSystemDemo> {
  bool darkMode = false;
  bool busy = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Design System Lab',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
      home: AppScaffold(
        title: 'Design System Lab',
        actions: [
          IconButton(
            tooltip: 'Toggle theme',
            onPressed: () => setState(() => darkMode = !darkMode),
            icon: const Icon(Icons.brightness_6_outlined),
          ),
        ],
        body: ListView(
          children: [
            Text('Reusable components',
                style: AppTypography.textTheme.headlineSmall),
            const SizedBox(height: AppSpacing.md),
            const AppStatusBanner(
              type: AppStatusType.success,
              title: 'Saved',
              message: 'This is an example success state.',
            ),
            const SizedBox(height: AppSpacing.sm),
            const AppStatusBanner(
              type: AppStatusType.warning,
              title: 'Check details',
              message: 'An example warning about missing information.',
            ),
            const SizedBox(height: AppSpacing.sm),
            const AppStatusBanner(
              type: AppStatusType.error,
              title: 'Could not save',
              message: 'An example recoverable error.',
            ),
            const SizedBox(height: AppSpacing.sm),
            const AppStatusBanner(
              type: AppStatusType.info,
              title: 'Information',
              message: 'General information for the current page.',
            ),
            const SizedBox(height: AppSpacing.lg),
            AppButton(
              label: 'Primary action',
              isLoading: busy,
              loadingSemanticsLabel: 'In progress',
              leadingIcon: Icons.send_outlined,
              onPressed: () => setState(() => busy = !busy),
              expand: true,
            ),
            const SizedBox(height: AppSpacing.sm),
            AppButton(
              label: 'Secondary action',
              variant: AppButtonVariant.secondary,
              onPressed: () => setState(() => busy = false),
              expand: true,
            ),
            const SizedBox(height: AppSpacing.md),
            const AppTextField(
              label: 'Example input',
              hint: 'Enter some text',
            ),
            const SizedBox(height: AppSpacing.md),
            const AppCard(
              child: Text('Card content uses the shared theme.'),
            ),
            const SizedBox(height: AppSpacing.md),
            const AppEmptyView(
              title: 'Nothing here yet',
              message: 'Empty states can guide the user.',
            ),
          ],
        ),
      ),
    );
  }
}
