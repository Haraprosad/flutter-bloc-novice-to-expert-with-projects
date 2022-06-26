import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_infinite_list/posts/bloc/post_bloc.dart';
import 'package:flutter_infinite_list/posts/bloc/post_event.dart';
import 'package:flutter_infinite_list/posts/bloc/post_state.dart';
import 'package:flutter_infinite_list/posts/posts.dart';
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_)=>PostBloc()..add(PostFetched()),
        child: PostsList(),
      ),
    );
  }
}

