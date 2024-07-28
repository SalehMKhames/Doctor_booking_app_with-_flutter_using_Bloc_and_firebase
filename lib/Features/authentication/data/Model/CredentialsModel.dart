import 'package:doctory/Features/authentication/domain/entities/userCredentials.dart';

class CredentialsModel extends UserCredentials
{

  const CredentialsModel({required email, required token, required id})
      : super(email: email, token: token, localId: id);

  factory CredentialsModel.fromJson(Map<String, dynamic> credentialsMap)
  {
    return CredentialsModel
    (
      email: credentialsMap['email'] as String,
      token: credentialsMap['idToken'] as String,
      id: credentialsMap['localId'] as String,
    );
  }

  Map<String, dynamic> toJson()
  {
    return {'email' : email, 'idToken' : token, 'localId': localId};
  }
}