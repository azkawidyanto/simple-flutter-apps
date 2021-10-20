import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql/client.dart';

void apigraphql() async {
  await initHiveForFlutter();
  final HttpLink httpLink = HttpLink(
    'https://api.github.com/graphql',
  );

  final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer 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',
    // OR
    // getToken: () => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
  );
  Link link = authLink.concat(httpLink);

  // if (websocketEndpoint != null) {
  //   final _wsLink = WebSocketLink(websockeEndpoint);
  //   link = Link.split((request) => request.isSubscription, _wsLink, link);
  // }

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      // cache: InMemoryCache(),
      // link: HttpLink(uri: 'http://10.0.2.2:3000'),
      cache: GraphQLCache(),
      link: link,
      // The default store is the InMemoryStore, which does NOT persist to disk
      // store: GraphQLCache(store: HiveStore()),
    ),
  );
  final String getTasksQuery = """
        query {
          allFilms {
            films {
              title
              producers
            }
          }
        }
        """;

  const int nRepositories = 50;

  final QueryOptions options = QueryOptions(
    document: gql(getTasksQuery),
    variables: <String, dynamic>{
      'nRepositories': nRepositories,
    },
  );
  // final QueryResult result = await client.query(options);

  // if (result.hasException) {
  //   print(result.exception.toString());
  // }
}
