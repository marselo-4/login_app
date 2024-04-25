import 'package:flutter/material.dart';
import 'package:login_app/src/mixins/validation_mixins.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => new _RegisterScreenState();
 }
class _RegisterScreenState extends State<RegisterScreen> with ValidationMixins {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
   return new Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            nombre(),
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 25.0)),
            submitField(),
            inicia(),
          ],
        ),
      ),
   );
  }

    Widget nombre(){
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: 'Nombre',
        hintText: 'Nombre',
      ),
      onSaved: (String? value){
        print(value);
      },
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
      child: Text('Registrate'),
      onPressed: (){
        if(formKey.currentState!.validate()){
          formKey.currentState?.save();
        }
        
      },
    );
  }

    Widget inicia(){
    return Container(
      margin: EdgeInsets.only(top: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Ya tienes una cuenta?',
            style: TextStyle(fontSize: 14.0),
          ),
          SizedBox(width: 10.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(fixedSize: Size(5, 5)),
            child: Icon(Icons.person, size: 14.0),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

}