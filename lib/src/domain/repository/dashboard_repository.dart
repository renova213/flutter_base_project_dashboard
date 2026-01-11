import 'package:core/core.dart';
import 'package:dashboard/src/domain/entity/todo_entity.dart';

abstract class DashboardRepository {
  Future<Either<AppError, TodoEntity>> getToDo();
}
