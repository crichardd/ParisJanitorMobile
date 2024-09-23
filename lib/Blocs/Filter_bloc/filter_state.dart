import 'package:equatable/equatable.dart';

class FilterState extends Equatable {
  final List<String> activeFilters;

  const FilterState({this.activeFilters = const []});

  @override
  List<Object?> get props => [activeFilters];

  FilterState copyWith({List<String>? activeFilters}) {
    return FilterState(
      activeFilters: activeFilters ?? this.activeFilters,
    );
  }
}