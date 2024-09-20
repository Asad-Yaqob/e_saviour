import 'package:e_saviour/models/user.dart';

class City {  
  final String cityId;  
  final String name;  

  City({    
    required this.name,  
  }) : cityId = uuid.v4();  

  Map<String, dynamic> toMap() {  
    return {  
      'cityId': cityId,  
      'name': name,  
    };  
  } 
}