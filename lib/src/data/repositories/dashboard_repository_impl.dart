import 'package:core/core.dart';
import 'package:dashboard/src/data/datasources/dashboard_remote_datasource.dart';
import 'package:dashboard/src/domain/entity/todo_entity.dart';
import 'package:dashboard/src/domain/repository/dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDatasource remoteDatasource;

  DashboardRepositoryImpl(this.remoteDatasource);

  @override
  Future<Either<AppError, TodoEntity>> getToDo() {
    return safeApiCall(() async {
      final model = await remoteDatasource.getToDo();
      return model.toEntity();
    });
  }
}
