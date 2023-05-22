// import 'package:flutter/cupertino.dart';
//
//
// import '../domain/api_clients/api_client.dart';
// import '../post.dart';
//
// class ExampleWidgetModel extends ChangeNotifier {
//   final apiClient = ApiClient();
//
//   var _posts = <Post>[];
//
//   List<Post> get posts => _posts;
//
//   Future<void> reloadPosts() async {
//     final posts = await apiClient.getPosts();
//     _posts += posts;
//     notifyListeners();
//   }
//
//   Future<void> createPosts() async {
//     final posts = await apiClient.createPost(
//       title: 'балдёжный заголовок',
//       body: 'стол',
//     );
//   }
// }
//
// class ExampleModelProvider extends InheritedNotifier {
//   final ExampleWidgetModel model;
//
//   const ExampleModelProvider({
//     required this.model,
//     Key? key,
//     required Widget child,
//   }) : super(
//           key: key,
//           notifier: model,
//           child: child,
//         );
//
//   static ExampleModelProvider? watch(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<ExampleModelProvider>();
//   }
//
//   static ExampleModelProvider? read(BuildContext context) {
//     final widget = context
//         .getElementForInheritedWidgetOfExactType<ExampleModelProvider>()
//         ?.widget;
//     return widget is ExampleModelProvider ? widget : null;
//   }
// }
