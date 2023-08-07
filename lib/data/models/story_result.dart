import 'package:submission_5_story_app/data/models/story.dart';

class StoryResult {
  final bool error;
  final String message;
  final dynamic results;

  StoryResult({
    required this.error,
    required this.message,
    required this.results
  });

  factory StoryResult.fromJson(Map<String, dynamic> json) {
    return StoryResult(
      error: json['error'], 
      message: json['message'], 
      results: List.from((json['listStory'] as List).map((item) => Story.fromJson(item)))
    );
  }
}