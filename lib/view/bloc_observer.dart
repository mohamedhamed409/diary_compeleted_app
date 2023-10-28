import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('Change is : ${change.toString()}');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    debugPrint('onClose : ${bloc.toString()}');
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
        debugPrint('onCreate : ${bloc.toString()}');

  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
            debugPrint('onError : ${bloc.toString()}');

  }

}
