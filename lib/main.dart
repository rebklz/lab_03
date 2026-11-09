// lib/main.dart
import 'package:flutter/material.dart';
import 'viewmodels/cruise_booking_viewmodel.dart';
import 'views/cruise_booking_screen.dart';

void main() {
  runApp(const RajangCruiseApp());
}

class RajangCruiseApp extends StatefulWidget {
  const RajangCruiseApp({super.key});

  @override
  State<RajangCruiseApp> createState() => _RajangCruiseAppState();
}

class _RajangCruiseAppState extends State<RajangCruiseApp> {
  // Initialize the ViewModel ONCE at the top level
  final CruiseBookingViewModel _viewModel = CruiseBookingViewModel();

  @override
  Widget build(BuildContext context) {
    // ListenableBuilder listens to ViewModel. 
    // When isDarkMode changes, the whole app theme rebuilds automatically!
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Rajang Cruise MVVM',
          // Dynamically swap theme based on ViewModel state
          themeMode: _viewModel.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          theme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: Colors.indigo,
            brightness: Brightness.light,
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: Colors.indigo,
            brightness: Brightness.dark,
          ),
          // Pass the ViewModel down to the View
          home: CruiseBookingScreen(viewModel: _viewModel),
        );
      },
    );
  }
}