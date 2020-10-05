import 'dart:async';
import 'dart:math';
import 'package:Scaleindia/ApiModel/employee_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      // ignore: deprecated_member_use
      Firestore.instance.collection('users');
  final StreamController<List<Employee>> _employeeController =
      StreamController<List<Employee>>.broadcast();
  Future createUser(Employee employee) async {
    try {
      // ignore: deprecated_member_use
      await _usersCollectionReference
          .document(employee.id)
          .setData(employee.toJson());
    } catch (e) {
      return e.message;
    }
  }

  Future getUser(String uid) async {
    try {
      // ignore: deprecated_member_use
      var userData = await _usersCollectionReference.document(uid).get();
      return Employee.fromData(userData.data());
    } catch (e) {
      return e.message;
    }
  }

  Stream listenToPostRealtime() {
    _usersCollectionReference.snapshots().listen((event) {
      // ignore: deprecated_member_use
      if (event.documents.isNotEmpty) {
        // ignore: deprecated_member_use
        var userdetails = event.documents
            .map((snapshot) => Employee.fromData(
                  snapshot.data(),
                ))
            .where((element) => 
                  element.name != null,
                )
            .toList();
        _employeeController.add(userdetails);
      }
    });
    return _employeeController.stream;
  }
}
