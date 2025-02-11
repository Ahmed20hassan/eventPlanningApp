class UserMolde{
  String id;
  String name;
  String email;
  int createdAt;
  UserMolde({required this.id,required this.name,required this.email,required this.createdAt});
  UserMolde.fromJson(Map<String,dynamic>json):this(
    id: json['id'],
    name: json['name'],
    email: json['email'],
    createdAt: json['createdAt'],
  );
  Map<String,dynamic>toJson(){
   return{
     'id': id,
     'name': name,
     'email': email,
     'createdAt': createdAt,
   };
  }
}