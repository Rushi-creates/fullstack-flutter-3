import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_register_state.dart';

class MyRegisterCubit extends Cubit<MyRegisterState> {
  MyRegisterCubit() : super(MyRegisterInitial());
}
