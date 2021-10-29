import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';
import 'package:todo_app/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return GestureDetector(
              onLongPress: () {
                taskData.removeTask(taskData.tasks[index]);
              },
              child: TaskTile(
                task.name,
                task.isDone,
                (bool? checkboxState) {
                  if (checkboxState != null) {
                    taskData.updateTask(task);
                  }
                },
              ),
            );
          },
          itemCount: taskData.tasks.length,
        );
      },
    );
  }
}
