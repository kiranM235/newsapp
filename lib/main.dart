import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/src/repo/news_api_provider.dart';
import 'package:news/src/repo/news_db_provider.dart';
import 'package:news/src/repo/repository.dart';
import 'package:news/src/screens/news_screen.dart';


void main () {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(App());

}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  final apiProvider = NewsApiProvider();
  final dbProvider = NewsDbProvider();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => Repository(dbProvider, apiProvider),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News App',
        home: NewsScreen(),
      ),
    );
  }
}

// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   final String title;
//
//   const MyHomePage({
//     Key? key,
//     required this.title,
//   }) : super(key: key);
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
