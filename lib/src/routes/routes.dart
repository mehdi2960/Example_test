
import 'package:example_test/src/featurs/post_list_screen/post_list_screen.dart';
import 'package:example_test/src/routes/route_path.dart';
import 'package:flutter/material.dart';



Map<String, Widget Function(BuildContext)> routes = {
  // RoutePath.root: (context) => const SendSmsScreen(),
  RoutePath.postList: (context) =>  const PostListScreen(),
};
