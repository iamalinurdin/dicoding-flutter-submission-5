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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // GestureDetector(
        //   onTap: () => context.push('/story/${story.id}'),
        //   child: Image.network(story.photoUrl),
        // ),
        Wrap(
          children: [
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () => context.push('/story/${story.id}'),
                child: const Icon(Icons.favorite_outline),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const Icon(Icons.comment_outlined),
            ),
            GestureDetector(
              onTap: () {},
              child: const Icon(Icons.share),
            ),
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {},
                child: const Icon(Icons.bookmark_outline),
              ),
            )
          ],
        ),
        Text(
          story.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14
          ),
        ),
        Text(story.description)
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