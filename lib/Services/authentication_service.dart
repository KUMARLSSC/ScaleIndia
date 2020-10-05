import 'package:Scaleindia/ApiModel/employee_api.dart';
import 'package:Scaleindia/Services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../locator.dart';

class AuthenticationService{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = locator<FirestoreService>();
  Employee _currentUser;
  String verificationId;
  Employee get currentUser => _currentUser;


   Future loginWithEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      var authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _populateCurrentUser(authResult.user);
      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }
  Future signUpWithEmail({
    @required String emailAddress,
    @required String password,
    @required String name,
    @required String motherName,
    @required String fatherName,
    @required String phoneNumber,
    @required String alternatePhoneNumber,
    @required String district,
    @required String pincode,
    @required String state,
    @required String educationalQualification,
    @required String lastCompanyWorkedFor,
    @required String lastWorkingDesignation,
    @required String dateOfBirth,
    @required String gender,
    @required String aadharNumber,
    @required String workExperiance,
  }) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      _currentUser =
          Employee(id: authResult.user.uid, emailAddress: emailAddress,name: name,motherName: motherName,
          fatherName: fatherName,dateOfBirth: dateOfBirth,district: district,gender: gender,
          phoneNumber: phoneNumber,aadharNumber: aadharNumber,alternatePhoneNumber: alternatePhoneNumber,
          lastCompanyWorkedFor: lastCompanyWorkedFor,lastWorkingDesignation: lastWorkingDesignation,workExperiance: workExperiance,
          educationalQualification: educationalQualification,pincode: pincode,state: state
          );

      await _firestoreService.createUser(_currentUser);

      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future sendPasswordResetEmail({
    @required String email,
  }) async {
    try {
      return _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      return e.message;
    }
  }
   Future<bool> isUserLoggedIn() async {
    // ignore: await_only_futures
    var user = await _firebaseAuth.currentUser;
    await _populateCurrentUser(user);
    return user != null;
  }

  // ignore: deprecated_member_use
  Future _populateCurrentUser(FirebaseUser user) async {
    if (user != null) {
      _currentUser = await _firestoreService.getUser(user.uid);
    }
  }
}