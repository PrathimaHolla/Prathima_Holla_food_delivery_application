import 'package:flutter/material.dart';
import 'package:fooddeliveryapplication/models/restaurant.dart';

class restReg extends StatefulWidget {
  // const restReg({ Key? key }) : super(key: key);

  @override
  _restRegState createState() => _restRegState();
}

class _restRegState extends State<restReg> {
  final _formKey=GlobalKey<FormState>();
  Restaurant restaurant=new Restaurant();
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
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  labelText:"Name",
                  labelStyle: TextStyle(
                    color: Colors.red.shade300
                  )
                ),
                validator: (value){
                  return value!.isEmpty?"Enter Name":null;
                },
                onSaved: (value){
                 restaurant.restaurantName=value.toString();
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
                  labelText:"Name",
                  labelStyle: TextStyle(
                    color: Colors.red.shade300
                  )
                ),
                validator: (value){
                  return value!.isEmpty?"Enter Password":null;
                },
                onSaved: (value){
                  restaurant.password=value.toString();
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