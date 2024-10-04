
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'internet_state.dart';

class InternetCubit extends Cubit<InternetState>{

  late Connectivity connectivity;
  late StreamSubscription connectivitySubscription;

  InternetCubit({required this.connectivity})
      : assert (connectivity != null),super(InternetLoading()) {

      connectivitySubscription = connectivity.onConnectivityChanged.listen((event) {

        if(event == ConnectivityResult.wifi){
          emit(InternetConnected(ConnectionType.wifi));
        }else if(event == ConnectivityResult.mobile){
          emit(InternetConnected(ConnectionType.mobile));
        }else if (event == ConnectivityResult.none) {
          emit(InternetDisConnected());
        }
      });
  }

  @override
  Future<void> close() {
    connectivitySubscription.cancel();
    return super.close();
  }
}