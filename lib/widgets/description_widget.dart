import 'package:flutter/material.dart';
import '../viewmodels/cruise_booking_viewmodel.dart';

class DescriptionWidget extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const DescriptionWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Text(
        viewModel.destination.description,
        softWrap: true,
      ),
    );
  }
}