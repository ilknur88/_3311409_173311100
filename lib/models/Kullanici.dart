class User {
  final int id;
  final String name;
  final String surname;
  final String email;


  User({required this.id, required this.name, required this.surname,required this.email,});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'surname': surname,
      'email': email,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'User{id: $id, name: $name, surname: $surname, email: $email}';
  }
}