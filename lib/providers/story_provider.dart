import 'package:flutter/material.dart';
import 'package:submission_5_story_app/config/state.dart';
import 'package:submission_5_story_app/data/api_service.dart';

class StoryProvider with ChangeNotifier {
  final APIService _apiService = APIService();
  List _result = [];
  late ProviderState _state;
  late String _message = '';

  StoryProvider() {
    _state = ProviderState.none;
    fetchStory();
  }

  String get message => _message;
  ProviderState get state => _state;
  dynamic get result => _result;

  Future<dynamic> fetchStory() async {
    try {
      _state = ProviderState.loading;
      notifyListeners();
      
      final response = await _apiService.fetchStory();

      if (response.results.isEmpty) {
        _state = ProviderState.none;
        notifyListeners();

        return _message = 'no data';
      } else {
        _state = ProviderState.success;
        notifyListeners();

        return _result = response.results;
      }
    } catch (e) {
      _state = ProviderState.failed;
      notifyListeners();

      return _message = 'failed to fetch story';
    }
  }

  Future<dynamic> uploadStory(List<int> bytes, String filename, String description) async {
    try {
      _state = ProviderState.loading;
      notifyListeners();

      final response = await _apiService.addStory(bytes, filename, description);

      print('response: ${response.error}');
      print('response: ${response.message}');

      if (response.error) {
        _state = ProviderState.failed;
        notifyListeners();

        return _message = 'failed to upload story';
      } else {
        _state = ProviderState.success;
        notifyListeners();

        return _message = response.message;
      }


    } catch (e) {
      _state = ProviderState.failed;
      notifyListeners();

      return _message = 'failed to upload story';
    }
  }
}