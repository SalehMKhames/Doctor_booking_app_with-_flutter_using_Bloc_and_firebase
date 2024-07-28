import 'package:doctory/Features/authentication/domain/entities/userCredentials.dart';

class CredentialsModel extends UserCredentials
{

  const CredentialsModel({required email, required token}) : super(email: email, token: token);

  factory CredentialsModel.fromJson(Map<String, dynamic> credentialsMap)
  {
    return CredentialsModel
      (
      email: credentialsMap['email'] as String,
      token: credentialsMap['idToken'] as String,
    );
  }

  Map<String, dynamic> toJson()
  {
    return {'email' : email, 'idToken' : token};
  }
}