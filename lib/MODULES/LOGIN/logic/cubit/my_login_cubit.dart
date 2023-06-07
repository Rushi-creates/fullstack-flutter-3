import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_login_state.dart';

class MyLoginCubit extends Cubit<MyLoginState> {
  MyLoginCubit() : super(MyLoginInitial());
}
