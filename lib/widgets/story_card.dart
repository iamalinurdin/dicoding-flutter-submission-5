import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset('assets/image.jpg'),
        Wrap(
          children: [
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {},
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
        const Text(
          'username',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14
          ),
        ),
        const Text('Long caption writted here. you can write very long caption.')
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