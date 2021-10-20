import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class FilmApp extends StatelessWidget {
  const FilmApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(40),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41'),
        ],
      ),
    );

    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

    return GraphQLProvider(
        // client: client,
        child: MaterialApp(
      title: 'Movie Page',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Movie Page'),
        ),
        body: ListView(
          // crossAxisCount: 1,
          children: [
            titleSection,
            textSection,
          ],
        ),
      ),
    ));
  }
}
