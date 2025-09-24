import 'package:flutter/material.dart';

class TaskManagerScreen extends StatefulWidget {
  const TaskManagerScreen({super.key});

  @override
  State<TaskManagerScreen> createState() => _TaskManagerScreenState();
}

class _TaskManagerScreenState extends State<TaskManagerScreen> {
  final List<Task> _tasks = List.generate(
    15,
    (index) => Task(title: 'Task ${index + 1}'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Task Manager'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ReorderableListView.builder(
        itemCount: _tasks.length,
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (newIndex > oldIndex) newIndex -= 1;
            final item = _tasks.removeAt(oldIndex);
            _tasks.insert(newIndex, item);
          });
        },
        itemBuilder: (context, index) {
          final task = _tasks[index];
          return Dismissible(
            key: ValueKey(task),
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            secondaryBackground: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            confirmDismiss: (direction) async {
              return await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Delete Task'),
                  content: Text(
                    'Are you sure you want to delete "${task.title}"?',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: const Text('Delete'),
                    ),
                  ],
                ),
              );
            },
            onDismissed: (direction) {
              final removedTask = task;
              setState(() {
                _tasks.removeAt(index);
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${removedTask.title} deleted'),
                  duration: const Duration(seconds: 2),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      setState(() {
                        _tasks.insert(index, removedTask);
                      });
                    },
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 4.0,
              ),
              child: Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(8),
                child: ListTile(
                  key: ValueKey('${task.title}-$index'),
                  leading: ReorderableDragStartListener(
                    index: index,
                    child: const Icon(Icons.drag_handle),
                  ),
                  trailing: Checkbox(
                    value: task.isDone,
                    onChanged: (value) {
                      setState(() {
                        task.isDone = value ?? false;
                      });
                    },
                  ),
                  title: Text(
                    task.title,
                    style: TextStyle(
                      decoration: task.isDone
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  tileColor: Colors.grey.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(color: Colors.grey.shade300, width: 1.0),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Task {
  final String title;
  bool isDone;

  Task({required this.title, this.isDone = false});
}
