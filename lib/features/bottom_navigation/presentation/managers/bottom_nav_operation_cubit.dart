import 'package:bloc/bloc.dart';

import '../../../../exports.dart';
import '../../../authentication/presentation/managers/auth_cubit.dart';

class BottomNavOperationCubit extends Cubit<int> {
  BottomNavOperationCubit() : super(0);
  GlobalKey<ScaffoldState>? scaffoldKey;

  closeDrawer() {
    scaffoldKey = GlobalKey();
    scaffoldKey?.currentState?.closeDrawer();
  }

  getNewScaffoldKey() {
    scaffoldKey = GlobalKey();
    return scaffoldKey;
  }

  int index = 0;
  changIndex(int index) {
    if(this.index.isNotEqualTo(index)){
      if(index==0){
        Routes.merchantDashboardRoute.moveTo();
      }else if(index==1){
        Routes.merchantPointsSummary.moveTo();
      }else if(index==2){
        Routes.operationsHistoryRoute.moveTo();
      }else if(index==3){
        Routes.merchantSettings.moveTo();
      }
      emit(index);

    }

  }

  goToHome() {
    index = 0;
    emit(index);
    Routes.bottomNavRoute.moveToCurrrentRouteAndRemoveAll;
  }
}
