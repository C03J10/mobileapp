void main() {
  ClassB classB = ClassB();
  ClassC classC = ClassC();
  ClassD classD = ClassD();

  classB.performAction();
  classC.executeTask();
  classD.runProcess();
}

class ClassA {
  ClassA({required this.example});
  final String example;
  void doSomething() {
    print("ClassA is doing something");
  }
}

class ClassB {
  ClassA classA = ClassA(example: "Example");

  void performAction() {
    classA.doSomething();
    print("ClassB is performing an action");
  }
}

class ClassC {
  ClassA classA = ClassA(example: "Example");

  void executeTask() {
    classA.doSomething();
    print("ClassC is executing a task");
  }
}

class ClassD {
  ClassA classA = ClassA(example: "Example");

  void runProcess() {
    classA.doSomething();
    print("ClassD is running a process");
  }
}
