import 'package:e_saviour/models/user.dart';

class Hospital {  
  final String hospitalId;  
  final String name;  
  final String cityId; 

  Hospital({  
    required this.name,  
    required this.cityId,  
  }) : hospitalId = uuid.v4();  

  Map<String, dynamic> toMap() {  
    return {  
      'hospitalId': hospitalId,  
      'name': name,  
      'cityId': cityId, 
    };  
  }  
}