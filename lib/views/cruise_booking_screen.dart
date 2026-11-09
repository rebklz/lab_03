// lib/views/cruise_booking_screen.dart
import 'package:flutter/material.dart';
import '../viewmodels/cruise_booking_viewmodel.dart';
// Note: Import all your widgets here!
import '../widgets/header_image_widget.dart';
import '../widgets/title_section_widget.dart';
import '../widgets/action_bar_widget.dart';
import '../widgets/description_widget.dart';
import '../widgets/booking_controls_widget.dart';

class CruiseBookingScreen extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const CruiseBookingScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sibu River Cruise & Heritage'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      // 响应式布局：根据手机横竖自动切换
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return _buildPortraitLayout();
          } else {
            return _buildLandscapeLayout();
          }
        },
      ),
    );
  }

  // Portrait Mode (Single Column)
  Widget _buildPortraitLayout() {
    return ListView(
      children: [
        const HeaderImageWidget(),
        TitleSectionWidget(viewModel: viewModel),
        const ActionBarWidget(),
        DescriptionWidget(viewModel: viewModel),
        BookingControlsWidget(viewModel: viewModel),
      ],
    );
  }

  // Landscape Mode (Side-by-Side)
  Widget _buildLandscapeLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          child: HeaderImageWidget(), // Left pane: Image
        ),
        Expanded(
          child: ListView( // Right pane: All details
            children: [
              TitleSectionWidget(viewModel: viewModel),
              const ActionBarWidget(),
              DescriptionWidget(viewModel: viewModel),
              BookingControlsWidget(viewModel: viewModel),
            ],
          ),
        ),
      ],
    );
  }
}