import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:post_fetcher_project/logic/PostBloc/post_bloc.dart';
import 'package:post_fetcher_project/utils/onGenerateRoutes.dart';

import 'data/DataProviders/PostApi.dart';
import 'data/Repositories/PostRepository.dart';

void main() async {
  //section of native code checker
  WidgetsFlutterBinding.ensureInitialized();
  //save data
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  //run application section
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => PostRepository(
            postApi: GetPosts(),
          ),
        ),
      ],
      child: Builder(
        builder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => PostBloc(
                postRepository: RepositoryProvider.of<PostRepository>(context),
              ),
            ),
          ],
          child: MaterialApp(
            onGenerateRoute: ApplicationRoutes.onGenerateRoutes,
          ),
        ),
      ),
    );
  }
}
