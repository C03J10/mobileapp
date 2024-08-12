void main() {
  ClassA classA = ClassA(example: 'awdad');

  ClassB classB = ClassB(classA);
  ClassC classC = ClassC(classA);
  ClassD classD = ClassD(classA);

  classB.performAction();
  classC.executeTask();
  classD.runProcess();
}

class ClassA {
  ClassA({
    required this.example,
  });
  final String example;
  void doSomething() {
    print("ClassA is doing something");
  }
}

class ClassB {
  final ClassA classA;

  ClassB(this.classA);

  void performAction() {
    classA.doSomething();
    print("ClassB is performing an action");
  }
}

class ClassC {
  final ClassA classA;

  ClassC(this.classA);

  void executeTask() {
    classA.doSomething();
    print("ClassC is executing a task");
  }
}

class ClassD {
  final ClassA classA;

  ClassD(this.classA);

  void runProcess() {
    classA.doSomething();
    print("ClassD is running a process");
  }
}
