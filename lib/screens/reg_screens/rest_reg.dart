import 'package:flutter/material.dart';
import 'package:fooddeliveryapplication/models/restaurant.dart';
import 'package:fooddeliveryapplication/screens/oders_screen/adding_new_item.dart';
import 'package:fooddeliveryapplication/service/rest_service.dart';

class restReg extends StatefulWidget {
  // const restReg({ Key? key }) : super(key: key);

  @override
  _restRegState createState() => _restRegState();
}

class _restRegState extends State<restReg> {
  final _formKey=GlobalKey<FormState>();
  final RestAuth restAuth=new RestAuth();
  Restaurant restaurant=new Restaurant();
  late final int restId;
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
                "Restaurant Register",
                style: TextStyle(
                  color: Colors.red.shade300,
                  fontWeight: FontWeight.w400,
                  fontSize: 24
                ),),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
              child: Text(
                "Restaurant Name",
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
                  return value!.isEmpty?"Enter Restaurant Name":null;
                },
                onSaved: (value){
                 restaurant.restName=value.toString();
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
                  restaurant.restPassword=value.toString();
                },
              ),
            ),
            ElevatedButton(
              onPressed: () async {
              //add to db
                if(_formKey.currentState!.validate()){
                  _formKey.currentState!.save();
                  restaurant.restId=await(restAuth.getcountRest('restaurant')  )+1;
                  print("rest id in rest reg:"+restaurant.restId.toString());
                  await restAuth.addRest(restaurant,'restaurant');
                  // Navigator.pushReplacementNamed(context,'/addingItem');
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>adding_item(restId:restaurant.restId)));
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