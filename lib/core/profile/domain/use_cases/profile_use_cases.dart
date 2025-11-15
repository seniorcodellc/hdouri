import '../../data/repositories/profile_repo_impl.dart';
import 'package:hdouri/exports.dart';

import '../repositories/profile_repo.dart';

class ProfileUseCases extends GenericUseCases{
  ProfileRepo profileRepo;
  ProfileUseCases({required this.profileRepo}):super(genericRepo:profileRepo);

}
