import 'package:Scaleindia/ApiModel/employee_api.dart';
import 'package:Scaleindia/ApiModel/employer_api.dart';
import 'package:Scaleindia/ApiModel/rpl-4_api.dart';
import 'package:Scaleindia/Services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../locator.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = locator<FirestoreService>();
  Employee _currentEmployee;
  Employee get currentEmployee => _currentEmployee;
  Employer _currentEmployer;
  Employer get currentEmployer => _currentEmployer;
  Rpl4 get currentRpl4 => _currentRpl4;
  Rpl4 _currentRpl4;
  String verificationId;

  Future loginWithEmailEmployee({
    @required String employeeEmailAddress,
    @required String password,
  }) async {
    try {
      var authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: employeeEmailAddress,
        password: password,
      );
      await _populateCurrentUserEmployee(authResult.user);
      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future loginWithEmailEmployer({
    @required String companyEmailAddress,
    @required String password,
  }) async {
    try {
      var authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: companyEmailAddress,
        password: password,
      );
      await _populateCurrentUserEmployer(authResult.user);
      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future signUpWithEmailEmployer({
    @required String companyEmailAddress,
    @required String companyAddress,
    @required String password,
    @required String companyName,
    @required String city,
    @required String companyPhoneNumber,
    @required String pointOfContactNumber,
    @required String pointOfContactName,
    @required String pocEmailAdress,
    @required String pincode,
    @required String state,
  }) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: companyEmailAddress,
        password: password,
      );

      _currentEmployer = Employer(
          id: authResult.user.uid,
          city: city,
          companyAddress: companyAddress,
          companyEmailAddress: companyEmailAddress,
          pincode: pincode,
          pointOfContactName: pointOfContactName,
          pointOfContactNumber: pointOfContactNumber,
          state: state,
          companyPhoneNumber: companyPhoneNumber,
          pocEmailAdress: pocEmailAdress,
          companyName: companyName);

      await _firestoreService.createEmployer(_currentEmployer);

      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future signUpWithEmailEmployee({
    @required String employeeEmailAddress,
    @required String address,
    @required String password,
    @required String name,
    @required String motherName,
    @required String fatherName,
    @required String phoneNumber,
    @required String alternatePhoneNumber,
    @required String city,
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
        email: employeeEmailAddress,
        password: password,
      );

      _currentEmployee = Employee(
          id: authResult.user.uid,
          employeeEmailAddress: employeeEmailAddress,
          name: name,
          motherName: motherName,
          fatherName: fatherName,
          dateOfBirth: dateOfBirth,
          city: city,
          gender: gender,
          phoneNumber: phoneNumber,
          aadharNumber: aadharNumber,
          alternatePhoneNumber: alternatePhoneNumber,
          lastCompanyWorkedFor: lastCompanyWorkedFor,
          lastWorkingDesignation: lastWorkingDesignation,
          workExperiance: workExperiance,
          educationalQualification: educationalQualification,
          pincode: pincode,
          state: state,
          address: address);

      await _firestoreService.createEmployee(_currentEmployee);

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

  Future<bool> isUserLoggedInEmployee() async {
    var user = _firebaseAuth.currentUser;
    await _populateCurrentUserEmployee(user);
    return user != null;
  }

  Future _populateCurrentUserEmployee(User user) async {
    if (user != null) {
      _currentEmployee = await _firestoreService.getEmployee(user.uid);
    }
  }

  Future<bool> isUserLoggedInEmployer() async {
    var user = _firebaseAuth.currentUser;
    await _populateCurrentUserEmployer(user);
    return user != null;
  }

  Future _populateCurrentUserEmployer(User user) async {
    if (user != null) {
      _currentEmployer = await _firestoreService.getEmployer(user.uid);
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      print(e);
    }
  }

  Future<void> verifyPhone({
    @required String phoneNo,
    @required String smsCode,
  }) async {
    try {
      final PhoneCodeAutoRetrievalTimeout autoRetrievalTimeout =
          (String verId) {
        this.verificationId = verId;
      };
      final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
        this.verificationId = verId;
      };
      final PhoneVerificationCompleted verificationCompleted =
          (AuthCredential credential) {
        print('Verified');
      };
      final PhoneVerificationFailed phoneVerificationFailed =
          (FirebaseAuthException authException) {
        print('${authException.message}');
      };
      await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: '+91$phoneNo',
          timeout: const Duration(seconds: 30),
          verificationCompleted: verificationCompleted,
          verificationFailed: phoneVerificationFailed,
          codeSent: smsCodeSent,
          codeAutoRetrievalTimeout: autoRetrievalTimeout);
      final AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);
      UserCredential _authResult =
          await _firebaseAuth.signInWithCredential(credential);
      if (_authResult.additionalUserInfo.isNewUser)
        _currentRpl4 = Rpl4(id: _authResult.user.uid, phoneNumber: phoneNo);
      await _populateCurrentUserRpl4(_authResult.user);
      return _authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future<bool> isUserLoggedInRPL4() async {
    var user = _firebaseAuth.currentUser;
    await _populateCurrentUserRpl4(user);
    return user != null;
  }

  Future _populateCurrentUserRpl4(User user) async {
    if (user != null) {
      _currentRpl4 = await _firestoreService.getRPL4(user.uid);
    }
  }
}
