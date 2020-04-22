import 'dart:async';
import 'package:flutter/material.dart';
import 'models.dart';
import 'section.dart';

///Fast movement of credits
const int fastSpeedFactor = 50;

///Normal movement of credits
const int normalSpeedFactor = 30;

///Slow movement of credits
const int slowSpeedFactor = 10;

///Widget that displays credits like a movie
///
///Moves a SingleScrollChildView from bottom to top
///and restarts the scrolling when reches the bottom.
class EndCredits extends StatefulWidget {
  ///Background color
  final Color backgroundColor;

  ///Curve of scrolling
  final Curve curve;

  ///Delay to start the scrolling
  final Duration delay;

  ///Sections of credtis
  final List<Section> sections;

  ///Movement speed of credtis
  final int speedFactor;

  ///Main constructor
  EndCredits(
    this.sections, {
    this.speedFactor = normalSpeedFactor,
    this.curve = Curves.linear,
    this.delay = Duration.zero,
    this.backgroundColor = Colors.black,
  });

  @override
  _EndCreditsState createState() => _EndCreditsState();
}

class _EndCreditsState extends State<EndCredits> {
  bool scroll = false;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Timer(widget.delay, _toggle);

    ///When reachs the bottom, restart the scrolling
    _scrollController.addListener(() {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        _scrollController.jumpTo(_scrollController.initialScrollOffset);
        Timer(widget.delay, _scroll);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: widget.backgroundColor,
        constraints: BoxConstraints.expand(),
        child: GestureDetector(
            onTapDown: (details) => _toggle(),
            onTapUp: (details) => _toggle(),
            onTapCancel: _toggle,
            child: SingleChildScrollView(
                controller: _scrollController,
                child: Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height,
                        bottom: MediaQuery.of(context).size.height),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          for (var section in widget.sections)
                            SectionWidget(section)
                        ])))));
  }

  void _toggle() {
    setState(() => scroll = !scroll);
    if (scroll) {
      _scroll();
    } else {
      _scrollController.animateTo(_scrollController.offset,
          duration: Duration.zero, curve: widget.curve);
    }
  }

  void _scroll() {
    ///Calculate duration depending on speedFactor
    final maxExtent = _scrollController.position.maxScrollExtent;
    final distanceDifference = maxExtent - _scrollController.offset;
    final durationDouble = distanceDifference / widget.speedFactor;

    ///Move to end of scroll
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: Duration(seconds: durationDouble.toInt()),
        curve: widget.curve);
  }
}
