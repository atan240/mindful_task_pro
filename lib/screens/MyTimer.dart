import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyTimer());
}

class MyTimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TimerPage(),
    );
  }
}

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> with TickerProviderStateMixin {
  late TextEditingController _controller;
  late int _timeRemaining;
  late AnimationController _animationController;
  Timer? _timer;
  bool _isPaused = true;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _timeRemaining = 0;
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: _timeRemaining),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _startTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
    if (_isPaused) {
      _animationController.reverse(from: _animationController.value);
    } else {
      _timeRemaining = int.parse(_controller.text);
      _animationController.duration = Duration(seconds: _timeRemaining);
      _animationController.reverse(from: 1.0);
    }
    _isPaused = false;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timeRemaining == 0) {
        timer.cancel();
      } else if (!_isPaused) {
        setState(() {
          _timeRemaining--;
        });
      }
    });
  }

  void _pauseTimer() {
    setState(() {
      _isPaused = true;
      _animationController.stop();
    });
  }

  void _resumeTimer() {
    setState(() {
      _isPaused = false;
      _animationController.reverse(from: _animationController.value);
    });
  }

  void _cancelTimer() {
    setState(() {
      _timer?.cancel();
      _timeRemaining = 0;
      _isPaused = true;
      _animationController.stop();
      _animationController.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF96c24b),
      appBar: AppBar(title: Text('Timer App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter time in seconds'),
            ),
            SizedBox(height: 16),
            Text('Time remaining: $_timeRemaining'),
            SizedBox(height: 16),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1.0,
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Container(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator(
                        value: 1.0 - _animationController.value,
                        strokeWidth: 10,
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _startTimer,
                  child: Text('Start'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _isPaused ? _resumeTimer : _pauseTimer,
                  child: Text(_isPaused ? 'Resume' : 'Pause'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _cancelTimer,
                  child: Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
