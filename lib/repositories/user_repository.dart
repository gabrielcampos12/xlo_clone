import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:xlo/models/user.dart';
import 'package:xlo/repositories/parse_errors.dart';
import 'package:xlo/repositories/table_keys.dart';

class UserRepository{


  Future<User> signUp(User user)async{
    final parseUser = ParseUser(
      user.email,
      user.password,
      user.email
    );

    parseUser.set<String>(keyUserName, user.name);
    parseUser.set<String>(keyUserPhone,user.phone);
    parseUser.set(keyUserType, user.type.index);

    final response = await parseUser.signUp();
    if(response.success){
      return mapParseToUser(response.result);
    }else{
      return Future.error(ParseErrors.getDescription(response.error.code));
    }
  }

  User mapParseToUser(ParseUser parseUser){
    return User(
      id: parseUser.objectId,
      name: parseUser.get(keyUserName),
      email: parseUser.get(keyUserEmail),
      phone: parseUser.get(keyUserPhone),
      type: UserType.values[parseUser.get(keyUserType)],
      createAt: parseUser.get(keyUserCreatedAt),
    );
  }

}