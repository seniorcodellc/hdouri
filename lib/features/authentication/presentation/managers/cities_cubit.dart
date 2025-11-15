import 'package:bloc/bloc.dart';
import 'package:hdouri/config/models/item_response_model.dart';
import 'package:hdouri/config/states/cubit_states.dart';

class CitiesCubit extends Cubit<CubitStates>{
  List<ItemModel> cities=[];
  CitiesCubit():super(InitialState());
  setCities(List<ItemModel> cities){
    this.cities=cities;
    emit(CubitStates());
  }
}