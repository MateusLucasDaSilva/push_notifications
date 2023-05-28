import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late double size = 50;
  @override
  void initState() {
    initializeAnimation();
    super.initState();
  }

  void initializeAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      reverseDuration: const Duration(seconds: 2),
    );
    _controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
      //  await Future.delayed(const Duration(seconds: 1));
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }

      _controller.addListener(() {
        setState(() {
          size =  _controller.value;
        });
      });
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var sizeAnimation = 40 + size * 110;
    // print(sizeAnimation);
    return Scaffold(
      appBar: AppBar(
        title: const Text('home page'),
      ),
      body: Container(
        color: Colors.red,
        child: AnimatedSize(
          curve: Curves.easeInBack,
          duration: Duration(seconds: 2),
          child: Center(
            child: Icon(
              Icons.apple,
              size:  sizeAnimation,
            ),
          ),
        ),
      ),
    );
  }
}
