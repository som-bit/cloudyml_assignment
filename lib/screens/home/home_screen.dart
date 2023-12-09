import 'package:cloudymlassignment/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:cloudymlassignment/dynamic_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome, you are In !'),
        actions: [
          IconButton(
              onPressed: () {
                context.read<SignInBloc>().add(const SignOutRequired());
              },
              icon: const Icon(Icons.login))
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Add your button click logic here
           
            DynamicLink().createLink("abcdeef").then((value) {
              Share.share(value);
               // ignore: avoid_print
               print("this is the link = $value");
            });
           
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(8.0), // Adjust the border radius
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Click Me',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
