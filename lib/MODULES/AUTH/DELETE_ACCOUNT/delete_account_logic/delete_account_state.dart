part of 'delete_account_bloc.dart';

abstract class DeleteAccountState extends Equatable {
  const DeleteAccountState();

  @override
  List<Object> get props => [];
}

class DeleteAccountInitial extends DeleteAccountState {}

class DeleteAccountLoadingState extends DeleteAccountState {}

class DeleteAccountSuccessState extends DeleteAccountState {}

class DeleteAccountFailureState extends DeleteAccountState {}
