///Section of credtis
class Section {
  ///Main constructor
  const Section({required this.title, required this.roles});

  ///Title of section
  final String title;

  ///Crew of section
  final List<Role> roles;
}

///Roles
class Role {
  ///Main constructor
  Role({required this.name, required this.crew});

  /// Role name
  final String name;

  /// Crew involved
  final List<Responsable> crew;
}

///Responsable credit
class Responsable {
  ///Main constructor
  const Responsable(this.name, {this.imageUrl});

  ///Responsable name
  final String name;

  ///Responsable image
  final String? imageUrl;
}
