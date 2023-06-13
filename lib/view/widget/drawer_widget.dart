import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_information_app/bloc/cubit/articles_cubit.dart';
import 'package:nasa_information_app/view/page/articles_page.dart';
import 'package:nasa_information_app/view/page/home_page.dart';
import 'package:nasa_information_app/view/page/image_page.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromRGBO(33, 33, 33, 1),
            ),
            child: Text(
              'Nasa Information app',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home Page'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(
                    title: "Moon View",
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.comment),
            // ignore: prefer_const_constructors
            title: Text('Articles'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return BlocProvider(
                  create: (context) => ArticlesCubit(),
                  child: const ArticlesPage(),
                );
              }));
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Random Image from Nasa'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ImagePage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
