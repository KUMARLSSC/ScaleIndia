import 'dart:async';
import 'package:Scaleindia/ApiModel/employee_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
     
     FirebaseFirestore.instance.collection('users');
  final StreamController<List<Employee>> _employeeController =
      StreamController<List<Employee>>.broadcast();
  Future createUser(Employee employee) async {
    try {
      await _usersCollectionReference
          .doc(employee.id)
          .set(employee.toJson());
    } catch (e) {
      return e.message;
    }
  }

  Future getUser(String uid) async {
    try {
      
      var userData = await _usersCollectionReference.doc(uid).get();
      return Employee.fromData(userData.data());
    } catch (e) {
      return e.message;
    }
  }

  Stream listenToPostRealtime() {
    _usersCollectionReference.snapshots().listen((event) {
     
      if (event.docs.isNotEmpty) {
       
        var userdetails = event.docs
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
