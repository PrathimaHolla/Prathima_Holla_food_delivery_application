import 'package:flutter/material.dart';
import 'package:fooddeliveryapplication/models/food_items.dart';

class addingForm extends StatelessWidget {
  final  _formKey=GlobalKey<FormState>();
  final FoodItems foodItems;
  addingForm({
    required this.foodItems
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: MediaQuery.of(context).size.width*.4,
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Food Name",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.red.shade300
                      ),
                    ),
                  ),
                  SizedBox(
                    child: TextFormField( 
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        labelText:"Food Name",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 12
                        )
                      ),
                      validator: (value){
                        return value!.isEmpty?"Enter Name":null;
                      },
                      onSaved: (value){
                        foodItems.foodName=value as String;
                        // print(foodItems.foodName);
                      },
                    ),
                  ),
                ]
              ),
            ),
            Container(
              height: 120,
              width: MediaQuery.of(context).size.width*.3,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Food Price",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.red.shade300
                      ),
                    ),
                  ),
                  SizedBox(
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        labelText:"Food price",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 12
                        )
                      ),
                      validator: (value){
                        return value!.isEmpty?"Enter Price":null;
                      },
                      onSaved: (value){
                      foodItems.foodPrice=double.parse(value.toString());
                      // print(foodItems.price);
                      },
                    ),
                  ),
                ]
              ),
            ),
            Container(
              child: ElevatedButton(
                onPressed: (){
                  if(_formKey.currentState!.validate()){
                    _formKey.currentState!.save();
                  }
                }, 
                child: Text("Add"),
                style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red.shade300),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

