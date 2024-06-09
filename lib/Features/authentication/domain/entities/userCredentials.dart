import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

class UserCredentials extends Equatable
{
  final String email;
  final String password;

  const UserCredentials({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];

  UserCredentials copyWith(String? email, String? Password)
  {
    return UserCredentials(email: email ?? this.email, password: Password ?? password);
  }

}

