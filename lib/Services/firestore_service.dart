import 'dart:async';
import 'package:Scaleindia/ApiModel/employee_api.dart';
import 'package:Scaleindia/ApiModel/employer_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReferenceEmployee =  
     FirebaseFirestore.instance.collection('Employees');
      final CollectionReference _usersCollectionReferenceEmployer =  
     FirebaseFirestore.instance.collection('Employers');
  final StreamController<List<Employee>> _employeeController =
      StreamController<List<Employee>>.broadcast();
      final StreamController<List<Employer>> _employerController =
      StreamController<List<Employer>>.broadcast();


      Future createEmployer(Employer employer) async {
    try {
      await _usersCollectionReferenceEmployer
          .doc(employer.id)
          .set(employer.toJson());
    } catch (e) {
      return e.message;
    }
  }
Future getEmployer(String uid) async {
    try {
      
      var userData = await _usersCollectionReferenceEmployer.doc(uid).get();
      return Employer.fromData(userData.data());
    } catch (e) {
      return e.message;
    }
  }
  Stream listenToPostRealtimeEmployer() {
    _usersCollectionReferenceEmployer.snapshots().listen((event) {
     
      if (event.docs.isNotEmpty) {
       
        var userdetails = event.docs
            .map((snapshot) => Employer.fromData(
                  snapshot.data(),
                ))
            .where((element) => 
                  element.companyName != null,
                )
            .toList();
        _employerController.add(userdetails);
      }
    });
    return _employerController.stream;
  }
  Future createEmployee(Employee employee) async {
    try {
      await _usersCollectionReferenceEmployee
          .doc(employee.id)
          .set(employee.toJson());
    } catch (e) {
      return e.message;
    }
  }

  Future getEmployee(String uid) async {
    try {
      var userData = await _usersCollectionReferenceEmployee.doc(uid).get();
      return Employee.fromData(userData.data());
    } catch (e) {
      return e.message;
    }
  }

  Stream listenToPostRealtimeEmployee() {
    _usersCollectionReferenceEmployee.snapshots().listen((event) {
     
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
