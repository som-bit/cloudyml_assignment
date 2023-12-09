import 'package:equatable/equatable.dart';



// this is the class to convert the data in maps so that it can be send to firebase


class MyUserEntity extends Equatable {
  final String userId;
  final String email;
  final String name;

  const MyUserEntity(
      {required this.userId, required this.email, required this.name});


//form user to firebae
  Map<String, Object?> toDocument() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
    };
  }


// from firebase to user or my app
  static MyUserEntity fromDocument(Map<String, dynamic> doc) {
    return MyUserEntity(
        userId: doc['userId'], email: doc['email'], name: doc['name']);
  }

  @override
  List<Object?> get props => [userId, email, name];
}
