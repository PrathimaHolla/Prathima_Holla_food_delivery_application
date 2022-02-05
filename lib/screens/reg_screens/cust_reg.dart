import 'package:flutter/material.dart';
import 'package:fooddeliveryapplication/models/user.dart';

class custReg extends StatefulWidget {
  // const custReg({ Key? key }) : super(key: key);

  @override
  _custRegState createState() => _custRegState();
}

class _custRegState extends State<custReg> {
  final _formKey=GlobalKey<FormState>();
  User user=new User();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
              child: Text(
                "Customer Register",
                style: TextStyle(
                  color: Colors.red.shade300,
                  fontWeight: FontWeight.w400,
                  fontSize: 24
                ),),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
              child: Text(
                "Name",
                style:TextStyle(
                  color: Colors.red.shade300,
                  fontSize: 20,
                )
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
              child: TextFormField(
                
                validator: (value){
                  return value!.isEmpty?"Enter Name":null;
                },
                onSaved: (value){
                  user.userName=value.toString();
                },
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
              child: Text(
                "Password",
                style:TextStyle(
                  color: Colors.red.shade300,
                  fontSize: 20,
                )
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
              child: TextFormField(
                validator: (value){
                  return value!.isEmpty?"Enter Password":null;
                },
                onSaved: (value){
                  user.password=value.toString();
                },
              ),
            ),
            ElevatedButton(
              onPressed: (){
              //add to db

              }, 
              child: Text(
                "Register",
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red.shade300)
              ),
            )
          ],
        ),
      ),
    );
  }
}