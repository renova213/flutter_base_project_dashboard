import 'package:core/core.dart';
import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final int todoId;
  final String title;
  final bool completed;

  const TodoCard({
    super.key,
    required this.todoId,
    required this.title,
    required this.completed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: completed ? Colors.green : Colors.orange,
                    child: Icon(
                      completed ? Icons.check : Icons.schedule,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  12.0.imHorizontalSpace(),
                  Text(
                    'Todo #$todoId',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              16.0.imVerticalSpace(),
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(fontSize: 16),
              ),
              16.0.imVerticalSpace(),
              Chip(
                label: Text(completed ? 'Completed' : 'Pending'),
                backgroundColor: completed
                    ? Colors.green.shade100
                    : Colors.orange.shade100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
