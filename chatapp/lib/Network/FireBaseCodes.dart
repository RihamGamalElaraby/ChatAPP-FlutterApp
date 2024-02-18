import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> Register(
    {required String email,
    required String password,
    required BuildContext context}) async {
  try {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    print(user.user!.displayName);
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Done Created')));
  } on FirebaseException catch (e) {
    print(e);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.toString())));
  }
}

Future<void> Login(
    {required String email,
    required String password,
    required BuildContext context}) async {
  try {
    var auth = FirebaseAuth.instance;
    UserCredential user =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    print(user.user!.displayName);
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Done Login')));
  } on FirebaseException catch (e) {
    print(e);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.toString())));
  }
}

Future<void> firestoreAddMessage({required messege}) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference messeges =
      FirebaseFirestore.instance.collection('messeges');
  messeges.add({
    'messege': messege,
  });
}
