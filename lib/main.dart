import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notebook/bloc/apiData/api_provider.dart';
import 'package:notebook/bloc/apiData/api_repo.dart';
import 'package:notebook/bloc/ecom_bloc.dart';

import 'screens/hompage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EcomBloc(ApiRepo(ApiProvider())),
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromARGB(255, 209, 32, 141),
            primary: Color.fromARGB(255, 209, 32, 141),
          ),
          // brightness: Brightness.dark,
          iconTheme: IconThemeData(size: 25, color: Colors.blue),
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
