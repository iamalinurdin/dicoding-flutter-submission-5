import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:submission_5_story_app/providers/story_provider.dart';
import 'package:submission_5_story_app/widgets/story_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<StoryProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
            actions: [
              IconButton(
                onPressed: () => context.push('/posting'), 
                icon: const Icon(Icons.add_a_photo)
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: ListView.builder(
              itemCount: provider.result.length,
              itemBuilder: (context, index) {
                return StoryCard(story: provider.result[index]);
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => context.push('/posting'),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );
      },
    );
  }
}