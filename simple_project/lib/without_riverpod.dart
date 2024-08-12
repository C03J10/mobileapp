void main() {
  final serviceA = ClassServiceA();
  final serviceB = ClassServiceB(serviceA: serviceA);
  final serviceC = ClassServiceC(serviceA: serviceA, serviceB: serviceB);
  final serviceD =
      ClassServiceD(serviceA: serviceA, serviceB: serviceB, serviceC: serviceC);
  final serviceE = ClassServiceE(
      serviceA: serviceA,
      serviceB: serviceB,
      serviceC: serviceC,
      serviceD: serviceD);

  serviceE.doSomething();
}

class ClassServiceA {
  void doSomething() {
    print("ClassServiceA is doing something");
  }
}

class ClassServiceB {
  ClassServiceB({required this.serviceA});

  final ClassServiceA serviceA;

  void doSomething() {
    serviceA.doSomething();
    print("ClassServiceB is doing something");
  }
}

class ClassServiceC {
  ClassServiceC({required this.serviceA, required this.serviceB});

  final ClassServiceA serviceA;
  final ClassServiceB serviceB;

  void doSomething() {
    serviceA.doSomething();
    serviceB.doSomething();
    print("ClassServiceC is doing something");
  }
}

class ClassServiceD {
  ClassServiceD(
      {required this.serviceA, required this.serviceB, required this.serviceC});

  final ClassServiceA serviceA;
  final ClassServiceB serviceB;
  final ClassServiceC serviceC;

  void doSomething() {
    serviceA.doSomething();
    serviceB.doSomething();
    serviceC.doSomething();
    print("ClassServiceD is doing something");
  }
}

class ClassServiceE {
  ClassServiceE(
      {required this.serviceA,
      required this.serviceB,
      required this.serviceC,
      required this.serviceD});

  final ClassServiceA serviceA;
  final ClassServiceB serviceB;
  final ClassServiceC serviceC;
  final ClassServiceD serviceD;

  void doSomething() {
    serviceA.doSomething();
    serviceB.doSomething();
    serviceC.doSomething();
    serviceD.doSomething();
    print("ClassServiceE is doing something");
  }
}
