import 'package:flutter/material.dart';
import 'package:fooddeliveryapplication/models/user.dart';
import 'package:fooddeliveryapplication/screens/oders_screen/available_rest.dart';
import 'package:fooddeliveryapplication/service/user_service.dart';

class custReg extends StatefulWidget {
  // const custReg({ Key? key }) : super(key: key);

  @override
  _custRegState createState() => _custRegState();
}

class _custRegState extends State<custReg> {
  late final int userId;
  final _formKey=GlobalKey<FormState>();
  final UserAuth userAuth=new UserAuth();
  User user=new User();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade300,
        title: Text("Foodies!"),
        centerTitle: true,
      ),
      body: Form(
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
                "Customer Name",
                style:TextStyle(
                  color: Colors.red.shade300,
                  fontSize: 20,
                )
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
              child: TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  labelText:"Name",
                  labelStyle: TextStyle(
                    color: Colors.red.shade300
                  )
                ),
                validator: (value){
                  return value!.isEmpty?"Enter your Name":null;
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
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  labelText:"Password",
                  labelStyle: TextStyle(
                    color: Colors.red.shade300
                  )
                ),
                validator: (value){
                  return value!.isEmpty?"Enter Password":null;
                },
                onSaved: (value){
                  user.userPassword=value.toString();
                },
              ),
            ),
            ElevatedButton(
              onPressed: () async {
              //add to db
                if(_formKey.currentState!.validate()){
                  _formKey.currentState!.save();
                  user.userId=await(userAuth.getcountUser('user')  )+1;
                  print("rest id in rest reg:"+user.userId.toString());
                  await userAuth.addUser(user,'user');
                  // Navigator.pushReplacementNamed(context,'/addingItem');
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>availableRest(userId:user.userId)));
                }
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