import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_infinite_list/posts/bloc/post_bloc.dart';
import 'package:flutter_infinite_list/posts/bloc/post_event.dart';
import 'package:flutter_infinite_list/posts/bloc/post_state.dart';
import 'package:flutter_infinite_list/posts/widgets/bottomloader.dart';
import 'package:flutter_infinite_list/posts/widgets/postlistitem.dart';

class PostsList extends StatefulWidget {
  @override
  _PostsListState createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        if(state is PostFailure){
          return const Center(child: Text('failed to fetch posts'));
        }
        else if (state is PostSuccess){
          if(state.posts==null){
          return const Center(child: Text('no posts'));
          }
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return index >= state.posts!.length
                  ? BottomLoader()
                  : PostListItem(post: state.posts![index]);
            },
            itemCount: state.hasReachedMax
                ? state.posts!.length
                : state.posts!.length + 1,
            controller: _scrollController,
          );
        }
        else{
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<PostBloc>().add(PostFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
