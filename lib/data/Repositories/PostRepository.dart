import 'package:post_fetcher_project/data/DataProviders/PostApi.dart';
import 'package:post_fetcher_project/data/models/Post.dart';

class PostRepository {
  final PostApi postApi;

  PostRepository({this.postApi});

  Future<List<Posts>> getDataRaw() async {
    List<Posts> data = await postApi.getPosts();
    return data;
  }
}
