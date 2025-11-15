
import '../../../../exports.dart';

class CubitDataView<Model> extends Cubit<CubitStates>{
  final GenericUseCases genericUseCases;
  Model? model;
  CubitDataView({required this.genericUseCases}):super(InitialState());
  getData({num? id, dynamic query})=>managerExecute<Model>(genericUseCases.getData(query: query,id: id),
  onFail: (message) => emit(FailedState(message: message)),
  onSuccess:(Model? data) {

    model=data;
    emit(LoadedState<Model>(data: model!));
  }, 
  );
}