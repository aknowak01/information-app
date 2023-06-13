import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_information_app/bloc/cubit/moon_cubit.dart';
import 'package:nasa_information_app/infra/service/moon_service.dart';
import 'package:nasa_information_app/view/widget/drawer_widget.dart';
import 'package:nasa_information_app/view/widget/moon_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocProvider(
        create: (context) => MoonCubit(MoonService()),
        child: const MoonWidget(),
      ),
      drawer: const DrawerWidget(),
    );
  }
}
