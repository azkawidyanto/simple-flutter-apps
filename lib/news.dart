// import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dio/dio.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class News {
  // save json data inside this
  List<ArticleModel> datatobesavedin = [];

  Future<List> getNews() async {
    Dio dio = new Dio();
    const url =
        'https://newsdata.io/api/1/news?apikey=pub_1703d15513814134813479a3a17d8310e2ba';
    final response = await dio.get(url);
    var jsonData = jsonDecode(response.data);
    return jsonData;
  }
}

class ArticleModel {
  String? title;
  String? description;
  String? url;
  String? urlToImage;

  ArticleModel({this.title, this.description, this.url, this.urlToImage});
}

class _NewsPageState extends State<NewsPage> {
  // get our categories list

  // List<CategoryModel> categories = List<CategoryModel>();

  // get our newslist first

  // ignore: deprecated_member_use
  List<ArticleModel> articles = <ArticleModel>[];
  bool _loading = true;

  getNews() async {
    News newsdata = News();
    // await newsdata.getNews();
    articles = newsdata.getNews() as List<ArticleModel>;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    // categories = getCategories();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment
              .center, // this is to bring the row text in center
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

      // category widgets
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
                        shrinkWrap: true, // add this otherwise an error
                        itemBuilder: (context, index) {
                          return NewsTemplate(
                            urlToImage: articles[index].urlToImage,
                            title: articles[index].title,
                            description: articles[index].description,
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

// creating template for news

// ignore: must_be_immutable
class NewsTemplate extends StatelessWidget {
  String? title, description, url, urlToImage;
  NewsTemplate({this.title, this.description, this.urlToImage, this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          ClipRRect(borderRadius: BorderRadius.circular(6)),
          SizedBox(height: 8),
          Text(
            title!,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Colors.black),
          ),
          SizedBox(height: 8),
          Text(
            description!,
            style: TextStyle(fontSize: 15.0, color: Colors.grey[800]),
          ),
        ],
      ),
    );
  }
}
