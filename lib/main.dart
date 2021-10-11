import 'package:flutter/material.dart';
import 'film.dart' as film;
import 'about.dart' as about;
import 'news.dart' as news;
// Uncomment lines 7 and 10 to view the visual layout at runtime.
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

// void main() {
//   // debugPaintSizeEnabled = true;
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Widget titleSection = Container(
//       padding: const EdgeInsets.all(40),
//       child: Row(
//         children: [
//           Expanded(
//             /*1*/
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 /*2*/
//                 Container(
//                   padding: const EdgeInsets.only(bottom: 8),
//                   child: const Text(
//                     'Oeschinen Lake Campground',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 Text(
//                   'Kandersteg, Switzerland',
//                   style: TextStyle(
//                     color: Colors.grey[500],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           /*3*/
//           Icon(
//             Icons.star,
//             color: Colors.red[500],
//           ),
//           const Text('41'),
//         ],
//       ),
//     );

//     Color color = Theme.of(context).primaryColor;

//     Widget buttonSection = Row(
//       // crossAxisAlignment: CrossAxisAlignment.end,
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,

//       children: [
//         _buildButtonColumn(color, Icons.call, 'News'),
//         _buildButtonColumn(color, Icons.near_me, 'Film'),
//         _buildButtonColumn(color, Icons.share, 'About'),
//       ],
//     );

//     Widget textSection = const Padding(
//       padding: EdgeInsets.all(32),
//       child: Text(
//         'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
//         'Alps. Situated 1,578 meters above sea level, it is one of the '
//         'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
//         'half-hour walk through pastures and pine forest, leads you to the '
//         'lake, which warms to 20 degrees Celsius in the summer. Activities '
//         'enjoyed here include rowing, and riding the summer toboggan run.',
//         softWrap: true,
//       ),
//     );

//     return MaterialApp(
//       title: 'Flutter layout demo',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Flutter layout demo'),
//         ),
//         body: ListView(
//           // crossAxisCount: 1,
//           children: [
//             Image.asset(
//               'assets/lake.jpg',
//               width: 600,
//               height: 240,
//               fit: BoxFit.cover,
//             ),
//             titleSection,
//             buttonSection,
//             textSection,
//           ],
//         ),
//       ),
//     );
//   }

//   Column _buildButtonColumn(Color color, IconData icon, String label) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Icon(icon, color: color),
//         Container(
//           margin: const EdgeInsets.only(top: 8, bottom: 20),
//           child: Text(
//             label,
//             style: TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.w400,
//               color: color,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

void main() => runApp(
      MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const MyApp(),
          '/news': (context) => const news.NewsApp(),
          '/movie': (context) => const film.FilmApp(),
          '/about': (context) => const about.AboutApp(),
        },
      ),
    );

class MyApp extends StatelessWidget {
  // sampleFunction() {
  //   print('Function on Click Event Called.');
  //   // Put your code here, which you want to execute on onPress event.
  // }

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
                  child: Text(" News Page "),
                  onPressed: () {
                    Navigator.pushNamed(context, '/news');
                  },
                  // color: Colors.red,
                  // textColor: Colors.white,
                  // splashColor: Colors.grey,
                  // padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                ),
                ElevatedButton(
                  child: Text("Movie Page "),
                  onPressed: () {
                    Navigator.pushNamed(context, '/movie');
                  },
                  // color: Colors.red,
                  // textColor: Colors.white,
                  // splashColor: Colors.grey,
                  // padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                ),
                ElevatedButton(
                  child: Text(" About "),
                  onPressed: () {
                    Navigator.pushNamed(context, '/about');
                  },
                  // color: Colors.red,
                  // textColor: Colors.white,
                  // splashColor: Colors.grey,
                  // padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                )
              ],
            ))));
  }
}
