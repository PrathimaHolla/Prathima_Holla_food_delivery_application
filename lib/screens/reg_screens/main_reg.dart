import 'package:flutter/material.dart';

class mainRegister extends StatefulWidget {
  // const mainRegister({ Key? key }) : super(key: key);

  @override
  _mainRegisterState createState() => _mainRegisterState();
}

class _mainRegisterState extends State<mainRegister> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          
          title: Text("Foodies",style: TextStyle(fontWeight: FontWeight.bold),),
          centerTitle: true,
          toolbarHeight: 100,
          backgroundColor: Colors.red.shade300,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: ElevatedButton(
                  child: Text("Register Restaurant",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red.shade300),
                  ),
                  onPressed: (){
                    print("In register page");
                    Navigator.pushReplacementNamed(context,'/registerRest');
                  },
                ),
              ),

              Container(
                child: ElevatedButton(
                  child: Text("Register Customer",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red.shade300),
                  ),
                  onPressed: (){
                    print("In register page");
                    Navigator.pushReplacementNamed(context,'/registerUser');
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}