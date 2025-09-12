import 'package:flower_app/project_layers/domain_layer/entities/request/add_address_request_entity.dart';

class AddAddressRequestDto {
final String? street;
final String? phone;
final String? city;
final String? lat;
final String? long;
final String? username;
const AddAddressRequestDto({this.street , this.phone , this.city , this.lat , this.long , this.username });
AddAddressRequestDto copyWith({String? street, String? phone, String? city, String? lat, String? long, String? username}){
return AddAddressRequestDto(
            street:street ?? this.street,
phone:phone ?? this.phone,
city:city ?? this.city,
lat:lat ?? this.lat,
long:long ?? this.long,
username:username ?? this.username
        );
        }
        
Map<String,Object?> toJson(){
    return {
            'street': street,
'phone': phone,
'city': city,
'lat': lat,
'long': long,
'username': username
    };
}

static AddAddressRequestDto fromJson(Map<String , Object?> json){
    return AddAddressRequestDto(
            street:json['street'] == null ? null : json['street'] as String,
phone:json['phone'] == null ? null : json['phone'] as String,
city:json['city'] == null ? null : json['city'] as String,
lat:json['lat'] == null ? null : json['lat'] as String,
long:json['long'] == null ? null : json['long'] as String,
username:json['username'] == null ? null : json['username'] as String
    );
}

@override
String toString(){
    return '''AddAddressRequestDto(
                street:$street,
phone:$phone,
city:$city,
lat:$lat,
long:$long,
username:$username
    ) ''';
}

@override
bool operator ==(Object other){
    return other is AddAddressRequestDto && 
        other.runtimeType == runtimeType &&
        other.street == street && 
other.phone == phone && 
other.city == city && 
other.lat == lat && 
other.long == long && 
other.username == username;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                street, 
phone, 
city, 
lat, 
long, 
username
    );
}

  static fromEntity(AddAddressRequestEntity addAddressRequestEntity) {
    return AddAddressRequestDto(
      street: addAddressRequestEntity.street,
      phone: addAddressRequestEntity.phone,
      city: addAddressRequestEntity.city,
      lat: addAddressRequestEntity.lat,
      long: addAddressRequestEntity.long,
      username: addAddressRequestEntity.username,
    );
  }
    
}
      
      
  
     