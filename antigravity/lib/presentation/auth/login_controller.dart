import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/datasources/remote/auth_remote_data_source.dart';

part 'login_controller.g.dart';

class LoginState {
  final bool isLoading;
  final String? error;
  final bool isAuthenticated;

  const LoginState({
    this.isLoading = false,
    this.error,
    this.isAuthenticated = false,
  });

  LoginState copyWith({
    bool? isLoading,
    String? error,
    bool? isAuthenticated,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }
}

@riverpod
class LoginController extends _$LoginController {
  static const String _authKey = 'is_authenticated';
  static const String _emailKey = 'user_email';
  static const String _nameKey = 'user_name';

  @override
  LoginState build() {
    return const LoginState();
  }

  Future<void> checkAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final isAuth = prefs.getBool(_authKey) ?? false;
    state = state.copyWith(isAuthenticated: isAuth);
  }

  Future<bool> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      if (email.isEmpty || password.isEmpty) {
        state = state.copyWith(
          isLoading: false,
          error: 'Email and password are required',
        );
        return false;
      }

      final authDataSource = ref.read(authRemoteDataSourceProvider);
      final response = await authDataSource.login(email, password);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_authKey, true);
      await prefs.setString(_emailKey, response.email);
      await prefs.setString(_nameKey, response.name);
      await prefs.setString('auth_token', response.token);

      state = state.copyWith(isLoading: false, isAuthenticated: true);
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      return false;
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_authKey);
    await prefs.remove(_emailKey);
    await prefs.remove(_nameKey);
    state = state.copyWith(isAuthenticated: false);
  }

  Future<Map<String, String?>> getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'email': prefs.getString(_emailKey),
      'name': prefs.getString(_nameKey),
    };
  }
}
