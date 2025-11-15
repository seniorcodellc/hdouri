import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

import 'exports.dart';

class GlobalBlocObserver extends BlocObserver {
  Logger logger = Logger();
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    logger.t("Bloc type-${bloc.runtimeType} created");
  }

  /*





  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      PrettyPrint.log(
        "${bloc.runtimeType} }",
        textColor: PrintColor.white,
        backColor: PrintColor.cyan,
        textWeight: TextWeight.bold,
      );
    }
  }    */
  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    if (kDebugMode) {
      logger.e("${bloc.runtimeType} }");
    }
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    /*    print('onChange Bloc type-- ${bloc.runtimeType}');
    print('onChange Bloc CurrentState-- ${change.currentState}');
    print('onChange Bloc NextState-- ${change.nextState}');
  */
    if (kDebugMode) {
      logger.i('onChange Bloc CurrentState-- ${change.currentState}');
      logger.i('onChange Bloc NextState-- ${change.nextState}');
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    if (kDebugMode) {
      logger.i('onChange Bloc CurrentState-- ${error}');
      logger.i('onChange Bloc NextState-- ${stackTrace.toString()}');
    }
  }
}