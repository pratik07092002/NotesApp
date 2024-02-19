class notemod{
  String? id;
  String? name;
  String? title;
  String? userId;
  String? Description;
  DateTime? CreatedOn;
notemod({this.id,this.name,this.title,this.CreatedOn,this.userId , this.Description});

factory notemod.frommap(Map<String,dynamic> map){
  return notemod(
    id: map["id"],
    name: map["name"],
    title: map["title"],
    userId: map["userId"],
    Description : map["Description"],
    CreatedOn: DateTime.tryParse(map["CreatedOn"])
  );

}

Map<String,dynamic> tomap(){
  return {
    "id" : this.id,
    "name" : this.name,
    "title" : this.title,
    "userId" : this.userId,
    "Description" : this.Description,
    "CreatedOn" : this.CreatedOn!.toIso8601String()

  };
}
}