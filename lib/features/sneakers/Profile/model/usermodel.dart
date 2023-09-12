class User{
  final String imagePath;
  final String  name;
  final String email;
  final String about;
  final bool isDarkMode;
  const User({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.about,
    required this.isDarkMode,
  });
  User copy({
 String? imagePath, String? name,String?email,String?password,String?about,bool?isDarkTheme
})=>User(email:email??this.email, about:about??this.about,name:name??this.name,imagePath:imagePath??this.imagePath,
      isDarkMode:isDarkMode??this.isDarkMode



  );
  static User fromjson(Map<String,dynamic>json)=>User(imagePath:json['imagePath'],
      name:json['name'],email: json['email'], isDarkMode:json['isDarkMode'],about: json['about']
  );

    // and for storing all user model data locally in our device
// we need to create a method to json and with this  to json method we convert our user object to this json map
  Map<String,dynamic> toJson()=>{
    'imagePath':imagePath,
    'name':name,
    'email':email,
    'about':about,
    'isDarkMode':isDarkMode,
  };

}