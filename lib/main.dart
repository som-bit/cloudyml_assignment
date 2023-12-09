import 'package:cloudymlassignment/app.dart';
import 'package:cloudymlassignment/dynamic_link.dart';
import 'package:cloudymlassignment/firebase_options.dart';
import 'package:cloudymlassignment/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:package_info_plus/package_info_plus.dart';
import 'package:user_repository/user_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // PackageInfo packageInfo = await PackageInfo.fromPlatform();
  // ignore: avoid_print
  // print(packageInfo.packageName);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  DynamicLink().initDynamicLink();
  runApp(MyApp(FirebaseUserRepo()));
}
