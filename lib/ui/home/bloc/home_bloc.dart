import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app_flutter/ui/home/bloc/home_event.dart';
import 'package:learning_app_flutter/ui/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(initialState);



  @override
  // TODO: implement initialState
  HomeState get initialState {
    CheckListEmpty(isListEmpty: false);
    ListState(userList: []);
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is IsListEmptyEvent) {
      bool isEmpty = (state as CheckListEmpty).isListEmpty;
      yield CheckListEmpty();

      // try {
      //   final Application application =
      //   await applicationRepository.fetchApplication();
      //   yield ApplicationLoaded(application: application);
      // } catch (_) {
      //   ApplicationError();
      // }
    }
    else if(event is GetListEvent){

    }
  }
}