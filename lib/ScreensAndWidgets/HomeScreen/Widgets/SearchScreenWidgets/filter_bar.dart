import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Blocs/Filter_bloc/filter_bloc.dart';
import '../../../../Blocs/Filter_bloc/filter_state.dart';
import 'filter_bar_icon.dart';

class FilterBar extends StatefulWidget {
  const FilterBar({super.key});

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  final List<Map<String, dynamic>> filters = const [
    {'label': 'Maison', 'icon': Icons.home},
    {'label': 'Appartement', 'icon': Icons.apartment},
    {'label': 'Piscine', 'icon': Icons.pool},
    {'label': 'Parking', 'icon': Icons.local_parking},
    {'label': 'Wi-Fi', 'icon': Icons.wifi},
    {'label': 'Climatisation', 'icon': Icons.ac_unit},
    {'label': 'Animaux', 'icon': Icons.pets},
    {'label': 'Mer', 'icon': Icons.beach_access},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0, // Hauteur augmentée pour s'adapter aux icônes et labels
      child: BlocBuilder<FilterBloc, FilterState>(
        builder: (context, state) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: filters.map((filter) {
                final isSelected =
                    state.activeFilters.contains(filter['label']);
                return FilterBarIcon(
                  label: filter['label'],
                  filterIcon: Icon(filter['icon']),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
