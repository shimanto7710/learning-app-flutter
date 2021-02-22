import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app_flutter/ui/home/bloc/home_event.dart';
import 'package:learning_app_flutter/ui/home/bloc/home_state.dart';

// class HomeBloc extends Bloc<HomeEvent, HomeState> {
//
//
//   @override
//   // TODO: implement initialState
//   HomeState get initialState => CheckListEmpty();
//
//   @override
//   Stream<ApplicationState> mapEventToState(ApplicationEvent event) async* {
//     if (event is FetchApplication) {
//       yield ApplicationLoading();
//
//       try {
//         final Application application =
//         await applicationRepository.fetchApplication();
//         yield ApplicationLoaded(application: application);
//       } catch (_) {
//         ApplicationError();
//       }
//     }
//   }
// }