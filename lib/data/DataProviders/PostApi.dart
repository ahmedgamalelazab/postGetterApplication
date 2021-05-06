import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/Post.dart';

abstract class PostApi {
  Future<List<Posts>> getPosts();
}

class GetPosts extends PostApi {
  @override
  Future<List<Posts>> getPosts() async {
    try {
      final postsUri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
      final response = await http.get(postsUri);
      final dataRaw = json.decode(response.body).cast<Map<String, dynamic>>();
      return dataRaw.map<Posts>((item) => Posts.fromJson(item)).toList();
    } catch (error) {
      throw Exception("can't get data raw from post url");
    }
  }
}
