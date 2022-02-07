class Restaurant{
  String restName;
  String restPassword;
  int restId;
  Restaurant({
    this.restPassword='',
    this.restName='',
    this.restId=0,
  });

  Map<String,dynamic> toMap(){
    return{
      'restId':restId,
      'restName':restName,
      'restPassword':restPassword,
    };
  }

  @override
  String toString(){
    return 'restaurant{restId:$restId,restName:$restName,restPassword:$restPassword}';
  }
}