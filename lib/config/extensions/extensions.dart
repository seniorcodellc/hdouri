

import '../../exports.dart';


extension StringExtension on String? {
  String get removeSpaces => validate.replaceAll(' ', '');
  String get trans => validate.tr();
  double get toDouble => this != null ? double.parse(this!) : 0;
  int get toInt => this != null ? int.parse(this!) : 0;
  List<String>? get toList => this != null ? [this!] : null;
  File? get toFile => this != null ? File(this!) : null;

  int get codeFromString {
    String formattedStringColor = removeSpaces;
    if (formattedStringColor.startsWith('#')) {
      formattedStringColor = formattedStringColor.replaceAll('#', '');
    } else if (formattedStringColor.startsWith('0x')) {
      formattedStringColor = formattedStringColor.replaceAll('0x', '');
    } else if (formattedStringColor.startsWith('0X')) {
      formattedStringColor = formattedStringColor.replaceAll('0X', '');
    }
    formattedStringColor = formattedStringColor.isLengthEqual(6) ? formattedStringColor.addAtStart('FF') : formattedStringColor;
    return int.parse(formattedStringColor, radix: 16);
  }

  Color get colorFromString {
    String formattedStringColor = removeSpaces.toUpperCase();
    if (formattedStringColor.startsWith('#')) {
      formattedStringColor = formattedStringColor.replaceAll('#', '');
    } else if (formattedStringColor.startsWith('0x')) {
      formattedStringColor = formattedStringColor.replaceAll('0x', '');
    } else if (formattedStringColor.startsWith('0X')) {
      formattedStringColor = formattedStringColor.replaceAll('0X', '');
    }
    formattedStringColor = formattedStringColor.isLengthEqual(6) ? formattedStringColor.addAtStart('FF') : formattedStringColor;
    return Color(int.parse(formattedStringColor, radix: 16));
  }

  dynamic get fromStringToJson => jsonDecode(validate);
  String get capitalize => validate.toUpperCase();
  String addAtStart(String start) => "$start$this";
  bool isLengthEqual(int length) => validate.length == length;

  /// Returns true if given String is null or isEmpty
  String get validate {
    if (isNullOrEmpty) {
      return '';
    } else {
      return this!;
    }
  }

  Color get toColor {
    String formattedStringColor = removeSpaces.toUpperCase();
    if (formattedStringColor.startsWith('#')) {
      formattedStringColor = formattedStringColor.replaceAll('#', '');
    } else if (formattedStringColor.startsWith('0x')) {
      formattedStringColor = formattedStringColor.replaceAll('0x', '');
    } else if (formattedStringColor.startsWith('0X')) {
      formattedStringColor = formattedStringColor.replaceAll('0X', '');
    }
    formattedStringColor = formattedStringColor.isLengthEqual(6) ? formattedStringColor.addAtStart('FF') : formattedStringColor;
    return Color(int.parse(formattedStringColor, radix: 16));
  }

  bool get validateOtp {
    if (isNullOrEmpty || validate.length < AppConstants.otpLength) {
      return false;
    }
    return true;
  }

  String? get validateSendMassage {
    if (validate.isEmpty) {
      return "AppStrings.massageError";
    }
    return null;
  }

  bool isJson() {
    try {
      json.decode(validate);
    } catch (e) {
      return false;
    }
    return true;
  }

  isEqualTo(value) => validate == value;
  isNotEqualTo(value) => validate != value;
  get getBack => pop();

  Future<T?> moveToAndRemoveCurrent<T>({Map<String, dynamic>? args}) =>
      pushRoute<T>(validate, isToReplace: true, arguments: args);
  moveToWithArgs<T>(Map<String, dynamic> args) => pushRoute<T>(validate, arguments: args);

  Future<T?> moveTo<T>() => pushRoute<T>(validate);

  Future<T?> pushAndRemoveAllUntil<T>() => pushRoute<T>(validate, isNewTask: true);

  pushReplacementWithData(Map<String, dynamic>? arguments) => pushRoute(validate, isToReplace: true, arguments: arguments);

  pushWithData(Map<String, dynamic>? arguments) => pushRoute(validate, arguments: arguments);

  pushAndRemoveAllWithDataUntil(Map<String, dynamic>? arguments) => pushRoute(validate, isNewTask: true, arguments: arguments);
  popScreen([Object? object]) => pop(object);
  popScreenWithArgument([Object? object]) => pop(object);

  //get moveToCurrrentRouteAndRemoveAllExceptHome => pushRoute(this, isNewTask: true, exceptRoute: Routes.home);
  moveToCurrrentRouteAndRemoveAllExceptThisRoute(String exceptRoute) =>
      pushRoute(validate, isNewTask: true, exceptRoute: exceptRoute);
  get moveToCurrrentRouteAndRemoveAll => pushRoute(validate, isNewTask: true);
  get pushReplacement => pushRoute(validate, isToReplace: true);
  get push => pushRoute(validate);
  bool get isNotNull => this != null;
  bool get isNull => this == null;
  bool get isNotNullOrEmpty => this != null && this!.isNotEmpty;
  bool get isNullOrEmpty => this == null || this!.isEmpty;
  bool get validateNetworkAsset {
    if (isNotNull && this!.contains("http")) {
      return true;
    }
    return false;
  }

  bool get validateIsNetworkAsset => this!.contains("http");

  bool get validatePhone =>
      Inspection().inspect(this, 'required|numeric|min:8|max:10', message: AppStrings.phoneError.trans, name: this).isNullOrEmpty
          ? true
          : false;
  bool get validateName => isNullOrEmpty ? false : true;
  bool get isEmail {
    const String emailRegex =
        '^([\\w\\d\\-\\+]+)(\\.+[\\w\\d\\-\\+%]+)*@([\\w\\-]+\\.){1,5}(([A-Za-z]){2,30}|xn--[A-Za-z0-9]{1,26})\$';
    var regExp = RegExp(emailRegex);
    return regExp.hasMatch(this!);
  }

  bool get validateEmail {
    if (isNullOrEmpty || !isEmail) {
      return false;
    }
    return true;
  }

  bool get validatePassword {
    if (isNullOrEmpty || this!.trim().isEmpty || this!.length < AppConstants.passwordLength) {
      return false;
    }
    return true;
  }

  bool validateConfirmPassword(String? password) {
    if (validate.isEqualTo(password)) {
      return true;
    }
    return false;
  }
// String get tr => isNotNull ? AppLocalizations.tr(context)anslate(this!)! : "";
}

extension CutomMethodsOnNullObject on Object? {
  get toArabic => arabicNumber.convert(this);

  String get fromJsonToString => jsonEncode(this);
  bool get isNull => this == null;
  bool get isNotNull => this != null;
  bool get isNotNullAndIsFalse => this != null && this == false;
  bool get isNotNullAndIsTrue => this != null && this == true;
  bool get isNullOrIsFalse => this == null || this == true;
  bool get isNotNullOrFalse => this != null || this != true;
  bool get isNotFalse => this != false;
  bool get isNotTrue => this != true;
  bool get isTrue => (this as bool?).orFalse == true;
  bool get isFalse => (this as bool?).orFalse == false;
  Widget isNotNullGetWidget(Widget? widget) => isNotNull ? widget! : const SizedBox.shrink();
}

extension CutomMethodsOnNullList on List? {
  bool get isEmpty => this == null || this!.isEmpty;
  bool get isNotNullOrEmpty => this != null && this!.isNotEmpty;
  bool get isNullOrEmpty => this == null || this!.isEmpty;
  T? firstWhereOrNull<T>(bool Function(T) test) {
    for (T element in this!) {
      if (test(element)) {
        return element;
      }
    }
    return null;
  }
}

extension IntNullExtension on int? {
  /// Validate given int is not null and returns given value if null.
  bool get toBool => this != null
      ? this == 1
          ? true
          : false
      : false;
  int get validate => this ?? 0;

  /// Returns microseconds duration
  /// 5.microseconds
  Duration get microseconds => Duration(microseconds: validate);

  /// Returns milliseconds duration
  /// ```dart
  /// 5.milliseconds
  /// ```

  /// Returns seconds duration
  /// ```dart
  /// 5.seconds
  /// ```
  Duration get seconds => Duration(seconds: validate);

  /// Returns minutes duration
  /// ```dart
  /// 5.minutes
  /// ```
  Duration get minutes => Duration(minutes: validate);

  /// Returns hours duration
  /// ```dart
  /// 5.hours
  /// ```
  Duration get hours => Duration(hours: validate);

  /// Returns days duration
  /// ```dart
  /// 5.days
  /// ```
  Duration get days => Duration(days: validate);
  Duration get milliseconds => Duration(milliseconds: validate);
  SizedBox get vs => SizedBox(height: validate.toDouble().h);
  SizedBox get hs => SizedBox(width: validate.toDouble().w);
  EdgeInsetsDirectional get ph => EdgeInsetsDirectional.fromSTEB(validate.toDouble(), 0, validate.toDouble(), 0);
  EdgeInsetsDirectional get pv => EdgeInsetsDirectional.fromSTEB(0, validate.toDouble(), 0, validate.toDouble());
  bool isSuccessful() => validate >= 200 && validate <= 206;
  int get toPositive => validate < 0 ? validate * -1 : validate;
  bool get isZero => orZero == 0;
  get orZero => this ?? 0;
  get isNotZero => orZero != 0;
}

extension BullBoolExtension on bool? {
  /* null false , false false */
  bool get orFalse => this == null ? false : this!;
  bool get orTrue => this == null ? true : this!;
  int get fromBoolToInt => this == true ? 1 : 0;
  bool get isTrue => this == true;
  bool get isFalse => this == false;
}

extension BoolExtension on bool {
  /* null false , false false */
  bool get isFalse => this == false;
  bool get isTrue => this == true;
  Widget isTrueGetWidget(Widget widget) => isTrue ? widget : const SizedBox.shrink();
  Widget? isTrueGetWidgetOrAnotherWidget(Widget widget1, Widget widget2) => isTrue ? widget1 : widget2;
}

/* json decode and encode*/
extension MapExtension on Map<String, dynamic> {}

extension DateTimeExtension on DateTime? {
  /*validate*/
  /* string to date time */
  /* formate */
}

extension DynamicExtension on dynamic {
  Map<String, dynamic> get json => jsonDecode(this);
  isEqualTo(value) => this == value;
  isNotEqualTo(value) => this != value;
}

extension MediaQueryValues on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  double get topPadding => MediaQuery.of(this).viewPadding.top;
  double get bottom => MediaQuery.of(this).viewInsets.bottom;
}

extension DoubleExtension on double? {
  // double get h => getVerticalSize();
  // double get w => getHorizontalSize(this.validate);
  // double get r => getVerticalSize(this.validate);
  double get validate => this ?? 0;
  SizedBox get vs => SizedBox(height: this.validate.h);
  SizedBox get hs => SizedBox(width: this.validate.w);
  num get removeLastZero {
    if (this.validate.truncateToDouble() == this) {
      return this.validate.toStringAsFixed(0).toInt;
    } else {
      return double.parse(this.validate.toStringAsFixed(2));
    }
  }
// double get w=>getSize(this);
}

extension ListItemsModelExtension on List<ItemModel>? {
  setSelectedItem(ItemModel item) => this
      .validate
      .firstWhere(
        (element) => element.id == item.id,
      )
      .isSelected = true;
  List<ItemModel> get copy => this
      .validate
      .map<ItemModel>(
        (element) => element.copyWith,
      )
      .toList();

  List<ItemModel> get copyWithAll {
    ItemModel all = ItemModel(
      name: AppStrings.all.trans,
      isSelected: true,
    );
    List<ItemModel> list = [all];
    list.addAll(this
        .validate
        .map<ItemModel>(
          (element) => element.copyWith,
        )
        .toList());
    return list;
  }

  get clearExceptAll {
    this![0].isSelected = true;
    for (int index = 1; index < this!.length; index++) {
      this![index].isSelected = false;
    }
  }

  get deselectAll {
    for (int index = 0; index < this!.length; index++) {
      this![index].isSelected = false;
    }
  }

  get selectAll {
    for (int index = 0; index < this!.length; index++) {
      this![index].isSelected = true;
    }
  }

  List<ItemModel> get getAllSelectedItems => this!
      .where(
        (element) => element.isSelected == true,
      )
      .toList()
      .map(
        (e) => e,
      )
      .toList();
  List<String> get getStrings => this!
      .where((element) => element.isSelected == true)
      .toList()
      .map(
        (e) => e.name.validate,
      )
      .toList();
  List<String> get getNames => this!.map((e) => e.name.validate).toList();
  bool get hasActiveItems => this!.sublist(1).any(
        (element) => element.isSelected.isTrue,
      );
  String get getText => getStrings.join(" ");
  List<ItemModel> get validate => this != null ? this! : <ItemModel>[];
  activateItem(int id) {
    this.validate.deselectAll;
    return this
        .validate
        .firstWhere(
          (element) => element.id == id,
        )
        .isSelected = true;
  }
}

extension ListItemNumberModelExtensions on List<ItemNumberModel>? {
  bool get isNotNullAndNotAllZeros =>
      this != null &&
      this!
          .where(
            (element) => element.number.orZero == 0,
          )
          .isEmpty;
  List<ItemNumberModel> get copy => this
      .validate
      .map<ItemNumberModel>(
        (element) => element.copyWith,
      )
      .toList();

  List<ItemNumberModel> get copyWithAll {
    ItemNumberModel all = ItemNumberModel(
      name: AppStrings.all.trans,
      isSelected: true,
    );
    List<ItemNumberModel> list = [all];
    list.addAll(this
        .validate
        .map<ItemNumberModel>(
          (element) => element.copyWith,
        )
        .toList());
    return list;
  }

  get clearExceptAll {
    this![0].isSelected = true;
    for (int index = 1; index < this!.length; index++) {
      this![index].isSelected = false;
    }
  }

  get deselectAll {
    for (int index = 0; index < this!.length; index++) {
      this![index].isSelected = false;
    }
  }

  List<ItemModel> get getAllSelectedItems => this!
      .where(
        (element) => element.isSelected == true,
      )
      .toList()
      .map(
        (e) => e,
      )
      .toList();
  List<String> get getStrings => this!
      .where((element) => element.isSelected == true)
      .toList()
      .map(
        (e) => e.name.validate,
      )
      .toList();
  List<String> get getNames => this!.map((e) => e.name.validate).toList();
  bool get hasActiveItems => this!.sublist(1).any(
        (element) => element.isSelected.isTrue,
      );
  String get getText => getStrings.join(" ");
  List<ItemNumberModel> get validate => this != null ? this! : <ItemNumberModel>[];
  activateItem(int id) {
    this.validate.deselectAll;
    return this
        .validate
        .firstWhere(
          (element) => element.id == id,
        )
        .isSelected = true;
  }
}

extension ListItemImageModelExtensions on List<ItemImageModel>? {
  List<ItemImageModel> get copy => this
      .validate
      .map<ItemImageModel>(
        (element) => element.copyWith,
      )
      .toList();

  List<ItemNumberModel> get copyWithAll {
    ItemNumberModel all = ItemNumberModel(
      name: AppStrings.all.trans,
      isSelected: true,
    );
    List<ItemNumberModel> list = [all];
    list.addAll(this
        .validate
        .map<ItemNumberModel>(
          (element) => element.copyWith,
        )
        .toList());
    return list;
  }

  get clearExceptAll {
    this![0].isSelected = true;
    for (int index = 1; index < this!.length; index++) {
      this![index].isSelected = false;
    }
  }

  get deselectAll {
    for (int index = 0; index < this!.length; index++) {
      this![index].isSelected = false;
    }
  }

  List<ItemModel> get getAllSelectedItems => this!
      .where(
        (element) => element.isSelected == true,
      )
      .toList()
      .map(
        (e) => e,
      )
      .toList();
  List<String> get getStrings => this!
      .where((element) => element.isSelected == true)
      .toList()
      .map(
        (e) => e.name.validate,
      )
      .toList();
  List<String> get getNames => this!.map((e) => e.name.validate).toList();
  bool get hasActiveItems => this!.sublist(1).any(
        (element) => element.isSelected.isTrue,
      );
  String get getText => getStrings.join(" ");
  List<ItemImageModel> get validate => this != null ? this! : <ItemImageModel>[];
  activateItem(int id) {
    this.validate.deselectAll;
    return this
        .validate
        .firstWhere(
          (element) => element.id == id,
        )
        .isSelected = true;
  }
}

