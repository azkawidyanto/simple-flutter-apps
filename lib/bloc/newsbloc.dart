// ignore_for_file: non_constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';

import 'dart:async';

import 'package:layout/news.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();
}

class FetchNews extends NewsEvent {
  const FetchNews();

  @override
  List<Object> get props => [];
}

class NewsRepository {
  final News NewsApiClient;

  NewsRepository({required this.NewsApiClient});

  Future<List<ArticleModel>> getNews() async {
    return await NewsApiClient.getNews();
  }
}

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsEmpty extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final News NewsAPI;

  const NewsLoaded({required this.NewsAPI});

  @override
  List<Object> get props => [News];
}

class NewsError extends NewsState {}

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository? repo;
  NewsBloc({required this.repo})
      : assert(repo != null),
        super(NewsEmpty());

  NewsState get initialState => NewsEmpty();

  // NewsBloc() : super(NewsInitial()) {
  //   on<NewsEvent>((event, emit) {
  //     // TODO: implement event handler
  //   });
  // }
  Stream<NewsState> mapEventtoState(NewsEvent event) async* {
    if (event is FetchNews) {
      yield NewsLoading();
      try {
        final List<ArticleModel>? news = await repo!.getNews();
        yield NewsLoaded(NewsAPI: News());
      } catch (error) {
        yield NewsError();
      }
    }
  }
}
