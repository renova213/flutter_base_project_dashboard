import 'package:dashboard/src/data/models/response/to_do_response.dart';

abstract class DashboardRemoteDatasource {
  Future<TodoModel> getToDo();
}
