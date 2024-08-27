import 'package:bloc/bloc.dart';
import 'package:example_test/src/data/repository/post_list_repository.dart';
import 'package:example_test/src/model/post_list_model.dart';
import 'package:meta/meta.dart';

part 'post_list_event.dart';
part 'post_list_state.dart';

class PostListBloc extends Bloc<PostListEvent, PostListState> {
  final IPostListRepository postListRepository;
  PostListBloc({required this.postListRepository}) : super(PostListLoading()) {
    on<PostListEvent>((event, emit) async {
      if (event is PostListStarted) {
        try {
          emit(PostListLoading());
          final postLists = await postListRepository.getPostList();
          emit(PostListSuccess(posts: postLists));
        } catch (e) {
          emit(PostListError(error: e.toString()));
        }
      }
    });
  }
}
