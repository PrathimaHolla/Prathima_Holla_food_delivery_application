import 'package:flutter/material.dart';
import 'package:fooddeliveryapplication/database/database_helper.dart';
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
  // late Future<List<Restaurant>> res;
  late List<Restaurant> restaurants;
  int countRest=0;
  @override
  void initState() {
    // TODO: implement initState
    print("in init");
    initiateFunction();
    super.initState();
    
  }
Future<void> initiateFunction() async {
    // TODO: implement initState
    print("In initiate function!");
    // res=restAuth.getAllRest() ;
    restaurants=await DatabaseHelper.instance.getAllRest();
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

                width: MediaQuery.of(context).size.width,
                height:MediaQuery.of(context).size.height,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: countRest,
                  itemBuilder: (context,index){
                    return 
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height:100,
                      padding: EdgeInsets.fromLTRB(20,10,20,10),
                      decoration: BoxDecoration(
                        color: Colors.red.shade100,
                        border: Border.all(color: Colors.red.shade300,width: 2.0),
                        shape: BoxShape.rectangle,
                      ),
                      alignment:Alignment.center,
                      child: Text(
                        restaurants[index].restName,
                        // 'aa',
                        style:TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.w400
                        ),
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