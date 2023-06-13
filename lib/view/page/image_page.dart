import 'dart:math';
import 'package:flutter/material.dart';
import 'package:nasa_information_app/view/widget/drawer_widget.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  final random = Random();
  final imagePaths = [
    'lib/assets/images/img1.jpg',
    'lib/assets/images/img2.jpg',
    'lib/assets/images/img3.jpg',
    'lib/assets/images/img4.jpg',
    'lib/assets/images/img5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Page'),
      ),
      drawer: const DrawerWidget(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Image.asset(
                imagePaths[random.nextInt(imagePaths.length)],
                fit: BoxFit.cover,
              ),
            ),
            const Text(
              '',
            ),
          ],
        ),
      ),
    );
  }
}
