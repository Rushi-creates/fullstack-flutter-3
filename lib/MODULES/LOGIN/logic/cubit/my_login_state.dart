part of 'my_login_cubit.dart';

abstract class MyLoginState extends Equatable {
  MyLoginState();

  @override
  List<Object> get props => [
        createFormKey,
        emailController,
        passwordController,
      ];

/* -------------------------------------------------------------------------- */
/*                               //@ TextFields                               */
/* -------------------------------------------------------------------------- */

  final createFormKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
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

class MyLoginInitial extends MyLoginState {}
