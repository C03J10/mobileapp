import 'package:riverpod/riverpod.dart';

void main() {
  final container = ProviderContainer();
  final serviceE = container.read(classServiceEProvider);
  serviceE.doSomething();
}

final classServiceAProvider = Provider((ref) => ClassServiceA());
final classServiceBProvider = Provider((ref) {
  return ClassServiceB(ref: ref);
});
final classServiceCProvider = Provider((ref) {
  return ClassServiceC(ref: ref);
});
final classServiceDProvider = Provider((ref) {
  return ClassServiceD(ref: ref);
});
final classServiceEProvider = Provider((ref) {
  return ClassServiceE(ref: ref);
});

class ClassServiceA {
  void doSomething() {
    print("ClassServiceA is doing something");
  }
}

class ClassServiceB {
  ClassServiceB({
    required this.ref,
  });

  final Ref ref;

  void doSomething() {
    final serviceA = ref.read(classServiceAProvider);
    serviceA.doSomething();
    print("ClassServiceB is doing something");
  }
}

class ClassServiceC {
  final Ref ref;

  ClassServiceC({
    required this.ref,
  });

  void doSomething() {
    final serviceA = ref.read(classServiceAProvider);
    final serviceB = ref.read(classServiceBProvider);
    serviceA.doSomething();
    serviceB.doSomething();
    print("ClassServiceC is doing something");
  }
}

class ClassServiceD {
  final Ref ref;

  ClassServiceD({
    required this.ref,
  });

  void doSomething() {
    final serviceA = ref.read(classServiceAProvider);
    final serviceB = ref.read(classServiceBProvider);
    final serviceC = ref.read(classServiceCProvider);
    serviceA.doSomething();
    serviceB.doSomething();
    serviceC.doSomething();
    print("ClassServiceD is doing something");
  }
}

class ClassServiceE {
  final Ref ref;

  ClassServiceE({
    required this.ref,
  });

  void doSomething() {
    final serviceA = ref.read(classServiceAProvider);
    final serviceB = ref.read(classServiceBProvider);
    final serviceC = ref.read(classServiceCProvider);
    final serviceD = ref.read(classServiceDProvider);

    serviceA.doSomething();
    serviceB.doSomething();
    serviceC.doSomething();
    serviceD.doSomething();
    print("ClassServiceE is doing something");
  }
}
