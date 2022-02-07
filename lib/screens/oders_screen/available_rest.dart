import 'package:flutter/material.dart';
import 'package:fooddeliveryapplication/models/food_items.dart';
import 'package:fooddeliveryapplication/models/restaurant.dart';
import 'package:fooddeliveryapplication/screens/oders_screen/adding_form.dart';
import 'package:fooddeliveryapplication/service/rest_service.dart';



class availableRest extends StatefulWidget {
  final int userId;
  availableRest({required this.userId});

  @override
  State<availableRest> createState() => _availableRestState();
}

class _availableRestState extends State<availableRest> {
  RestAuth restAuth=new RestAuth();
  late final List<Restaurant> restaurant;
  int countRest=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initiateFunction();
  }
Future<void> initiateFunction() async {
    // TODO: implement initState
    
    restaurant=restAuth.getAllRest() as List<Restaurant>;
    countRest=await restAuth.getcountRest('restaurant');
    print(countRest.toString()+" the number of rest");
  }

  @override
  Widget build(BuildContext contex) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Foodies",style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: Colors.red.shade300,
      ),
      body: ListView(
        children:[
          Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: (){
                
              },
              child:Container(
                width: 500,
                height:200,//change to 500 if needed
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: countRest,
                  itemBuilder: (context,index){
                    return Text(
                      // restaurant[index].restName,
                      countRest.toString(),
                      style:TextStyle(
                        fontSize: 20,
                      ),
                    );
                  }
                ),
              
              )
            )
          ],
        ),
      
        ]
        )
    );
  }
}