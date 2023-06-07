part of 'my_register_cubit.dart';

abstract class MyRegisterState extends Equatable {
  MyRegisterState();

  @override
  List<Object> get props => [
        createFormKey,
        emailController,
        numberController,
        passwordController,
      ];

/* -------------------------------------------------------------------------- */
/*                               //@ TextFields                               */
/* -------------------------------------------------------------------------- */

  final createFormKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  emailValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Email connot be empty';
    } else if (!value.contains('@')) {
      return 'Email should contain @';
    } else if (!value.contains('.com')) {
      return 'Email should contain .com';
    }
    return null;
  }

  numberValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Number cannot be empty';
    } else if (value.length < 10) {
      return 'Length of number must be 10';
    } else if (value.length > 10) {
      return 'Number cannot be more than 10 digits';
    }
    return null;
  }

  passwordValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 4) {
      return 'Password too short';
    }
    return null;
  }

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */
}

class MyRegisterInitial extends MyRegisterState {}
