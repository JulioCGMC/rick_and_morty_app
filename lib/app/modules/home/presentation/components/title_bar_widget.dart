import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';

class TitleBarWidget extends StatefulWidget {
  final String title;
  const TitleBarWidget({ Key? key, required this.title }) : super(key: key);

  @override
  _TitleBarWidgetState createState() => _TitleBarWidgetState();
}

class _TitleBarWidgetState extends State<TitleBarWidget> {
  late SimpleAnimation _day, _night, _switchDay, _switchNight;
  Artboard? _riveArtboard;
  String mode = 'light';

  void _nightToDay() async {
    if (_riveArtboard != null) {
      _riveArtboard!.removeController(_day);
      _riveArtboard!.removeController(_switchDay);
      _riveArtboard!.addController(_switchDay);
      await Future.delayed(Duration(milliseconds: 500));
      _riveArtboard!.addController(_day);
      setState(() { mode = 'light'; });
    }
  }

  void _dayToNight() async {
    if (_riveArtboard != null) {
      _riveArtboard!.removeController(_night);
      _riveArtboard!.removeController(_switchNight);
      _riveArtboard!.addController(_switchNight);
      await Future.delayed(Duration(milliseconds: 500));
      _riveArtboard!.addController(_night);
      setState(() { mode = 'dark'; });
    }
  }

  Future<void> initAnimation() async {
    await rootBundle.load('assets/ani/switch_day_night.riv').then((data) {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;
        // Create controllers for the one-shot animations you want to fire
        _day = SimpleAnimation('day_idle');
        _night = SimpleAnimation('night_idle');
        _switchDay = SimpleAnimation('switch_day');
        _switchNight = SimpleAnimation('switch_night');

        // Initially show the animation
        artboard.addController(_day);
        setState(() => _riveArtboard = artboard);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    initAnimation();
  }

  @override
  void dispose() {
    _day.dispose();
    _night.dispose();
    _switchDay.dispose();
    _switchNight.dispose();
    _riveArtboard!.remove();
    super.dispose();
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
          // _darkModeSwitch(context)
        ],
      )  
    );
  }

  Widget _title(BuildContext context) => Text(
    widget.title, 
    style: Theme.of(context).textTheme.headline5,
    textAlign: TextAlign.left,
  );

  // If needed to apply dinamic mode change
  // ignore: unused_element
  Widget _darkModeSwitch(BuildContext context) => SizedBox(
    width: 0.15.sw,
    height: 0.04.sh,
    child: _riveArtboard != null ? GestureDetector(
      onTap: () {
        if (mode == 'light') {
          _dayToNight();
        }
        else {
          _nightToDay();
        }
      },
      child: Rive(artboard: _riveArtboard!),
    ) : Container()
  );
}