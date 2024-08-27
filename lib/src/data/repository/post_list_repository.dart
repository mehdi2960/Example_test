import 'package:example_test/src/common/http_client.dart';
import 'package:example_test/src/data/source/post_list_data_source.dart';
import 'package:example_test/src/model/post_list_model.dart';

final postListRepository =
    PostListRepository(PostListRemoteDataSource(httpClient));

abstract class IPostListRepository {
  Future<List<PostListModel>> getPostList();
}

class PostListRepository implements IPostListRepository {
  final IPostListDataSource dataSource;

  PostListRepository(this.dataSource);

  @override
  Future<List<PostListModel>> getPostList() {
    return dataSource.getPostList();
  }
}
