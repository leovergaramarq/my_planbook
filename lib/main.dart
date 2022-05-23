import 'package:flutter/material.dart';
import 'package:my_planbook/screens/welcome.dart';

void main() {
  return runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      home: Welcome()
    );
  }
}

// class FirstView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           child: Text('Press'),
//           onPressed: () => Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => SecondView())
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SecondView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           child: Text('OMG'),
//           onPressed: () => Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => FirstView())
//           ),
//         ),
//       ),
//     );
//   }
// }