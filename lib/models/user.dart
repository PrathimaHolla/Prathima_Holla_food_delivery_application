class User{
  int userId;
  String userName;
  String userPassword;
  User({
    this.userPassword='',
    this.userId=0,
    this.userName='',
  });

  Map<String,dynamic> toMap(){
    return{
      'userId':userId,
      'userName':userName,
      'userPassword':userPassword,
    };
  }

  @override
  String toString(){
    return 'user{userId:$userId,userName:$userName,userPassword:$userPassword}';
  }
}