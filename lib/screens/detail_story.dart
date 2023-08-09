import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission_5_story_app/config/state.dart';
import 'package:submission_5_story_app/providers/story_provider.dart';

class DetailStoryScreen extends StatelessWidget {
  final String id;
  const DetailStoryScreen({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ChangeNotifierProvider<StoryProvider>(
          create: (context) => StoryProvider()..fetchDetail(id),
          child: Consumer<StoryProvider>(
            builder: (context, provider, child) {
              if (provider.state == ProviderState.loading) {
                return const Center(
                  child: CircularProgressIndicator()
                );
              } else if (provider.state == ProviderState.success) {
                return Column(
                  children: [
                    FadeInImage.assetNetwork(
                      placeholder: 'assets/loading.gif',
                      image: provider.result?.photoUrl
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                child: const Icon(Icons.favorite_border_outlined),
                                onTap: () {
      
                                },
                              ),
                              const SizedBox(width: 5),
                              GestureDetector(
                                child: const Icon(Icons.mode_comment_outlined),
                                onTap: () {
      
                                },
                              ),
                              const SizedBox(width: 5),
                              GestureDetector(
                                child: const Icon(Icons.share),
                                onTap: () {
      
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Row(
                            children: [
                              Text(
                                '100', 
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                )
                              ),
                              SizedBox(width: 5),
                              Text('likes')
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey[300],
                                child: const Icon(Icons.account_circle_outlined),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                provider.result.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(provider.result.description),
                          const SizedBox(height: 10),
                          Text(provider.result.createdAt),
                        ],
                      ),
                    )
                  ],
                );
              } else {
                return const Center(
                  child: Text('Ooops, something went error')
                );
              }
            },
          ),
        ),
      )
    );
  }
}