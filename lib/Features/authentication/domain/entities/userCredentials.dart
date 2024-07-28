import 'package:equatable/equatable.dart';


class UserCredentials extends Equatable
{
  final String email;
  final String? token;
  final String localId;

  const UserCredentials({required this.email, required this.token, required this.localId});

  @override
  List<Object?> get props => [email, token, localId];

  UserCredentials copyWith(String? email, String? token, String? localId)
  {
    return UserCredentials(email: email ?? this.email, token: token ?? this.token, localId: localId ?? this.localId);
  }

}

