import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../core/providers/app_state_provider.dart';

part 'onboarding_controller.g.dart';

@riverpod
class OnboardingController extends _$OnboardingController {
  @override
  FutureOr<void> build() {
    // nothing to initialize
  }

  Future<void> completeOnboarding(String role) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final appState = ref.read(appStateProvider.notifier);
      await appState.setUserRole(role);
      await appState.completeOnboarding();
    });
  }
}
