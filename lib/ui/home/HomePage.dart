import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app_flutter/ui/home/bloc/home_bloc.dart';
import 'package:learning_app_flutter/ui/home/bloc/home_state.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc _homeBloc;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    //Close the Stream Sink when the widget is disposed
    _homeBloc?.close();
  }

  @override
  Widget build(BuildContext context) {
    //Initializing Bloc Sink by using BlocProvider
    _homeBloc = BlocProvider.of<HomeBloc>(context);

    return BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(10),
            // color: Colors.grey[200],
            child: ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: ((state as ListState).userList.length),
              itemBuilder: (context, index) {
                return Container();
              },
            ),
          );
        }

    );
  }
}
