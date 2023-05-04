import 'package:equatable/equatable.dart';

class NavStates extends Equatable {
  final int index;
  const NavStates({this.index =0});

  NavStates copyWith({int? index}) {
    return NavStates(index: index ?? this.index);
  }
  @override
  List<Object?> get props => [index];
}