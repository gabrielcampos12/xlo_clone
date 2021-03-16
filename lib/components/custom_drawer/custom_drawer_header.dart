import 'package:flutter/material.dart';
import 'package:xlo/screens/login/login_screen.dart';
class CustomDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pop();
        Navigator.of(context).push(MaterialPageRoute(builder: (_)=> LoginScreen()));
      },
      child: Container(
        color: Colors.purple,
        height: 95,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Icon(Icons.person,color: Colors.white),
            SizedBox(width: 20,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Acesse sua conta agora!'
                  ),
                  Text(
                    'Clique aqui '
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
