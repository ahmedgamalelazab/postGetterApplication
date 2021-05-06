import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:post_fetcher_project/data/Repositories/PostRepository.dart';
import 'package:post_fetcher_project/data/models/Post.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;
  PostBloc({this.postRepository}) : super(InitialPostsState());

  @override
  Stream<PostState> mapEventToState(
    PostEvent event,
  ) async* {
    //dispatching events
    if (event is FetchPosts) {
      yield LoadingPosts(); //emitting loading in a stream PipeLine
      try {
        List<Posts> dataRaw = await postRepository.getDataRaw();
        yield LoadedPosts(dataRaw: dataRaw);
      } catch (error) {
        yield ErrorFetchPosts(message: error.toString());
      }
    }
  }
}
