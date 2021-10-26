import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/src/bloc/counter_bloc.dart';
import 'package:news/src/bloc/counter_event.dart';
import 'package:news/src/bloc/counter_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  void _incrementCounter(BuildContext context) {
    /// add IncrementEvent to the blob
    final bloc = BlocProvider.of<CounterBloc>(context);
    // bloc.add(CounterEvent(CounterType.increment));
    bloc.add(IncrementEvent());
  }

  void _decrementCounter(BuildContext context) {
    /// add DecrementEvent to the blob
    final bloc = BlocProvider.of<CounterBloc>(context);
    // bloc.add(CounterEvent(CounterType.decrement));
    bloc.add(DecrementEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(CounterState(0)),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Counter Bloc"),
            ),
            body: Center(
              child: BlocBuilder<CounterBloc, CounterState>(
                builder: (context, CounterState state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'You have pushed the button this many times:',
                      ),
                      Text(
                        '${state.count}',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  );
                }
              ),
            ),
            floatingActionButton: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton(
                  onPressed: () => _incrementCounter(context);
                  ,
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
                SizedBox(height: 8),
                FloatingActionButton(
                  onPressed: () => _decrementCounter(context);
                  ,
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
              ],
            ),

          );
        }
      ),
    );
  }
}
