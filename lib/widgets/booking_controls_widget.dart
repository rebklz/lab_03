import 'package:flutter/material.dart';
import '../viewmodels/cruise_booking_viewmodel.dart';

class BookingControlsWidget extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const BookingControlsWidget({super.key, required this.viewModel});

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: viewModel.selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      viewModel.updateDate(picked); // Update date via ViewModel
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Interactive Settings', style: TextStyle(fontWeight: FontWeight.bold)),
              const Divider(),

              // 1. Visit Date Picker
              ListTile(
                leading: const Icon(Icons.calendar_month),
                title: const Text('Cruise Date'),
                subtitle: Text('${viewModel.selectedDate.day}/${viewModel.selectedDate.month}/${viewModel.selectedDate.year}'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () => _selectDate(context),
              ),

              // 2. Cruise Package Dropdown
              ListTile(
                leading: const Icon(Icons.sailing),
                title: const Text('Cruise Package'),
                trailing: DropdownButton<String>(
                  value: viewModel.selectedPackage,
                  items: viewModel.packages.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) => viewModel.updatePackage(newValue),
                ),
              ),

              // 3. Dark Mode Toggle
              SwitchListTile(
                secondary: const Icon(Icons.dark_mode),
                title: const Text('Dark Mode Theme'),
                value: viewModel.isDarkMode,
                onChanged: (bool value) => viewModel.toggleTheme(value),
              ),
            ],
          ),
        ),
      ),
    );
  }
}