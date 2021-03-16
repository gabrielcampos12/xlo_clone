import 'package:mobx/mobx.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:xlo/helpers/extensions.dart';
import 'package:xlo/models/user.dart';
import 'package:xlo/repositories/user_repository.dart';

part 'signup_store.g.dart';

class SignupStore = _SignupStore with _$SignupStore;

abstract class _SignupStore with Store{
  @observable
  String name;

  @action
  void setName(String value) => name = value;

  @computed
  bool get nameValid => name != null && name.length >6;
  String get nameError{
    if(name == null || nameValid){
      return null;
    }
    else{
      if(name.isEmpty){
        return 'Campo Obrigatório';
      }else{
        return "Nome muito curto";
      }
    }
  }

  @observable
  String email;

  @action
  void setEmail(String  value) =>  email = value;

  @computed
  bool get emailValid => email != null && email.isEmailValid();
  String get emailError{
    if(email == null || emailValid)
      return null;
    else
      if(email.isEmpty)
        return "Campo obrigatório";
      else
        return "E-mail inválido";
  }
  @observable
  String phone;

  @action
  void setPhone(String  value) =>  phone = value;

  @computed
  bool get phoneValid => phone != null && phone.length >= 14;
  String get phoneError{
    if(phone == null || phoneValid)
      return null;
    else
    if(phone.isEmpty)
      return "Campo obrigatório";
    else
      return "Telefone inválido";
  }
  @observable
  String password ;

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get passwordValid => password != null && password.length > 6;
  String get passwordError{
    if(password == null || passwordValid)
      return null;
    else
    if(password.isEmpty)
      return "Campo obrigatório";
    else
      return "Senha muito curta";
  }
  @observable
  String password2 ;

  @action
  void setPassword2(String value) => password2 = value;

  @computed
  bool get password2Valid => password2 != null && password2.length > 6 && password2 == password;
  String get password2Error{
    if(password2 == null || password2Valid)
      return null;
    else
      return 'Senhas não coincidem';

  }
  @computed
  bool get isFormValid => nameValid && emailValid && phoneValid && passwordValid && password2Valid;

  @computed
  Function get signUpPressed => (isFormValid && !loading) ? _signUp : null;

  @observable
  String error;

  @observable
  bool loading = false;

  @action
  Future<void> _signUp()async {
    loading = true;

    final user = User(
      name: name,
      email: email,
      phone: phone,
      password: password,
    );


    try {
      final resultUser = await UserRepository().signUp(user);

    } catch (e) {
      loading = false;
      error = e;
    }

    loading = false;
  }
}


