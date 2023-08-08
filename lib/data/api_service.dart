import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:submission_5_story_app/data/models/story.dart';
import 'package:submission_5_story_app/data/models/story_result.dart';
import 'package:submission_5_story_app/data/models/upload_response.dart';
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

  Future<dynamic> addStory(List<int> bytes, String filename, String description) async {
    final userStorage = UserStorage();
    final token = await userStorage.token;

    var request = http.MultipartRequest('POST', Uri.parse('$baseURL/stories'));
    var multipartFile = http.MultipartFile.fromBytes('photo', bytes, filename: filename);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var fields = {
      'description': description
    };

    request.files.add(multipartFile);
    request.fields.addAll(fields);
    request.headers.addAll(headers);


    final http.StreamedResponse streamedResponse = await request.send();
    final int statusCode = streamedResponse.statusCode;

    final Uint8List responseList = await streamedResponse.stream.toBytes();
    final String responseData = String.fromCharCodes(responseList);

    if (statusCode == 201) {
      return UploadResponse.fromJson(json.decode(responseData));
    } else {
      throw Exception('failed to upload story');
    }
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

  Future<dynamic> detailStory(String id) async {
    final userStorage = UserStorage();
    final token = await userStorage.token;
    final response = await http.get(
      Uri.parse('$baseURL/stories/$id'), 
      headers: {
        'Content-Type': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
    );

    if (response.statusCode == 200) {
      return StoryResult.fromMap(json.decode(response.body));
    } else {
      throw Exception('failed to fetch story');
    }
  }
}