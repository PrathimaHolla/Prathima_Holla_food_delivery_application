class FoodItems{
  int foodId;
  String foodName;
  double foodPrice;
  int restId;
  FoodItems({
    this.foodId=0,
    this.foodName='',
    this.foodPrice=0.0,
    this.restId=0
  });

  Map<String,dynamic> toMap(){
    return{
      'foodId':foodId,
      'restId':restId,
      'foodName':foodName,
      'foodPrice':foodPrice
    };
  }

  @override
  String toString(){
    return 'user{foodId:$foodId,foodName:$foodName,restId:$restId,foodPrice:$foodPrice}';
  }
}