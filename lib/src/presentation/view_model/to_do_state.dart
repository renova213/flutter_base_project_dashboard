import 'package:dashboard/src/domain/entity/todo_entity.dart';
import 'package:dependencies/dependencies.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object?> get props => [];
}

/// initial / idle
class TodoInitial extends TodoState {
  const TodoInitial();
}

/// loading
class TodoLoading extends TodoState {
  const TodoLoading();
}

/// success
class TodoLoaded extends TodoState {
  final TodoEntity todo;

  const TodoLoaded(this.todo);

  @override
  List<Object?> get props => [todo];
}

/// error
class TodoError extends TodoState {
  final String message;

  const TodoError(this.message);

  @override
  List<Object?> get props => [message];
}
