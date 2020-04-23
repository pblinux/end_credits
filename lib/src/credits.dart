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

///Callback for scroll position
typedef OnScrollChange = void Function(double);

///Widget that displays credits like a movie
///
///Moves a SingleScrollChildView from bottom to top
///and restarts the scrolling when reches the bottom.
class EndCredits extends StatefulWidget {
  ///Background color
  ///
  ///Default: Black
  final Color backgroundColor;

  ///Curve of scrolling
  ///
  ///Default: linear
  final Curve curve;

  ///Delay to start the scrolling
  ///
  ///Default: zero
  final Duration delay;

  ///Sections of credtis
  final List<Section> sections;

  ///Movement speed of credtis.
  ///
  ///Avaiable: fast (50), normal (30), slow (10).
  final int speedFactor;

  ///Event for position change
  final OnScrollChange onScrollChange;

  ///Responsable text style
  final TextStyle responsableTextStyle;

  ///Role text style
  final TextStyle roleTextStyle;

  ///Section title style
  final TextStyle titleTextStyle;

  ///Main constructor
  EndCredits(this.sections,
      {this.backgroundColor = Colors.black,
      this.curve = Curves.linear,
      this.delay = Duration.zero,
      this.onScrollChange,
      this.responsableTextStyle = defaultResponsableStyle,
      this.roleTextStyle = defaultRoleStyle,
      this.speedFactor = normalSpeedFactor,
      this.titleTextStyle = defaultTitleStyle});

  @override
  _EndCreditsState createState() => _EndCreditsState();
}

class _EndCreditsState extends State<EndCredits> {
  bool scroll = false;
  Timer _restartTimer;
  Timer _toogleTimer;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _toogleTimer = Timer(widget.delay, _toggle);

    ///When reachs the bottom, restart the scrolling
    _scrollController.addListener(_onScrollChanged);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScrollChanged);
    _scrollController.dispose();
    if (_toogleTimer != null) {
      _toogleTimer.cancel();
    }
    if (_restartTimer != null) {
      _restartTimer.cancel();
    }
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
              physics: NeverScrollableScrollPhysics(),
                controller: _scrollController,
                child: Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height,
                        bottom: MediaQuery.of(context).size.height),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          for (var section in widget.sections)
                            SectionWidget(section,
                                responsableStyle: widget.responsableTextStyle,
                                roleStyle: widget.roleTextStyle,
                                titleStyle: widget.titleTextStyle)
                        ])))));
  }

  void _onScrollChanged() {
    if (widget.onScrollChange != null) {
      widget.onScrollChange(_scrollController.offset);
    }
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      _scrollController.jumpTo(_scrollController.initialScrollOffset);
      _restartTimer = Timer(widget.delay, _scroll);
    }
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
