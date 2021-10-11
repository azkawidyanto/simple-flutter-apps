import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:convert';
// Uncomment lines 7 and 10 to view the visual layout at runtime.
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

// void main() {
//   // debugPaintSizeEnabled = true;
//   runApp(const NewsApp());
// }

fetchNews() async {
  var dio = Dio();
  Response response = await dio.get(
      'https://newsdata.io/api/1/news?apikey=pub_1703d15513814134813479a3a17d8310e2ba');
  // return response;
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return News.fromJson(jsonDecode(response.data));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load news');
  }
}

class News {
  // final int userId;
  // final int id;
  final String title;

  News({
    // required this.userId,
    // required this.id,
    required this.title,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      // userId: json['userId'],
      // id: json['id'],
      title: json['title'],
    );
  }
}

class NewsApp extends StatefulWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  _NewsAppState createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  var futureNews;

  @override
  void initState() {
    super.initState();
    futureNews = fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<News>(
            future: futureNews,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.title);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
