import 'package:flutter/material.dart';
import 'package:news/src/screens/news_screen.dart';

void main () {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());

}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      home: NewsScreen(),
        );
  }
}

