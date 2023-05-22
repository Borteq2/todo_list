import 'dart:convert';
import 'dart:io';

import '../../post.dart';

class ApiClient {
  final client = HttpClient();

  Future<List<Post>> getPosts() async {
    // final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    // // Uri(scheme: 'https', host: 'jsonplaceholder.typicode.com', path: 'posts',);
    // final request = await client.getUrl(url);
    // final responce = await request.close();
    // final jsonStrings = await responce.transform(utf8.decoder).toList();
    // final jsonString = jsonStrings.join();
    //
    // final json = jsonDecode(jsonString) as List<dynamic>;

    final json = await get('https://jsonplaceholder.typicode.com/posts')
        as List<dynamic>;

    final posts =
        json.map((e) => Post.fromJson(e as Map<String, dynamic>)).toList();
    return posts;
  }

  Future<Post?> createPost({
    required String title,
    required String body,
  }) async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final request = await client.postUrl(url);
    final parameters = <String, dynamic> {
      'title': title,
      'body': body,
      'userId': 109
    };

    request.headers.set('Content-Type', 'application/json; charset=UTF-8');
    request.write(jsonEncode(parameters));
    final response = await request.close();
    final jsonStrings = await response.transform(utf8.decoder).toList();
    final jsonString = jsonStrings.join();
    final json = jsonDecode(jsonString) as Map<String, dynamic>;
    final post = Post.fromJson(json);
    return post;
  }

  Future<dynamic> get(ulr) async {
    final url = Uri.parse(ulr);

    // Uri(scheme: 'https', host: 'jsonplaceholder.typicode.com', path: 'posts',);
    final request = await client.getUrl(url);
    final response = await request.close();
    final jsonStrings = await response.transform(utf8.decoder).toList();
    final jsonString = jsonStrings.join();
    final dynamic json = jsonDecode(jsonString);
    return json;
  }


}
