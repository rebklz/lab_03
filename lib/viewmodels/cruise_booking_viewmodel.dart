// lib/viewmodels/cruise_booking_viewmodel.dart
import 'package:flutter/material.dart';
import '../models/cruise_destination.dart';

class CruiseBookingViewModel extends ChangeNotifier {
  // 1. Data Model (The Cruise Info)
  final CruiseDestination destination = CruiseDestination(
    name: 'Rajang River Express Cruise',
    location: 'Sibu Waterfront, Sarawak',
    description: 'Experience the heart of Sibu along Malaysia\'s longest river, the Rajang. Cruise past historic temples, timber hubs, and waterfront settlements.',
    imagePath: 'assets/rajang_river.jpg', // 补上你第一张图里要求的 imagePath
  );

  // 2. State Variables (App status)
  int starCount = 41;
  bool isDarkMode = false;
  DateTime selectedDate = DateTime.now();
  String selectedPackage = 'Private River Cruise';

  // Available packages for dropdown
  final List<String> packages = [
    'Private River Cruise',
    'Sunset Cruise',
    'Sunrise Cruise',
    'Rural Cruise',
    'SMI Park Cruise'
  ];

  // 3. Actions / Logic

  // Increase star count by 1 when clicked
  void incrementStar() {
    starCount++;
    notifyListeners(); // Tells the UI to rebuild
  }

  // Toggle dark/light theme
  void toggleTheme(bool value) {
    isDarkMode = value;
    notifyListeners();
  }

  // Update selected date from date picker
  void updateDate(DateTime newDate) {
    selectedDate = newDate;
    notifyListeners();
  }

  // Update selected cruise package
  void updatePackage(String? newPackage) {
    if (newPackage != null) {
      selectedPackage = newPackage;
      notifyListeners();
    }
  }
}