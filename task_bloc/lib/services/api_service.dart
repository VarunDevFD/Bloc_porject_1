// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../../models/task.dart';

// const apiKey = "MTY5NzI0XzE3MjE0MTA4MjlfMmQ3NzY4ZjY1MWZlZDNhYzZhZmFlODJkMjY2NDk4NzAzNGMxNTU5Mw==";

// class ApiService {
//   final String baseUrl = 'https://api.yourvideoprovider.com/tasks'; // Replace with your actual base URL
  

//   Future<List<Video>> fetchVideos() async {
//     final response = await http.get(Uri.parse('$baseUrl/feed/?token=$apiKey'));

//     if (response.statusCode == 200) {
//       List<dynamic> data = jsonDecode(response.body)['response'];
//       return data.map((video) => Video.fromJson(video)).toList();
//     } else {
//       throw Exception('Failed to load videos');
//     }
//   }

//   Future<Task> createTask(Task task) async {
//     final response = await http.post(
//       Uri.parse(baseUrl),
//       headers: {
//         'Authorization': 'Bearer $accessToken',
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode(task.toJson()),
//     );

//     if (response.statusCode == 201) {
//       return Task.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to create task');
//     }
//   }
// }
