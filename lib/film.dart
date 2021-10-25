import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Film extends StatefulWidget {
  final String? title;
  Film({this.title});

  @override
  State<Film> createState() => FilmApp();
}

class FilmApp extends State<Film> {
  // const FilmApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HttpLink link = HttpLink('https://rickandmortyapi.com/graphql');

    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        cache: GraphQLCache(),
        link: link,
      ),
    );
    String getTasksQuery = """
        query {
          allFilms {
            films {
              title
              producers
            }
          }
        }
        """;

    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        title: 'Movie Page',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Movie'),
          ),
          body: Query(
            options: QueryOptions(document: gql(getTasksQuery)),
            builder: (
              QueryResult result, {
              Future<QueryResult> Function(FetchMoreOptions)? fetchMore,
              Future<QueryResult?> Function()? refetch,
            }) {
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
