import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_fetcher_project/logic/PostBloc/post_bloc.dart';

class PostScreen extends StatelessWidget {
  static const String ScreenRoute = "/PostScreen";
  const PostScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PostBloc>(context).add(FetchPosts());
    return BlocBuilder<PostBloc, PostState>(builder: (context, state) {
      if (state is LoadingPosts) {
        return Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      } else if (state is LoadedPosts) {
        return Scaffold(
            body: RefreshIndicator(
          onRefresh: () {
            BlocProvider.of<PostBloc>(context).add(FetchPosts());
            return Future.value();
          },
          child: ListView.builder(
            itemCount: state.dataRaw.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(state.dataRaw[index].id.toString()),
                  ),
                  tileColor: Colors.yellow,
                  title: Text(state.dataRaw[index].title),
                ),
              ),
            ),
          ),
        ));
      } else if (state is ErrorFetchPosts) {
        return Scaffold(
          body: Center(child: Text(state.message)),
        );
      }
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    });
  }
}
