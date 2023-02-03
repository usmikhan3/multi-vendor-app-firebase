import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_vendor/models/buyer_model.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;


  loginUsers(String email, String password) async {
    String res = 'something went wrong';

    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);

        res = 'Account logged in successfully';
      } else {
        res = 'Fields must not be empty';
      }
    }on FirebaseAuthException catch (e) {
      res = e.message.toString();
    }

    return res;
  }


  Future<String> signUpUsers(
      {required String email,
      required String fullName,
      required String phoneNumber,
      required String password,
      required Uint8List image}) async {
    String res = 'Some error occurred';

    try {
      if (email.isNotEmpty &&
          fullName.isNotEmpty &&
          phoneNumber.isNotEmpty &&
          password.isNotEmpty &&
          image.isNotEmpty) {
        //create users
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        String profileImageUrl = await _uploadProfileImageToStorage(image);
        BuyerModel buyerModel = BuyerModel(
          uid: cred.user!.uid,
          name: fullName,
          email: email,
          phone: phoneNumber,
          address: '',
          profilePicture: profileImageUrl,
        );

        await _firestore
            .collection('buyers')
            .doc(cred.user!.uid)
            .set(buyerModel.getJson());

        res = "Account created successfully";
      } else {
        res = 'All fields are required';
      }
    } on FirebaseAuthException catch (e) {
      print(e.message.toString());
    }
    return res;
  }

  _uploadProfileImageToStorage(Uint8List? image) async {
    Reference ref =
        _storage.ref().child('profilePics').child(_auth.currentUser!.uid);

    UploadTask uploadTask = ref.putData(image!);

    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();

    return downloadUrl;
  }

  pickProfileImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();

    XFile? _file = await _imagePicker.pickImage(source: source);

    if (_file != null) {
      return await _file.readAsBytes();
    } else {
      print('No Image Selected');
    }
  }
}
