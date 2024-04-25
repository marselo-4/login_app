import 'package:flutter/material.dart';
import 'package:login_app/src/mixins/validation_mixins.dart';
//import 'package:login_app/src/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => new _LoginScreenState();
 }
class _LoginScreenState extends State<LoginScreen> with ValidationMixins {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Container(
      margin: EdgeInsets.all(20.0),
      child: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              emailField(),
              passwordField(),
              Container(margin: EdgeInsets.only(top: 25.0)),
              submitField(),
              registrate(),
            ],
          ),
        ),
      ),
     ),
   );
  }
  

  Widget emailField(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'ejemplo@dominio.com',
      ),
      validator: (String? value) => validateEmail(value!),
      onSaved: (String? value){
        print(value);
      },
    );
  }

  Widget passwordField(){
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        
        labelText: 'Contraseña',
      ),
      validator: (String? value) => validatePassword(value!),
      onSaved: (String? value){
        print(value);
      },
    );
  }

  Widget submitField(){
    return ElevatedButton(
      child: Text('Iniciar Sesión'),
      onPressed: (){
        if(formKey.currentState!.validate()){
          formKey.currentState?.save();
        }
        
      },
    );
  }

  Widget registrate(){
    return Container(
      margin: EdgeInsets.only(top: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '¿No tienes cuenta?',
            style: TextStyle(fontSize: 14.0),
          ),
          SizedBox(width: 10.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(fixedSize: Size(5, 5)),
            child: Icon(Icons.person_add, size: 14.0),
            onPressed: () {
              print('implementar navigator');
              /*Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterScreen()),
              );*/
            },
          ),
        ],
      ),
    );
  }

}