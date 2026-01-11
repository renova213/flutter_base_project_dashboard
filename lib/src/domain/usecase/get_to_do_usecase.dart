import 'package:core/core.dart';
import 'package:dashboard/src/domain/entity/todo_entity.dart';
import 'package:dashboard/src/domain/repository/dashboard_repository.dart';

class GetToDoUsecase implements UseCase<TodoEntity, NoParams> {
  final DashboardRepository repository;

  GetToDoUsecase(this.repository);

  @override
  Future<Either<AppError, TodoEntity>> call(NoParams params) {
    return repository.getToDo();
  }
}
