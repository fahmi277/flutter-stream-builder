import 'package:flutter/material.dart';
import 'service/apiService.dart';
import 'view/Homescreen.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      home: HomeScreen(),
    );
  }
}

// StreamBuilder(
//       stream: Stream.periodic(Duration(seconds: 5))
//           .asyncMap((i) => getSakaryaAir()), // i is null here (check periodic docs)
//       builder: (context, snapshot) => Text(snapshot.data.toString()), // builder should also handle the case when data is not fetched yet
//     );
