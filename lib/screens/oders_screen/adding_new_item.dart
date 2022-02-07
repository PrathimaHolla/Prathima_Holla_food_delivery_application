

import 'package:flutter/material.dart';
import 'package:fooddeliveryapplication/models/food_items.dart';
import 'package:fooddeliveryapplication/screens/oders_screen/adding_form.dart';
import 'package:fooddeliveryapplication/screens/oders_screen/available_rest.dart';
import 'package:fooddeliveryapplication/service/food_item_service.dart';



class adding_item extends StatefulWidget {
  final int restId;
  adding_item({required this.restId}) ;

  @override
  State<adding_item> createState() => _adding_itemState();
}

class _adding_itemState extends State<adding_item> {
  FoodItems foodItems1=new FoodItems();

  FoodItems foodItems2=new FoodItems();

  FoodItems foodItems3=new FoodItems();

  FoodItems foodItems4=new FoodItems();

  final _formKey=GlobalKey<FormState>();
  FoodAuth foodAuth=new FoodAuth();
  @override
  Widget build(BuildContext contex) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Foodies",style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: Colors.red.shade300,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              height: 120,
              width: 500,
              padding: EdgeInsets.fromLTRB(10, 15, 15, 10),
              child: addingForm(foodItems: foodItems1),
              
            ),
            Container(
              height: 130,
              width: 500,
              padding: EdgeInsets.fromLTRB(10, 15, 15,10),
              child: addingForm(foodItems: foodItems2),
            ),
            Container(
              height: 130,
              width: 500,
              padding: EdgeInsets.fromLTRB(10, 15, 15, 10),
              child: addingForm(foodItems: foodItems3),
              
            ),
            Container(
              height: 130,
              width: 500,
              padding: EdgeInsets.fromLTRB(10, 15, 15,10),
              child: addingForm(foodItems: foodItems4),
            ),
            ElevatedButton(
                onPressed: ()async{
                  // print("restaurant id:"+restId.toString());
                  print(foodItems1.foodName);
                  print(foodItems2.foodPrice);
                  if(foodItems1.foodName!='' && foodItems1.foodPrice!=0){
                    foodItems1.restId=widget.restId;
                    foodItems1.foodId=await foodAuth.getCountAll('foodItems') +1;
                    print("id:"+foodItems1.foodId.toString()+" name:"+foodItems1.foodName+" price"+foodItems1.foodPrice.toString()+" rest: "+foodItems1.restId.toString());
                    foodAuth.addFoodItem(foodItems1,'foodItems');
                  }
                  if(foodItems2.foodName!='' && foodItems2.foodPrice!=0){
                    foodItems2.restId=widget.restId;
                    foodItems2.foodId=await foodAuth.getCountAll('foodItems') +1;
                    print("id:"+foodItems2.foodId.toString()+" name:"+foodItems2.foodName+" price"+foodItems2.foodPrice.toString()+" rest: "+foodItems2.restId.toString());
                    foodAuth.addFoodItem(foodItems2,'foodItems');
                  }
                  if(foodItems3.foodName!='' && foodItems3.foodPrice!=0){
                    foodItems3.restId=widget.restId;
                    foodItems3.foodId=await foodAuth.getCountAll('foodItems') +1;
                    print("id:"+foodItems3.foodId.toString()+" name:"+foodItems3.foodName+" price"+foodItems3.foodPrice.toString()+" rest: "+foodItems3.restId.toString());
                    foodAuth.addFoodItem(foodItems3,'foodItems');
                  }
                  if(foodItems4.foodName!='' && foodItems4.foodPrice!=0){
                    foodItems4.restId=widget.restId;
                    foodItems4.foodId=await foodAuth.getCountAll('foodItems') +1;
                    print("id:"+foodItems4.foodId.toString()+" name:"+foodItems4.foodName+" price"+foodItems4.foodPrice.toString()+" rest: "+foodItems4.restId.toString());
                    foodAuth.addFoodItem(foodItems4,'foodItems');
                  }
                  Navigator.pushReplacementNamed(context,'/');
                }, 
                child: Text("Save"),
                style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red.shade300),
                ),
              )
            
          ],
        ),
      ),
    );
  }
}