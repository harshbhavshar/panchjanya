class DataModel{
  String? title;
  String? name;
  String? url;
  String? type;
  String? img;
  DataModel({
    required this.title,
    required this.name,
    required this.url,
    required this.type,
    required this.img,
  });
  DataModel.fromJson(Map<String,dynamic> json){
  {
  title = json['title'];
  name = json['name'];
  url = json['url'];
  type = json['type'];
  img = json['img'];
  }
  }
}
