import 'package:flutter_bloc/flutter_bloc.dart';

import 'filter_event.dart';
import 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(const FilterState()) {

    on<AddFilter>((event, emit) {
      final updatedFilters = [event.filter];
      emit(state.copyWith(activeFilters: updatedFilters));
    });

    on<RemoveFilter>((event, emit) {
      final updatedFilters = List<String>.from(state.activeFilters)
        ..remove(event.filter);
      emit(state.copyWith(activeFilters: updatedFilters));
    });
  }
}
