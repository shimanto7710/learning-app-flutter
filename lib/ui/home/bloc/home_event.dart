import 'package:equatable/equatable.dart';

//Base Class for Bloc Event extends Equatable to make it comparable
abstract class HomeEvent extends Equatable{

}

class IsListEmptyEvent extends HomeEvent{

  @override
  // TODO: implement props
  List<Object> get props => [];
}


class GetListEvent extends HomeEvent{

  @override
  // TODO: implement props
  List<Object> get props => [];
}