part of 'post_bloc.dart';

@immutable
abstract class PostState {}

class InitialPostsState extends PostState {}

class LoadingPosts extends PostState {}

class LoadedPosts extends PostState {
  final List<Posts> dataRaw;

  LoadedPosts({this.dataRaw});
}

class ErrorFetchPosts extends PostState {
  final String message;

  ErrorFetchPosts({this.message});
}
