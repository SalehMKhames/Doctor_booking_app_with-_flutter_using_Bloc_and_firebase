import 'package:doctory/common/user/domain/entity/user.dart';
import 'package:doctory/core/utils/Strings.dart';
import 'package:http/http.dart' as http;

class UserRemotedatasource
{
  http.Client client;

  UserRemotedatasource({required this.client});

  Future<void> uploadData(User user) async
  {
    final response = http.post(
        Uri.parse("$DataBaseURL/Users"),
        body: {user.toJson()},
    );

  }
}