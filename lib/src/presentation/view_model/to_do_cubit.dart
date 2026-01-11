import 'package:dependencies/dependencies.dart';
import 'package:core/core.dart';
import 'package:dashboard/src/domain/usecase/get_to_do_usecase.dart';
import 'to_do_state.dart';

class ToDoCubit extends Cubit<TodoState> {
  final GetToDoUsecase getDashboardTodo;

  ToDoCubit(this.getDashboardTodo) : super(const TodoInitial());

  Future<void> loadTodo() async {
    emit(const TodoLoading());

    final result = await getDashboardTodo(const NoParams());

    result.fold(
      (error) => emit(TodoError(error.message)),
      (todo) => emit(TodoLoaded(todo)),
    );
  }
}
