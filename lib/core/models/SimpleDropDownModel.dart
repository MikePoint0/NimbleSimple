import 'package:nimble_simple/core/models/dropdown_base_model.dart';

class SimpleDropDownModel extends DropdownBaseModel {
  final String name;
  SimpleDropDownModel(this.name);

  @override
  String get displayName => name;
}