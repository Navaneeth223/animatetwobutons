import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AnimatedSwitcherDemo());
  }
}

class AnimatedSwitcherDemo extends StatefulWidget {
  @override
  _AnimatedSwitcherDemoState createState() => _AnimatedSwitcherDemoState();
}

class _AnimatedSwitcherDemoState extends State<AnimatedSwitcherDemo> {
  bool _isFirst = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedSwitcher Trick')),
      body: Center(
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          transitionBuilder: (child, animation) =>
              ScaleTransition(scale: animation, child: child),
          child: _isFirst
              ? ElevatedButton(
            key: ValueKey(1),
            onPressed: () => setState(() => _isFirst = false),
            child: Text('Button A'),
          )
              : ElevatedButton(
            key: ValueKey(2),
            onPressed: () => setState(() => _isFirst = true),
            child: Text('Button B'),
          ),
        ),
      ),
    );
  }
}
