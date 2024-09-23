import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Blocs/Filter_bloc/filter_bloc.dart';
import '../../../../Blocs/Filter_bloc/filter_event.dart';

class FilterBarIcon extends StatelessWidget {
  const FilterBarIcon(
      {super.key, required this.label, required this.filterIcon});

  final String label;
  final Icon filterIcon;

  @override
  Widget build(BuildContext context) {
    final isSelected =
        context.read<FilterBloc>().state.activeFilters.contains(label);
    return Container(
      width: 80.0, // Largeur fixe pour tous les filtres
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FilterChip(
            label: filterIcon,
            selected: isSelected,
            onSelected: (bool selected) {
              if (selected) {
                context.read<FilterBloc>().add(AddFilter(label));
              } else {
                context.read<FilterBloc>().add(RemoveFilter(label));
              }
            },
          ),
          SizedBox(height: 4.0), // Espace entre l'icône et le label
          Expanded(
            child: Center(
              child: Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.blue : Colors.black,
                  fontSize: 12.0,
                ),
                textAlign: TextAlign.center, // Centrer le texte
                overflow: TextOverflow.ellipsis, // Ajouter une ellipse si le texte est trop long
              ),
            ),
          ),
        ],
      ),
    );
  }
}
