import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'onboarding_controller.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(onboardingControllerProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              const Icon(Icons.water_drop, size: 80, color: Colors.blue),
              const SizedBox(height: 24),
              Text(
                'Welcome to NOVA',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Real-time groundwater intelligence for India.',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              Text(
                'Select your role to continue:',
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              _RoleButton(
                role: 'Researcher',
                icon: Icons.science,
                onPressed: () => _selectRole(context, ref, 'Researcher'),
              ),
              const SizedBox(height: 12),
              _RoleButton(
                role: 'Planner',
                icon: Icons.map,
                onPressed: () => _selectRole(context, ref, 'Planner'),
              ),
              const SizedBox(height: 12),
              _RoleButton(
                role: 'Policymaker',
                icon: Icons.policy,
                onPressed: () => _selectRole(context, ref, 'Policymaker'),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectRole(
      BuildContext context, WidgetRef ref, String role) async {
    await ref
        .read(onboardingControllerProvider.notifier)
        .completeOnboarding(role);
    if (context.mounted) {
      context.go('/home');
    }
  }
}

class _RoleButton extends StatelessWidget {
  final String role;
  final IconData icon;
  final VoidCallback onPressed;

  const _RoleButton({
    required this.role,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(role),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        textStyle: const TextStyle(fontSize: 18),
      ),
    );
  }
}
