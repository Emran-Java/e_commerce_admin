import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

FirebaseOptions firebaseOptions = Platform.isAndroid
    ? const FirebaseOptions(
/*
    apiKey: "AIzaSyAMGeU3ED95eGbyeDs5M9bj0DfvoPbav8M",
    appId: "1:659567255881:android:1378caa1bcce1ce0",
    messagingSenderId: "659567255881",
    projectId: "demoproject-3181b");
*/
        apiKey: "AIzaSyDhR3NeUzipvZQRf5uTcBfJRVv0QAFnz_0",
        appId: "1:597088027164:android:6353d24d6df140eac295d9",
        messagingSenderId: "597088027164",
        projectId: "flutterdemo-eb011")
    : const FirebaseOptions(
        apiKey: "AIzaSyDhR3NeUzipvZQRf5uTcBfJRVv0QAFnz_0",
        appId: "1:597088027164:android:6353d24d6df140eac295d9",
        messagingSenderId: "597088027164",
        projectId: "flutterdemo-eb011");
