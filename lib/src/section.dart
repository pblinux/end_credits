import 'package:end_credits/src/models.dart';
import 'package:flutter/material.dart';

///Deafult style for title
const TextStyle defaultTitleStyle =
    TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold);

///Deafult style for title
const TextStyle defaultRoleStyle =
    TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.normal);

///Deafult style for title
const TextStyle defaultResponsableStyle =
    TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);

///Widget that handle de section info
///
class SectionWidget extends StatefulWidget {
  ///Main constructor
  const SectionWidget(
    this.section, {
    Key? key,
    this.responsableStyle,
    this.roleStyle,
    this.titleStyle,
  }) : super(key: key);

  ///Section to display
  final Section section;

  ///Responsable of title
  final TextStyle? responsableStyle;

  ///Role of title
  final TextStyle? roleStyle;

  ///Style of title
  final TextStyle? titleStyle;

  @override
  State<SectionWidget> createState() => _SectionWidgetState();
}

class _SectionWidgetState extends State<SectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(bottom: 24),
      child: Column(
        children: <Widget>[
          Text(widget.section.title, style: widget.titleStyle),
          const SizedBox(height: 16),
          for (var role in widget.section.roles)
            Container(
              margin: EdgeInsets.only(bottom: role.crew.length > 1 ? 8 : 0),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        role.name,
                        style: widget.roleStyle,
                        textAlign: TextAlign.end,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          for (var person in role.crew)
                            Container(
                              margin: const EdgeInsets.only(bottom: 4),
                              child: Text(
                                person.name,
                                style: widget.responsableStyle,
                                textAlign: TextAlign.start,
                              ),
                            )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
