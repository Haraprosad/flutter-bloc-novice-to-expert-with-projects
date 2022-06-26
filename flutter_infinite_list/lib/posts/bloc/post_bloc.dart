
import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_infinite_list/posts/bloc/post_event.dart';
import 'package:flutter_infinite_list/posts/bloc/post_state.dart';
import 'package:flutter_infinite_list/posts/models/post_model.dart';
import 'package:stream_transform/stream_transform.dart';


const _postLimit = 10;
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class PostBloc extends Bloc<PostEvent,PostState>{
  PostBloc() : super(PostInitial()){
    on<PostFetched>(_postFetched,
      transformer: throttleDroppable(throttleDuration),);
  }
  FutureOr<void> _postFetched(PostFetched event, Emitter<PostState> emit) async{
    // emit(PostInitial());
      try {
      var res = await Dio().get(
          'https://jsonplaceholder.typicode.com/posts?_start=0&_limit=$_postLimit',options: Options(responseType: ResponseType.plain));
      var decodedRes = postModelFromJson(res.data);
       print(decodedRes);
      emit(PostSuccess(posts: decodedRes,hasReachedMax: false));
    }catch (e){
      emit(PostFailure());
    }
  }
}