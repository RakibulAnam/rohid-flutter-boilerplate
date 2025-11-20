import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rohid_boilerplate/presentation/features/splash/states/app_startup_state.dart';

part 'splash_viewmodel.g.dart';

@Riverpod(keepAlive: true)
class SplashViewModel extends _$SplashViewModel {
  @override
  AppStartupState build() {
    _init();
    return AppStartupState.loading;
  }

  Future<void> _init() async {
    await Future.delayed(const Duration(seconds: 2));

    final isAuthenticated = await _checkAuthStatus();

    if (isAuthenticated) {
      state = AppStartupState.authenticated;
    } else {
      state = AppStartupState.unauthenticated;
    }
  }

  Future<bool> _checkAuthStatus() async {
    // Replace with your actual check from storage/API
    return Future.value(false);
  }
}
