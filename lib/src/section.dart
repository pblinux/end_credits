import 'package:flutter/material.dart';
import 'models.dart';

///Deafult style for title
const TextStyle defaultTitleStyle =
    TextStyle(color: Colors.white, fontSize: 32.0, fontWeight: FontWeight.bold);

///Deafult style for title
const TextStyle defaultRoleStyle = TextStyle(
    color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.normal);

///Deafult style for title
const TextStyle defaultResponsableStyle =
    TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold);

///Widget that handle de section info
///
class SectionWidget extends StatefulWidget {
  ///Section to display
  final Section section;

  ///Responsable of title
  final TextStyle responsableStyle;

  ///Role of title
  final TextStyle roleStyle;

  ///Style of title
  final TextStyle titleStyle;

  ///Main constructor
  SectionWidget(this.section,
      {this.responsableStyle, this.roleStyle, this.titleStyle});

  @override
  _SectionWidgetState createState() => _SectionWidgetState();
}

class _SectionWidgetState extends State<SectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        margin: const EdgeInsets.only(bottom: 24.0),
        child: Column(children: <Widget>[
          Text(widget.section.title, style: widget.titleStyle),
          SizedBox(height: 16.0),
          for (var role in widget.section.roles)
            Container(
              margin: EdgeInsets.only(bottom: role.crew.length > 1 ? 8.0 : 0.0),
              child: IntrinsicHeight(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                    Expanded(
                        child: Text(role.name,
                            style: widget.roleStyle, textAlign: TextAlign.end)),
                    SizedBox(width: 16.0),
                    Expanded(
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                          for (var person in role.crew)
                            Container(
                                margin: const EdgeInsets.only(bottom: 4.0),
                                child: Text(person.name,
                                    style: widget.responsableStyle,
                                    textAlign: TextAlign.start))
                        ]))
                  ])),
            )
        ]));
  }
}
