
import 'package:equatable/equatable.dart';
import 'package:learning_app_flutter/model/login_model.dart';

//Base class for all the Bloc states
abstract class HomeState extends Equatable{

}

class CheckListEmpty extends HomeState{
  bool isListEmpty;

  CheckListEmpty({this.isListEmpty});

  @override
  // TODO: implement props
  List<Object> get props => [isListEmpty];
}

class ListState extends HomeState{
  List<UserModel> userList=List<UserModel>();

  ListState({this.userList});

  @override
  // TODO: implement props
  List<Object> get props => [userList];
}