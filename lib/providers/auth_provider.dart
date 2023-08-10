import 'package:flutter/material.dart';
import 'package:submission_5_story_app/config/state.dart';
import 'package:submission_5_story_app/data/api_service.dart';
import 'package:submission_5_story_app/data/storages/user_storage.dart';

class AuthProvider with ChangeNotifier {
  final APIService _apiService = APIService();
  late String _message = '';
  late ProviderState _state;
  late dynamic _result;
  late UserStorage userStorage;

  AuthProvider({required this.userStorage}) {
    _state = ProviderState.none;
  }

  ProviderState get state => _state;
  String get message => _message;
  dynamic get result => _result;

  dynamic login(Map<String, dynamic> payload) async {
    try {
      _state = ProviderState.loading;
      notifyListeners();

      final response = await _apiService.login(payload);

      if (!response['error']) {
        final payload = response['loginResult'];
        userStorage.setUserKey(payload);
        userStorage.setTokenKey(payload['token']);
        userStorage.setIsLoggedIn(true);

        _state = ProviderState.success;
        notifyListeners();

        return _message = 'success to login';
      } else {
        _state = ProviderState.failed;
        notifyListeners();

        return _message = 'failed to login';
      }
    } catch (e) {
      _state = ProviderState.failed;
      notifyListeners();

      return _message = 'Error: $e';
    }
  }

  dynamic register(Map<String, dynamic> payload) async {
    try {
      _state = ProviderState.loading;
      notifyListeners();

      final response = await _apiService.register(payload);

      if (!response['error']) {
        _state = ProviderState.success;
        notifyListeners();

        return _message = 'success to register';
      } else {
        _state = ProviderState.failed;
        notifyListeners();

        return _message = 'failed to register';
      }
    } catch (e) {
      _state = ProviderState.failed;
      notifyListeners();

      return _message = 'Error: $e';
    }
  }

  dynamic logout() async {
    userStorage.setUserKey({});
    userStorage.setTokenKey('');
    userStorage.setIsLoggedIn(false);

    _state = ProviderState.success;
    notifyListeners();

    return _message = 'success to register';
  }
}