import 'dart:io';

class Task {
  String name;
  bool isCompleted;

  Task({required this.name, this.isCompleted = false});

  @override
  String toString() {
    return isCompleted ? '$name (completed)' : name;
  }
}

class TodoService {
  List<Task> tasks = [];

  void addTask(String taskName) {
    tasks.add(Task(
      isCompleted: false,
      name: taskName,
    ));
    print('$taskName has been added to the list.');
  }

  void viewTasks() {
    if (tasks.isEmpty) {
      print('No tasks available.');
    } else {
      print('Tasks:');
      for (int i = 0; i < tasks.length; i++) {
        print('${i + 1}. ${tasks[i]}');
      }
    }
  }

  void markTaskAsCompleted(int taskNumber) {
    if (taskNumber > 0 && taskNumber <= tasks.length) {
      tasks[taskNumber - 1].isCompleted = true;
      print('${tasks[taskNumber - 1].name} has been marked as completed.');
    } else {
      print('Invalid task number. Please try again.');
    }
  }

  void deleteTask(int taskNumber) {
    if (taskNumber > 0 && taskNumber <= tasks.length) {
      print('${tasks[taskNumber - 1].name} has been deleted from the list.');
      tasks.removeAt(taskNumber - 1);
    } else {
      print('Invalid task number. Please try again.');
    }
  }
}

void main() {
  TodoService toDoList = TodoService();

  while (true) {
    print('\nSimple To-Do List Application');
    print('1. Add a task');
    print('2. View all tasks');
    print('3. Mark a task as completed');
    print('4. Delete a task');
    print('5. Exit');
    print('Enter your choice:');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        print('Enter the task:');
        String? taskName = stdin.readLineSync();
        if (taskName != null && taskName.isNotEmpty) {
          toDoList.addTask(taskName);
        } else {
          print('Invalid task. Please try again.');
        }
        break;
      case '2':
        toDoList.viewTasks();
        break;
      case '3':
        print('Enter the task number to mark as completed:');
        String? input = stdin.readLineSync();
        int? taskNumber = int.tryParse(input ?? '');
        if (taskNumber != null) {
          toDoList.markTaskAsCompleted(taskNumber);
        } else {
          print('Invalid task number. Please try again.');
        }
        break;
      case '4':
        print('Enter the task number to delete:');
        String? input = stdin.readLineSync();
        int? taskNumber = int.tryParse(input ?? '');
        if (taskNumber != null) {
          toDoList.deleteTask(taskNumber);
        } else {
          print('Invalid task number. Please try again.');
        }
        break;
      case '5':
        print('Exiting the application...');
        return;
      default:
        print('Invalid choice. Please try again.');
    }
  }
}
