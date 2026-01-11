import 'package:dashboard/src/presentation/view/widgets/error_view.dart';
import 'package:dashboard/src/presentation/view/widgets/loading_view.dart';
import 'package:dashboard/src/presentation/view/widgets/todo_card.dart';
import 'package:dashboard/src/presentation/view_model/to_do_cubit.dart';
import 'package:dashboard/src/presentation/view_model/to_do_state.dart';
import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard'), centerTitle: true),
      body: BlocBuilder<ToDoCubit, TodoState>(
        builder: (context, state) {
          if (state is TodoLoading) {
            return const LoadingView();
          }

          if (state is TodoError) {
            return ErrorView(
              message: state.message,
              onRetry: () => context.read<ToDoCubit>().loadTodo(),
            );
          }

          if (state is TodoLoaded) {
            return TodoCard(
              todoId: state.todo.id,
              title: state.todo.title,
              completed: state.todo.completed,
            );
          }

          return Center(
            child: ElevatedButton(
              onPressed: () => context.read<ToDoCubit>().loadTodo(),
              child: const Text('Load Todo'),
            ),
          );
        },
      ),
    );
  }
}
