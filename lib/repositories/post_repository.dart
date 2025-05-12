import '../models/post.dart';
import '../services/api_service.dart';

class PostRepository {
  final ApiService _apiService;

  PostRepository({ApiService? apiService})
      : _apiService = apiService ?? ApiService();

  Future<List<Post>> getPosts() async {
     await Future.delayed(const Duration(seconds: 1)); // Имитация задержки
  return [
    Post(userId: 1, id: 1, title: 'Тестовый заголовок', body: 'Тестовое содержимое'),
    Post(userId: 1, id: 2, title: 'Второй пост', body: 'Ещё один пример'),
  ];
  }
}