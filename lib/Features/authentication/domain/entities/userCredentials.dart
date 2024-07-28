import 'package:equatable/equatable.dart';


class UserCredentials extends Equatable
{
  final String email;
  final String? token;

  const UserCredentials({required this.email, required this.token});

  @override
  List<Object?> get props => [email, token];

  UserCredentials copyWith(String? email, String? token)
  {
    return UserCredentials(email: email ?? this.email, token: token ?? this.token);
  }

}

