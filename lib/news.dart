// // import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
// import 'package:sqflite/sqflite.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class News {
  // save json data inside this

  Future<bool> getNews() async {
    List<ArticleModel> datatobesavedin = [];
    Dio dio = new Dio();
    const url =
        'https://newsdata.io/api/1/news?apikey=pub_1703d15513814134813479a3a17d8310e2ba';
    Response response = await dio.get(url);
    print(response.data);
    response.data.forEach((data) {
      ArticleModel news = ArticleModel.fromMap(data.results);
      datatobesavedin.add(news);
    });
    return true;
  }
}

class ArticleModel {
  String? title,
      keywords,
      creator,
      pubDate,
      videoUrl,
      description,
      content,
      imageUrl;

  ArticleModel(
      {this.title,
      this.keywords,
      this.creator,
      this.pubDate,
      this.videoUrl,
      this.description,
      this.content,
      this.imageUrl});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'keywords': keywords,
      'creator': creator,
      'pub_date': pubDate,
      'video_url': videoUrl,
      'descrription': description,
      'content': content,
      'image_url': imageUrl
    };
  }

  factory ArticleModel.fromMap(Map<String, dynamic> map) {
    return ArticleModel(
        title: map['title'],
        keywords: map['keywrds'],
        creator: map['creator'],
        pubDate: map['pub_date'],
        videoUrl: map['video_url'],
        description: map['description'],
        content: map['content'],
        imageUrl: map['image_url']);
  }

  String toJson() => json.encode(toMap());

  factory ArticleModel.fromJson(String source) =>
      ArticleModel.fromMap(json.decode(source));
}

class _NewsPageState extends State<NewsPage> {
  List<ArticleModel> articles = <ArticleModel>[];
  bool _loading = true;

  getNews() async {
    News newsdata = News();
    articles = await newsdata.getNews() as List<ArticleModel>;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Flutter ",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.blueAccent),
            ),
          ],
        ),
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: ListView.builder(
                        itemCount: articles.length,
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return NewsTemplate(
                            title: articles[index].title,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class NewsTemplate extends StatefulWidget {
  final String? title;
  NewsTemplate({this.title});

  @override
  State<NewsTemplate> createState() => _NewsTemplateState();
}

class _NewsTemplateState extends State<NewsTemplate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          ClipRRect(borderRadius: BorderRadius.circular(6)),
          SizedBox(height: 8),
          Text(
            widget.title!,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Colors.black),
          ),
        ],
      ),
    );
  }
}
