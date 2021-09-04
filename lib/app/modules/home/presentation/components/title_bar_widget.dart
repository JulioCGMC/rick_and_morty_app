import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';

class TitleBarWidget extends StatefulWidget {
  final String title;
  const TitleBarWidget({ Key? key, required this.title }) : super(key: key);

  @override
  _TitleBarWidgetState createState() => _TitleBarWidgetState();
}

class _TitleBarWidgetState extends State<TitleBarWidget> {
  /// Controller for playback
  late RiveAnimationController _controller;

  /// Is the animation currently playing?
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = OneShotAnimation(
      'day_idle',
      autoplay: false,
      onStop: () => setState(() => _isPlaying = false),
      onStart: () => setState(() => _isPlaying = true),
    );
  }

  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = MediaQuery.of(context).padding;
    return Padding(
      padding: EdgeInsets.only(
        top: 0.03.sh+padding.top, 
        left: 0.04.sw, 
        right: 0.04.sw,
        bottom: 10.h
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _title(context),
          /// TODO: Add animation to dark mode switch
          // RiveAnimation.network(
          //   'https://public.rive.app/community/runtime-files/857-1664-switch-for-dark-and-light-mode-transitions.riv',
          //   artboard: 'Artboard',
          //   animations: ['day_idle', 'night_idle', 
          //     'switch_day', 'switch_night'],
          //   controllers: [_controller],
          // )
        ],
      )  
    );
  }

  Widget _title(BuildContext context) => Text(
    widget.title, 
    style: Theme.of(context).textTheme.headline5,
    textAlign: TextAlign.left,
  );
}