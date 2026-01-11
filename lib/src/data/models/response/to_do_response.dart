import 'package:dashboard/src/domain/entity/todo_entity.dart';
import 'package:dependencies/dependencies.dart';

class TodoModel extends Equatable {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  const TodoModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );
  }

  TodoEntity toEntity() {
    return TodoEntity(id: id, title: title, completed: completed);
  }

  @override
  List<Object?> get props => [userId, id, title, completed];
}
