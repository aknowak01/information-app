import 'package:flutter/material.dart';

class SearchingBarWidget extends StatelessWidget {
  const SearchingBarWidget({Key? key, required String hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Search',
      ),
    );
  }
}
