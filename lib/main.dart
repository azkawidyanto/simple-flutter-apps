import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'film.dart' as film;
import 'about.dart' as about;
import 'news.dart' as news;
import 'dart:io';
import 'bloc/bloc.dart';

void main() {
  final NewsRepository repository = NewsRepository(
    NewsApiClient: news.News(),
  );
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MyApp(
              repository: repository,
            ),
        '/news': (context) => news.NewsPage(),
        '/movie': (context) => film.Film(),
        '/about': (context) => const about.AboutApp(),
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.repository}) : super(key: key);
  final NewsRepository repository;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Home Page'),
            ),
            body: BlocProvider(
              create: (context) => NewsBloc(repo: repository),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: Text("News Page"),
                    onPressed: () {
                      Navigator.pushNamed(context, '/news');
                    },
                  ),
                  ElevatedButton(
                    child: Text("Movie Page"),
                    onPressed: () {
                      Navigator.pushNamed(context, '/movie');
                    },
                  ),
                  ElevatedButton(
                    child: Text("About"),
                    onPressed: () {
                      Navigator.pushNamed(context, '/about');
                    },
                  ),
                  ElevatedButton(
                    child: Text("Quit"),
                    onPressed: () => exit(0),
                  )
                ],
              )),
            )));
  }
}
