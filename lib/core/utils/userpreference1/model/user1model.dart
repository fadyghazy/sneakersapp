class User1{

  final double price;

  const User1({
    required this.price
  });
  User1 copy({
   required double price
  })=>User1(price:this.price,




  );
  static User1 fromjson(Map<String,dynamic>json)=>User1(price: json['price']
  );

  // and for storing all user model data locally in our device
// we need to create a method to json and with this  to json method we convert our user object to this json map
  Map<String,dynamic> toJson()=>{
    'price':price
  };

}