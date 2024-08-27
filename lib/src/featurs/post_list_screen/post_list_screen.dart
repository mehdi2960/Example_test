import 'dart:developer';

import 'package:example_test/src/data/repository/post_list_repository.dart';
import 'package:example_test/src/featurs/post_list_screen/bloc/post_list_bloc.dart';
import 'package:example_test/src/shared_widgets/custom_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostListScreen extends StatelessWidget {
  const PostListScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final postListBloc =
            PostListBloc(postListRepository: postListRepository);

        postListBloc.add(PostListStarted());
        return postListBloc;
      },
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<PostListBloc, PostListState>(
          builder: (context, state) {
            log('Current state: $state');
            if (state is PostListLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PostListSuccess) {
              return SizedBox(
                height: 1000,
                child: ListView.builder(
                  itemCount: state.posts.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CustomAnimation(
                        index: index,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 10, 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.blue.shade300,
                                      borderRadius:
                                          BorderRadius.circular(1000)),
                                  child: Text(
                                    state.posts[index].id.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 7),
                                Text(
                                  state.posts[index].title!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  state.posts[index].body!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            } else if (state is PostListError) {
              return Center(child: Text(state.error));
            } else {
              log('Unknown state: $state');
              return const Center(child: Text('Unknown state encountered'));
            }
          },
        ),
      ),
    );
  }
}
