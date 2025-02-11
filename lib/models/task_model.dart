class TaskModel{
  String id;
  String tital  ;
  String desciption ;
  String userId ;
  bool isDone;
  int date ;
  int counter ;
  String categry ;
  TaskModel({
   this.id='',
   required this.tital,
   required this.userId,
   required this.desciption,
   required this.date,
   required this.counter,
   this.isDone=false,
   required this.categry,
});
  TaskModel.fromJson(Map<String,dynamic>json):
      this(
        id: json['id'],
        tital: json['tital'],
        userId: json['userId'],
        desciption: json['desciption'],
        date: json['date'],
        counter: json['counter'],
        isDone: json['isDone'],
        categry: json['categry'],
      );
  Map<String,dynamic> toJson(){
    return{
  'id':id,
  'tital': tital,
  'userId': userId,
  'desciption': desciption,
  'date': date,
  'counter': counter,
  'isDone': isDone,
  'categry': categry,
  };
}


}