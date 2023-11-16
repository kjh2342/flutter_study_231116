
import 'package:flutter/material.dart';
import 'package:flutter_study_231116/ViewModel/count_viewmodel.dart';
import 'package:provider/provider.dart';
import 'View/page1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    CountViewModel cv = CountViewModel();
    return ChangeNotifierProvider(
      create: (context) => cv,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'title',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
        ),
        home: Page1(title: 'First Page...', countViewModel:cv),
      ),);
  }
}





