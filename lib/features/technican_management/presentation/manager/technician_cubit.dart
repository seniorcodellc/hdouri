import 'package:hdouri/exports.dart';

import '../../../../core/enums/status_enums.dart';
import '../../data/models/technician_response_model/technician_response_model.dart';
import '../../domain/use_cases/technician_use_case.dart';

class TechnicianCubit extends CubitListView<TechnicianModel> {
  TechnicianUseCase technicianUseCase;
  List<TechnicianModel> activeTechnicians = [];
  List<TechnicianModel> pendingTechnicians = [];
  List<TechnicianModel> suspendedTechnicians = [];
  TechnicianCubit({required this.technicianUseCase})
    : super(listUseCases: technicianUseCase);
  approve(TechnicianModel item)=>executeWithDialog<dynamic>(either: technicianUseCase.approve(item.id!),
      startingMessage: AppStrings.accept, onSuccess: (data) {
      pendingTechnicians.remove(item);
      activeTechnicians.add(item);
      emit(LoadedState(data: pendingTechnicians));
    },);

  suspend(TechnicianModel item)=>
      executeWithDialog<dynamic>(either: technicianUseCase.suspend(item.id!),
      startingMessage: AppStrings.reject, onSuccess: (data) {
      activeTechnicians.remove(item);
      suspendedTechnicians.add(item..status=2);
      emit(LoadedState(data: pendingTechnicians));
    },);
  reactivate(TechnicianModel item)=>
      executeWithDialog<dynamic>(either: technicianUseCase.reactivate(item.id!),
      startingMessage: AppStrings.reactiveTechnician, onSuccess: (data) {
      suspendedTechnicians.remove(item);
      activeTechnicians.add(item..status=1);
      emit(LoadedState(data: pendingTechnicians));
    },);
  filterTechnicians({Status? status}) async {
    if(state is LoadedState){
      print("jjjjjjjjjjjjjj");
      if(status==Status.PENDING){
        list=pendingTechnicians;
      }else if(status==Status.ACTIVE){
        list=activeTechnicians;
      }else{
        list=suspendedTechnicians;
      }
      emit(LoadedState(data: list));

    }else{
      getList(onSuccess: (list) {
        activeTechnicians    = list.where((element) => getStatus(element.status!) == Status.ACTIVE).toList();
        pendingTechnicians = list.where((element) => getStatus(element.status!) == Status.PENDING).toList();
        suspendedTechnicians = list.where((element) => getStatus(element.status!) == Status.SUSPENDED).toList();
        list=activeTechnicians;
        emit(LoadedState(data: list));
      },);
    }
    }

}
