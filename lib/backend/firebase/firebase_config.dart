import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDf8aHITExIopUnR2FSTWQmPDUch8ETrXM",
            authDomain: "sty-holdings.firebaseapp.com",
            projectId: "sty-holdings",
            storageBucket: "sty-holdings.appspot.com",
            messagingSenderId: "684060832079",
            appId: "1:684060832079:web:36ed0b81a04e2d3eec553a",
            measurementId: "G-4Z6XZ56PL5"));
  } else {
    await Firebase.initializeApp();
  }
}
