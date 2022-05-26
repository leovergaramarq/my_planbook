import 'package:flutter/material.dart';
import 'package:my_planbook/screens/welcome.dart';
import 'package:my_planbook/providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  return runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    builder: (context, _) {
      final themeProvider = Provider.of<ThemeProvider>(context);

      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App',
        themeMode: themeProvider.themeMode,
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        home: Welcome(),
      );
    }
  );
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