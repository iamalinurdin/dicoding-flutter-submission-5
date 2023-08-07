import 'dart:convert';
import 'dart:io';

import 'package:submission_5_story_app/data/models/story_result.dart';
import 'package:submission_5_story_app/data/storages/user_storage.dart';
import 'package:http/http.dart' as http;

class APIService {
  late String accessToken = '';
  final String baseURL = 'https://story-api.dicoding.dev/v1';

  APIService() {
    init();
  }

  init() async {


    // print(token);
    // accessToken = token;
  }

  Future<dynamic> login(dynamic payload) async {
    final response = await http.post(
      Uri.parse('$baseURL/login'), 
      headers: {
        'Content-Type': 'application/json'
      },
      body: json.encode(payload), 
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('failed to fetch login');
    }
  }

  Future<dynamic> register(dynamic payload) async {
    final response = await http.post(
      Uri.parse('https://story-api.dicoding.dev/v1/register'), 
      headers: {
        'Content-Type': 'application/json'
      },
      body: json.encode(payload), 
    );

    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('failed to fetch login');
    }
  }

  Future<dynamic> addStory(dynamic payload) async {
    final userStorage = UserStorage();
    final token = await userStorage.token;
    final response = await http.post(
      Uri.parse('$baseURL/stories'), 
      headers: {
        'Content-Type': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
      body: json.encode(payload), 
    );

    print('response: ${response}');
  }

  Future<dynamic> fetchStory() async {
    final userStorage = UserStorage();
    final token = await userStorage.token;
    final response = await http.get(
      Uri.parse('$baseURL/stories'), 
      headers: {
        'Content-Type': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
    );

    if (response.statusCode == 200) {
      return StoryResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('failed to fetch story');
    }
  }

  Future<dynamic> detailStory(int id) async {
    final response = await http.get(
      Uri.parse('$baseURL/stories/$id'), 
      headers: {
        'Content-Type': 'application/json',
        HttpHeaders.authorizationHeader: accessToken
      },
    );

    print('response: ${response}');
  }
}