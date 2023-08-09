import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:submission_5_story_app/data/models/story.dart';

class StoryCard extends StatelessWidget {
  final Story story;

  // const StoryCard({super.key});

  const StoryCard({required this.story, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => context.push('/story/${story.id}'),
          child:  FadeInImage.assetNetwork(
            placeholder: 'assets/loading.gif',
            image: story.photoUrl
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                    story.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(story.description),
            ],
          ),
        ),
      ],
    );


    // return Container(
    //   decoration: BoxDecoration(
    //     border: Border.all(
    //       width: 2,
    //     ),
    //   ),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Image.asset('assets/image.jpg'),
    //       Row(
    //         children: [
    //           Icon(Icons.favorite_outline),
    //           Icon(Icons.comment_sharp)
    //         ],
    //       ),
    //       const Padding(
    //         padding: EdgeInsets.all(8),
    //         child: Column(
    //           children: [
    //             Text('User Name'),
    //             Text('Description'),
    //           ]
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}