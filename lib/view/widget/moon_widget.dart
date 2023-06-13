import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_information_app/bloc/cubit/moon_cubit.dart';
import 'package:nasa_information_app/bloc/cubit/moon_state.dart';

class MoonWidget extends StatelessWidget {
  const MoonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MoonCubit, MoonState>(
      listener: (context, state) {
        if (state is MoonError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        return ListView(
          scrollDirection: Axis.vertical,
          children: [
            Image.asset('lib/assets/images/moon1.jpg'),
            if (state is MoonInitial)
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(33, 33, 33, 1)),
                  ),
                  onPressed: () => context.read<MoonCubit>().getRandomMoon(),
                  child: const Text('Load Random Moon Data'),
                ),
              ),
            if (state is MoonLoading)
              const Center(child: CircularProgressIndicator()),
            if (state is MoonLoaded)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Moon Phase: ${state.moon.name}',
                      style:
                          const TextStyle(color: Colors.white, fontSize: 15)),
                  Text('Date: ${state.moon.data}',
                      style:
                          const TextStyle(color: Colors.white, fontSize: 15)),
                  Text('Fact: ${state.moon.text}',
                      style:
                          const TextStyle(color: Colors.white, fontSize: 15)),
                  ElevatedButton(
                    style: ButtonStyle(
                      alignment: Alignment.center,
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(33, 33, 33, 1)),
                    ),
                    onPressed: () => context.read<MoonCubit>().getRandomMoon(),
                    child: const Text('Load Another Random Moon Data'),
                  ),
                ],
              ),
          ],
        );
      },
    );
  }
}
