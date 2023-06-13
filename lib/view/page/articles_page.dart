import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_information_app/bloc/cubit/articles_cubit.dart';
import 'package:nasa_information_app/bloc/cubit/articles_state.dart';
import 'package:nasa_information_app/view/widget/drawer_widget.dart';

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({Key? key}) : super(key: key);

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  ArticlesCubit articlesCubit = ArticlesCubit();

  @override
  void initState() {
    super.initState();
    articlesCubit.getArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Articles Page'),
      ),
      drawer: const DrawerWidget(),
      body: Center(
        child: BlocBuilder<ArticlesCubit, ArticlesState>(
          bloc: articlesCubit,
          builder: (BuildContext context, ArticlesState state) {
            if (state is ArticlesLoading) {
              return const Center(child: CupertinoActivityIndicator());
            } else if (state is ArticlesLoaded) {
              return ListView.builder(
                  itemCount: state.articles.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.articles[index].title,
                          style: const TextStyle(color: Colors.cyan)),
                      minLeadingWidth: 50,
                      minVerticalPadding: 15,
                      subtitle: Text(
                        state.articles[index].text,
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.end,
                        textDirection: TextDirection.rtl,
                      ),
                    );
                  });
            } else if (state is ArticlesError) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return const Text('Error - unknown state');
            }
          },
        ),
      ),
    );
  }
}
