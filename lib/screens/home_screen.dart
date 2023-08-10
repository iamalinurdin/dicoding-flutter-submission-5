import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:submission_5_story_app/config/state.dart';
import 'package:submission_5_story_app/providers/auth_provider.dart';
import 'package:submission_5_story_app/providers/story_provider.dart';
import 'package:submission_5_story_app/widgets/story_card.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  const HomeScreen({super.key, required this.title});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () => context.push('/posting'), 
            icon: const Icon(Icons.add_a_photo_outlined)
          ),
          IconButton(
            onPressed: () {
              final provider = context.read<AuthProvider>();

              provider.logout();

              if (provider.state == ProviderState.success) {
                context.push('/login');
              }
            }, 
            icon: const Icon(Icons.logout)
          )
        ],
      ),
      body: ChangeNotifierProvider<StoryProvider>(
        create: (context) => StoryProvider()..fetchStory(),
        child: Consumer<StoryProvider>(
          builder: (context, provider, child) {
            if (provider.state == ProviderState.loading) {
              return const Center(
                child: CircularProgressIndicator()
              );
            } else if (provider.state == ProviderState.success) {
              return ListView.builder(
                itemCount: provider.result.length,
                itemBuilder: (context, index) {
                  // return Text('index');
                  return Container(
                    margin: const EdgeInsets.only(bottom: 50),
                    child: StoryCard(
                      story: provider.result[index]
                    )
                  );
                },
              );
            } else {
              return const Center(
                child: Text('Ooops, something went error')
              );
            }

          },
        ),
      ),
    );
  }
}