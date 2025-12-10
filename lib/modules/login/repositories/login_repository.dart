/// Login repository - Mock implementation
/// Provides data only, no business logic
class LoginRepository {
  LoginRepository();

  /// Mock login method - always returns success
  /// No actual authentication, just for UI flow
  Future<bool> login(String username, String password) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    return true;
  }
}

