


import '../../exports.dart';

bool checkNullError(BuildContext context ,dynamic field, Errors error) {
  if (field == null) {
    BlocProvider.of<ErrorCubit>(context).addValidatorError(error);
    return true;
  } else if (field != null) {
    if (BlocProvider.of<ErrorCubit>(context).errors.contains(error)) {
      BlocProvider.of<ErrorCubit>(context).removeError(error);
    }
  }
  return false;
}

bool checkBoolError(BuildContext context,  dynamic field, Errors error) {
  if (field == false) {
    BlocProvider.of<ErrorCubit>(context).addValidatorError(error);
    return true;
  } else if (field != false) {
    if (BlocProvider.of<ErrorCubit>(context).errors.contains(error)) {
      BlocProvider.of<ErrorCubit>(context).removeError(error);
    }
  }
  return false;
}

removeError(BuildContext context, Errors error) {
  if (BlocProvider.of<ErrorCubit>(context).errors.contains(error)) {
    BlocProvider.of<ErrorCubit>(context).removeError(error);
  }
}

checkZeroError(BuildContext context, dynamic field, Errors error) {
  if (field == 0) {
    BlocProvider.of<ErrorCubit>(context).addValidatorError(error);
  } else if (field != null) {
    if (BlocProvider.of<ErrorCubit>(context).errors.contains(error)) {
      BlocProvider.of<ErrorCubit>(context).removeError(error);
    }
  }
}

checkEmptyError(BuildContext context, List? field, Errors error) {
  if (field.isNotNull && field.isEmpty) {
    BlocProvider.of<ErrorCubit>(context).addValidatorError(error);
  } else if (field != null) {
    if (BlocProvider.of<ErrorCubit>(context).errors.contains(error)) {
      BlocProvider.of<ErrorCubit>(context).removeError(error);
    }
  }
}checkStringError(BuildContext context, String? field, Errors error) {
  if (field.isNull || field!.isEmpty) {
    BlocProvider.of<ErrorCubit>(context).addValidatorError(error);
  } else  {
    if (BlocProvider.of<ErrorCubit>(context).errors.contains(error)) {
      BlocProvider.of<ErrorCubit>(context).removeError(error);
    }
  }
}

bool dontHaveErrors(BuildContext context) => BlocProvider.of<ErrorCubit>(context).errors.isEmpty;
