import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

void test() {
  final myList = {'david', 567, 'David', 'marion'};
  final myName = 'Michael';
  final Names = ['David', 'Marion', 678];
  String message = myName.toLowerCase() == 'david'
      ? 'This is David'
      : 'This is not David';
  print(message);
  print(Names[2]);
  print(myList);

  var myMap = {'age': 20, 'name': 'David'};
  var hisMap = <String, String>{};
  hisMap['name'] = 'Marion';
  hisMap['day'] = 'Monday';
  print(myMap);
  myMap['name'] = 'Mundacorp';
  print(myMap);
  print(hisMap);
}

// Making type nullable
void mundaTest(String? finame, String? miname, String? laname) {
  String? name;
  print(name);

  String? fname = finame;
  fname ??= miname;
  fname ??= laname;
  print(fname);
}

// checking for nullable value
void lenTest(List<String>? names) {
  final len = names?.length ?? 0;
  print(len);
}

// Enumerations
enum MyPersonCar { bugatti, lamborghini, ferrari }

void makeEnumeration(MyPersonCar carType) async {
  // print(MyPerson.firstName.index);
  // print(MyPerson.lastName.hashCode);
  // print(MyPerson.age.runtimeType);

  // preffered way of working with enumerations
  switch (carType) {
    case MyPersonCar.bugatti:
      print("Bugatti is the best");
      break;
    case MyPersonCar.lamborghini:
      print("Lamborghini is the best");
      break;
    case MyPersonCar.ferrari:
      print("Ferrari is the best");
      break;
  }

  final supercar = SuperCar(340, "6.2 litre V8");
  supercar.start();
  supercar.rev();
  supercar.stop();
  supercar.jump();
  supercar.SuperCarProps();

  // final hypercar = HyperCar.hyperCar();

  // print(hypercar.hyperCarName);

  // final hypercar1 = HyperCar("Koenigsegg");
  // final hypercar2 = HyperCar("Koenigsegg");

  // final myMessage = hypercar1 == hypercar2
  //     ? "This is great, it worked"
  //     : "Need to do something";

  // print(myMessage);

  // final heavyMultiply = await heavyMultiplication(100);
  // print(heavyMultiply);

  // await for (final engine in getEngine()) {
  //   print(engine);
  // }

  final carIteration = getCars();
  print(carIteration);

  // await for (final makerIteration in getManufacturers()) {
  //   print(makerIteration);
  // }

  final names = Pair('Avengers', 1009);
  print(names.note());
}

// Classes/ objects/ contructors/ methods/ inheritance/ subclassing/
// abstract classes/ factory constructors/ custom operators
abstract class Car {
  void start() {
    print("Car has started");
  }

  void rev() {
    print("Car is reving");
  }

  void stop() {
    print("Car is stopped");
  }
}

class SuperCar extends Car {
  final int speed;
  final String engineName;

  SuperCar(this.speed, this.engineName);
}

// extensions
extension Run on SuperCar {
  void jump() {
    print("The car jumps");
  }

  String get SuperCarProperties => '$engineName ${speed}km/h';

  void SuperCarProps() {
    print(SuperCarProperties);
  }
}

// Futures
Future<int> heavyMultiplication(int a) {
  return Future.delayed(const Duration(seconds: 5), () => a * 2025);
}

// Streams
Stream<String> getEngine() {
  return Stream.periodic(const Duration(seconds: 1), (mynum) => '6.2 litre V8');
}

// sync Generators
Iterable<String> getCars() sync* {
  yield 'Bugatti Mistral';
  yield 'Ferrari SF90';
  yield 'Corvette Z06';
}

// async Generators
Stream<Iterable<String>> getManufacturers() async* {
  yield* Stream.periodic(
    const Duration(seconds: 1),
    (theirnum) => [
      'Mercedes',
      'Ford',
      'Scuderia Ferrari',
      'Ettore Bugatti',
      'Lamborgini',
      'Nissan',
      'Toyota',
      'Aston Martin',
    ],
  );
}

//Generics
class Pair<A, B> {
  final A value1;
  final B value2;

  Pair(this.value1, this.value2);

  String note() {
    return '${value1} and ${value2}';
  }
}

// class HyperCar {
//   final String hyperCarName;

//   HyperCar(this.hyperCarName);

//   @override
//   bool operator ==(covariant HyperCar other) =>
//       other.hyperCarName == hyperCarName;

//   @override
//   // TODO: implement hashCode
//   int get hashCode => hyperCarName.hashCode;

//   factory HyperCar.hyperCar() {
//     return HyperCar("Bugatti Bollide");
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // test();
    // mundaTest(null, null, 'Munda');
    // lenTest(null);
    makeEnumeration(MyPersonCar.ferrari);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text('You have pushed the button this many times:'),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
