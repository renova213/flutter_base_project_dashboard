import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:dashboard/src/data/datasources/dashboard_remote_datasource.dart';
import 'package:dashboard/src/data/models/response/to_do_response.dart';

class DashboardRemoteDatasourceImpl implements DashboardRemoteDatasource {
  final ApiService apiService;

  DashboardRemoteDatasourceImpl(this.apiService);

  @override
  Future<TodoModel> getToDo() async {
    try {
      final response = await apiService.dio.get('/todos/1');
      return TodoModel.fromJson(response.data);
    } on DioException catch (e) {
      throw NetworkException(message: e.message ?? 'Unknown network error');
    }
  }
}
