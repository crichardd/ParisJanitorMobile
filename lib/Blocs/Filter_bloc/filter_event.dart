import 'package:equatable/equatable.dart';

abstract class FilterEvent extends Equatable {
  const FilterEvent();

  @override
  List<Object?> get props => [];
}

class AddFilter extends FilterEvent {
  final String filter;

  const AddFilter(this.filter);

  @override
  List<Object?> get props => [filter];
}

class RemoveFilter extends FilterEvent {
  final String filter;

  const RemoveFilter(this.filter);

  @override
  List<Object?> get props => [filter];
}
