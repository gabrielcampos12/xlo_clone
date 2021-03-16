import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo/screens/login/components/text_common_login.dart';
import 'package:xlo/screens/signup/signup_screen.dart';
import 'package:xlo/stores/login_store.dart';
class LoginScreen extends StatelessWidget {

  LoginStore loginStore = LoginStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entrar'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
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
                  Text(
                    'Acessar com E-mail',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[900],
                    ),
                  ),
                  TextCommonLogin(title: "E-mail",),
                  Observer(builder: (_){
                    return TextField(
                      onChanged: loginStore.setEmail,
                      enabled: !loginStore.loading,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        errorText: loginStore.emailError,
                      ),
                      keyboardType: TextInputType.emailAddress,
                    );
                  }),
                  SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextCommonLogin(title:'Senha'),
                      GestureDetector(
                        onTap: (){

                        },
                        child: Text(
                          'Esqueceu sua senha?',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.purple
                          ),
                        ),
                      ),
                    ],
                  ),
                  Observer(builder: (_){
                    return TextField(
                      onChanged: loginStore.setPassword,
                      enabled: !loginStore.loading,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        errorText: loginStore.passwordError,
                      ),
                      obscureText: true,
                    );
                  }),
                  Container(
                    margin: EdgeInsets.only(top: 20,bottom: 12),
                    height: 40,
                    child: Observer(builder: (_){
                      return RaisedButton(
                        color: Colors.orange,
                        disabledColor: Colors.orange.withAlpha(120),
                        child: loginStore.loading? CircularProgressIndicator()
                            :
                        Text('Entrar'),
                        textColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onPressed: loginStore.loginPressed,
                      );
                    }),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Text(
                          'Não tem uma conta?',
                          style: TextStyle(fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignupScreen()));
                          },
                          child: Text(
                            'Cadastre-se',
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
