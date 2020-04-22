import 'package:flutter/foundation.dart';

///Section of credtis
class Section {
  ///Title of section
  final String title;

  ///Crew of section
  final List<Role> roles;

  ///Main constructor
  Section({@required this.title, @required this.roles});
}

///Roles
class Role {
  /// Role name
  final String name;

  /// Crew involved
  final List<Responsable> crew;

  ///Main constructor
  Role({@required this.name, @required this.crew});
}

///Responsable credit
class Responsable {
  ///Responsable name
  final String name;

  ///Responsable image
  final String imageUrl;

  ///Main constructor
  const Responsable(this.name, {this.imageUrl});
}
