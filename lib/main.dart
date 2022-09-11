import 'package:aartiya/screens/home_screen.dart';
import 'package:aartiya/screens/secondscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'internate_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetCubit(),
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return   Center(
      child: BlocConsumer<InternetCubit, InternateState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state == InternateState.Lost) {
            return Text("not Connecedt");
          } else if (state == InternateState.Gain) {
            return HomeScreen();
          } else {
            return CircularProgressIndicator(
              color: Colors.red,
            );
          }
        },
      ),
    );
      // This trailing comma makes auto-formatting nicer for build methods.

  }
}
