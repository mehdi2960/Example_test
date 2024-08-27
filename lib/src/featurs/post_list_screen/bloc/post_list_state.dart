part of 'post_list_bloc.dart';

@immutable
sealed class PostListState {}

// final class PostListInitial extends PostListState {}


final class PostListLoading extends PostListState {}

final class PostListSuccess extends PostListState {
  final List<PostListModel> posts;

  PostListSuccess({required this.posts});
}

final class PostListError extends PostListState {
  final String error;

  PostListError({required this.error});
}
