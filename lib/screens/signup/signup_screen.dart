import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo/components/custom_drawer/error_box.dart';
import 'package:xlo/screens/signup/components/field_titile.dart';
import 'package:xlo/stores/signup_store.dart';
class SignupScreen extends StatelessWidget {
  final SignupStore signupStore = SignupStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 8,
              margin: EdgeInsets.symmetric(horizontal: 32),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Observer(builder: (_){
                      return ErrorBox(
                        message : signupStore.error
                      );
                    }),
                    FieldTitle(
                      title: 'Apelido',
                      subtitle: 'Como aparecerá em seus anúncios',
                    ),
                    Observer(builder: (_){
                      return TextField(
                        enabled: !signupStore.loading,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Exemplo: João S.',
                            isDense: true,
                            errorText: signupStore.nameError
                        ),
                        onChanged: signupStore.setName,

                      );
                    }),
                    SizedBox(height: 16,),
                    FieldTitle(
                      title: 'E-mail',
                      subtitle: 'Enviaremos um e-mail de confirmação',
                    ),
                    Observer(builder: (_){
                      return TextField(
                        enabled: !signupStore.loading,
                        onChanged: signupStore.setEmail,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Exemplo: joãos@gmail.com',
                          isDense: true,
                          errorText: signupStore.emailError,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                      );
                    }),
                    SizedBox(height: 16,),
                    FieldTitle(
                      title: 'Celular',
                      subtitle: 'Proteja sua conta',
                    ),
                    Observer(builder: (_){
                      return TextField(
                        enabled: !signupStore.loading,
                        onChanged: signupStore.setPhone,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '(55) 99999-9999',
                          isDense: true,
                          errorText: signupStore.phoneError
                        ),
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly,
                          TelefoneInputFormatter()
                        ],
                      );
                    }),
                    SizedBox(height: 16,),
                    FieldTitle(
                      title: 'Senha',
                      subtitle: 'Use letras,números e caracteres especiais',
                    ),
                    Observer(builder: (_){

                      return TextField(
                        enabled: !signupStore.loading,
                        onChanged: signupStore.setPassword,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          isDense: true,
                          errorText: signupStore.passwordError
                        ),
                        obscureText: true,
                      );
                    }),
                    SizedBox(height: 16,),
                    FieldTitle(
                      title: 'Confirmar Senha',
                      subtitle: 'Repita a senha',
                    ),
                    Observer(builder: (_){
                      return TextField(
                        enabled: !signupStore.loading,
                        onChanged: signupStore.setPassword2,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          isDense: true,
                          errorText: signupStore.password2Error
                        ),
                        obscureText: true,
                      );
                    }),

                    Observer(builder: (_){
                      return Container(

                        margin: EdgeInsets.only(top: 20,bottom: 12),
                        height: 40,
                        child: RaisedButton(
                          color: Colors.orange,
                          disabledColor: Colors.orange.withAlpha(120),
                          child: signupStore.loading ? CircularProgressIndicator(

                          ):
                          Text('CADASTRAR'),
                          textColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onPressed: signupStore.signUpPressed
                        ),
                      );
                    }),
                    Divider(
                      color: Colors.black,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          Text(
                            'Já tem uma conta?',
                            style: TextStyle(fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: Navigator.of(context).pop,
                            child: Text(
                              'Entrar',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.purple,
                                fontSize: 16,
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                )
              ),
            ),
          ),
        ),
      ),
    );
  }
}
