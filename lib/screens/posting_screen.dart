import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:submission_5_story_app/providers/file_provider.dart';

class PostingScreen extends StatefulWidget {
  const PostingScreen({super.key});

  @override
  State<PostingScreen> createState() => _PostingScreenState();
}

class _PostingScreenState extends State<PostingScreen> {
  _onGalleryView() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      print(pickedFile);
    }
  }

  _onCameraView() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.camera);
    final imageProvider = context.read<FileProvider>();

    if (pickedFile != null) {
      imageProvider.setImageFile(pickedFile);
      imageProvider.setImagePath(pickedFile.path);
    }
  }

  Widget _showImage() {
    final imagePath = context.read<FileProvider>().imagePath;

    return kIsWeb 
      ? Image.network(
        imagePath.toString(),
        fit: BoxFit.contain,
      )
      : Image.file(
        File(imagePath.toString()),
        fit: BoxFit.contain,
      );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print('ok');

        context.go('/');

        return true;
      },
      child: Scaffold(
        body: SafeArea(
          minimum: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: context.watch<FileProvider>().imagePath == null ? 
                const Align(
                  child: Icon(
                    Icons.image,
                    size: 200,
                  ),
                ) : _showImage()
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => _onCameraView(), 
                    child: const Text('Camera')
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () => _onGalleryView(), 
                    child: const Text('Gallery')
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none
                  )
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {}, 
                child: const Text('Upload')
              )
            ],
          ),
        ),
      ),
    );
  }
}