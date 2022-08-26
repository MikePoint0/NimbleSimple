part of 'main_cubit.dart';


abstract class MainState {}

class PharmacyListInitial extends MainState {}

class PharmacyListLoading extends MainState {}


class PharmacyListSuccess extends MainState {}

class PharmacyListError extends MainState {
  final String message;
  PharmacyListError(this.message);
}

class PharmacyDetailsInitial extends MainState {}

class PharmacyDetailsLoading extends MainState {}


class PharmacyDetailsSuccess extends MainState {}

class PharmacyDetailsError extends MainState {
  final String message;
  PharmacyDetailsError(this.message);
}

class DrugListInitial extends MainState {}

class DrugListLoading extends MainState {}


class DrugListSuccess extends MainState {}

class DrugListError extends MainState {
  final String message;
  DrugListError(this.message);
}
