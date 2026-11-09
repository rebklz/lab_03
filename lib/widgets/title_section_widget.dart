import 'package:flutter/material.dart';
import '../viewmodels/cruise_booking_viewmodel.dart';

class TitleSectionWidget extends StatelessWidget {
  final CruiseBookingViewModel viewModel; // Pass ViewModel to get dynamic data

  const TitleSectionWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  viewModel.destination.name,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 8),
                Text(
                  viewModel.destination.location,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          // Interactive Star Icon
          IconButton(
            icon: const Icon(Icons.star, color: Colors.amber),
            onPressed: () => viewModel.incrementStar(), // Calls logic in ViewModel
          ),
          Text('${viewModel.starCount}'),
        ],
      ),
    );
  }
}