import 'package:cherubini/config/data_generic/presentation/managers/cubit_data_view.dart';
import 'package:cherubini/core/profile/data/models/profile_response_model.dart';
import 'package:cherubini/core/profile/domain/use_cases/profile_use_cases.dart';

import '../../../../exports.dart';
import '../../../../features/authentication/data/model/response_model/login_response_model.dart';

class ProfileCubit extends CubitDataView<ProfileModel> {
  ProfileCubit({required this.profileUseCases})
    : super(genericUseCases: profileUseCases);
  ProfileUseCases profileUseCases;
}
