// ignore: file_names
class Monitory {
  late DateTime dateTime;
  late String message;
  late String location;
  late String image;

  Monitory({required this.dateTime, required this.message, required this.location, required this.image});
  Monitory.fromJson(Map<String, dynamic> json): 
    dateTime = DateTime.now(), 
    message = json['message'], 
    location = json['location'], 
    image = json['image'];
}