import 'dart:async';
import 'package:Scaleindia/ApiModel/company_sourcing.dart';
import 'package:Scaleindia/ApiModel/employee_api.dart';
import 'package:Scaleindia/ApiModel/employee_candidate_sourcing.dart';
import 'package:Scaleindia/ApiModel/employer_api.dart';
import 'package:Scaleindia/ApiModel/rpl-4_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReferenceEmployee =
      FirebaseFirestore.instance.collection('Employees');
  final CollectionReference _employeeCandidateCollectionReference =
      FirebaseFirestore.instance.collection('ECAS');
  final CollectionReference _companySourcingCollectionReference =
      FirebaseFirestore.instance.collection('ComapnySourcing');
  final CollectionReference _usersCollectionReferenceEmployer =
      FirebaseFirestore.instance.collection('Employers');
  final CollectionReference _usersCollectionReferenceRPL4 =
      FirebaseFirestore.instance.collection('RPL-4');
  final StreamController<List<Employee>> _employeeController =
      StreamController<List<Employee>>.broadcast();
  final StreamController<List<Employer>> _employerController =
      StreamController<List<Employer>>.broadcast();
  final StreamController<List<Rpl4>> _rpl4Controller =
      StreamController<List<Rpl4>>.broadcast();
  final StreamController<List<ComapanySourcing>> _compnaysSourcingController =
      StreamController<List<ComapanySourcing>>.broadcast();
  final StreamController<List<EmployeeCandidateSourcing>>
      _employeeCandidateSourcingController =
      StreamController<List<EmployeeCandidateSourcing>>.broadcast();
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
            .where(
              (element) => element.companyName != null,
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
            .where(
              (element) => element.name != null,
            )
            .toList();
        _employeeController.add(userdetails);
      }
    });
    return _employeeController.stream;
  }

  Future createRPL4(Rpl4 rpl4) async {
    try {
      await _usersCollectionReferenceRPL4.doc(rpl4.id).set(rpl4.toJson());
    } catch (e) {
      return e.message;
    }
  }

  Future getRPL4(String uid) async {
    try {
      var userData = await _usersCollectionReferenceRPL4.doc(uid).get();
      return Rpl4.fromData(userData.data());
    } catch (e) {
      return e.message;
    }
  }

  Stream listenToPostRealtimeRpl4() {
    _usersCollectionReferenceRPL4.snapshots().listen((event) {
      if (event.docs.isNotEmpty) {
        var userdetails = event.docs
            .map((snapshot) => Rpl4.fromData(
                  snapshot.data(),
                ))
            .where(
              (element) => element.phoneNumber != null,
            )
            .toList();
        _rpl4Controller.add(userdetails);
      }
    });
    return _rpl4Controller.stream;
  }

  Future addPost(EmployeeCandidateSourcing employeeCandidateSourcing) async {
    try {
      await _employeeCandidateCollectionReference
          .add(employeeCandidateSourcing.toMap());
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future getPostsOnceOff() async {
    try {
      var employeeCandidateDocumentSnapshot =
          await _employeeCandidateCollectionReference.get();
      if (employeeCandidateDocumentSnapshot.docs.isNotEmpty) {
        return employeeCandidateDocumentSnapshot.docs
            .map((snapshot) =>
                EmployeeCandidateSourcing.fromMap(snapshot.data(), snapshot.id))
            .where((mappedItem) => mappedItem.name != null)
            .toList();
      }
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Stream listenToPostsRealTimeECAS() {
    // Register the handler for when the posts data changes
    _employeeCandidateCollectionReference.snapshots().listen((postsSnapshot) {
      if (postsSnapshot.docs.isNotEmpty) {
        var posts = postsSnapshot.docs
            .map((snapshot) =>
                EmployeeCandidateSourcing.fromMap(snapshot.data(), snapshot.id))
            .where((mappedItem) => mappedItem.name != null)
            .toList();

        // Add the posts onto the controller
        _employeeCandidateSourcingController.add(posts);
      }
    });

    return _employeeCandidateSourcingController.stream;
  }

  Future deletePost(String documentId) async {
    await _employeeCandidateCollectionReference.doc(documentId).delete();
  }

  Future updatePost(EmployeeCandidateSourcing employeeCandidateSourcing) async {
    try {
      await _employeeCandidateCollectionReference
          .doc(employeeCandidateSourcing.documentId)
          .update(employeeCandidateSourcing.toMap());
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future addPostCs(ComapanySourcing comapanySourcing) async {
    try {
      await _companySourcingCollectionReference.add(comapanySourcing.toMap());
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future getPostsOnceOffCs() async {
    try {
      var companysourcingDocumentSnapshot =
          await _companySourcingCollectionReference.get();
      if (companysourcingDocumentSnapshot.docs.isNotEmpty) {
        return companysourcingDocumentSnapshot.docs
            .map((snapshot) =>
                ComapanySourcing.fromMap(snapshot.data(), snapshot.id))
            .where((mappedItem) => mappedItem.companyname != null)
            .toList();
      }
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Stream listenToPostsRealTimeCs() {
    // Register the handler for when the posts data changes
    _companySourcingCollectionReference.snapshots().listen((postsSnapshot) {
      if (postsSnapshot.docs.isNotEmpty) {
        var posts = postsSnapshot.docs
            .map((snapshot) =>
                ComapanySourcing.fromMap(snapshot.data(), snapshot.id))
            .where((mappedItem) => mappedItem.companyname != null)
            .toList();

        // Add the posts onto the controller
        _compnaysSourcingController.add(posts);
      }
    });

    return _compnaysSourcingController.stream;
  }

  Future deletePostCs(String documentId) async {
    await _companySourcingCollectionReference.doc(documentId).delete();
  }

  Future updatePostCs(ComapanySourcing comapanySourcing) async {
    try {
      await _companySourcingCollectionReference
          .doc(comapanySourcing.documentId)
          .update(comapanySourcing.toMap());
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }
}
