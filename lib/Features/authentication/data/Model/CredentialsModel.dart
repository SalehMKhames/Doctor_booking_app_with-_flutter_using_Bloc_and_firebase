import 'package:doctory/Features/authentication/domain/entities/userCredentials.dart';

class CredentialsModel extends UserCredentials
{
  const CredentialsModel({required email, required password}) : super(email: email, password: password);

  factory CredentialsModel.fromJson(Map<String, dynamic> credentialsMap)
  {
    return CredentialsModel
      (
      email: credentialsMap['email'],
      password: credentialsMap['password'],
    );
  }

  Map<String, dynamic> toJson()
  {
    return {'email' : email, 'password' : password};
  }
}