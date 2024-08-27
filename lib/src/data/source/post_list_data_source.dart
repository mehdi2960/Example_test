import 'package:dio/dio.dart';
import 'package:example_test/src/model/post_list_model.dart';

abstract class IPostListDataSource {
  Future<List<PostListModel>> getPostList();
}

class PostListRemoteDataSource implements IPostListDataSource {
  final Dio httpClient;

  PostListRemoteDataSource(this.httpClient);
  @override
  Future<List<PostListModel>> getPostList() async {
    final response =
        await httpClient.get('https://jsonplaceholder.typicode.com/posts');
    final List<PostListModel> postLists = [];
    (response.data as List).forEach((element) {
      postLists.add(PostListModel.fromJson(element));
    });
    return postLists;
  }
}
