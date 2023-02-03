class BuyerModel {
  final String uid;
  final String name;
  final String email;
  final String phone;
  final String address;
  final String profilePicture;

  BuyerModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.profilePicture,
  });

  Map<String, dynamic> getJson() => {
    'uid': uid,
    'name': name,
    'email': email,
    'phone': phone,
    'address':address,
    'profilePicture':profilePicture,
  };

  factory BuyerModel.getModelFromJson(Map<String, dynamic> json) {
    return BuyerModel(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      profilePicture: json['profilePicture'],
    );
  }
}