import 'package:flutter/material.dart';
import 'film.dart' as film;
import 'about.dart' as about;
import 'news.dart' as news;
import 'dart:io';

void main() => runApp(
      MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const MyApp(),
          '/news': (context) => news.NewsPage(),
          '/movie': (context) => const film.FilmApp(),
          '/about': (context) => const about.AboutApp(),
        },
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Home Page'),
            ),
            body: Center(
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
            ))));
  }
}
