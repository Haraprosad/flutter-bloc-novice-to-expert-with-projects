import 'package:equatable/equatable.dart';
import 'package:flutter_infinite_list/posts/models/post_model.dart';

abstract class PostState extends Equatable{
  @override
  List<Object?> get props => [];
}

class PostInitial extends PostState{}

class PostSuccess extends PostState{
  late final List<PostModel>? posts;
  late final bool hasReachedMax ;
  PostSuccess({required this.posts,required this.hasReachedMax});
  @override
  List<Object?> get props => [posts,hasReachedMax];
}

class PostFailure extends PostState{}
