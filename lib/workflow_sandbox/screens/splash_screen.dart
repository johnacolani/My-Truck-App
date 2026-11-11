import 'dart:async';

import 'package:flutter/material.dart';

import '../../design_system/foundation/app_colors.dart';
import '../../design_system/foundation/app_gradients.dart';
import '../demo_copy.dart';

/// An original icon animation. No third-party or employer artwork is used.
class SandboxSplashScreen extends StatefulWidget {
  const SandboxSplashScreen({
    super.key,
    required this.onComplete,
    required this.duration,
  });

  final VoidCallback onComplete;
  final Duration duration;

  @override
  State<SandboxSplashScreen> createState() => _SandboxSplashScreenState();
}

class _SandboxSplashScreenState extends State<SandboxSplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _truckPosition;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1350),
    );
    _truckPosition = Tween<Offset>(
      begin: const Offset(2.0, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    ));
    _controller.forward();
    _timer = Timer(widget.duration, widget.onComplete);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('sandbox-splash'),
      body: DecoratedBox(
        decoration: const BoxDecoration(gradient: AppGradients.primaryBackground),
        child: SizedBox.expand(
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SlideTransition(
                    position: _truckPosition,
                    child: const Icon(
                      Icons.local_shipping_rounded,
                      color: AppColors.textOnDarkPrimary,
                      size: 112,
                      semanticLabel: 'Illustrated truck',
                    ),
                  ),
                  const SizedBox(height: 28),
                  Text(
                    DemoCopy('en').text('title'),
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.textOnDarkPrimary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    DemoCopy('en').text('splash'),
                    style: const TextStyle(color: AppColors.textOnDarkPrimary),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
