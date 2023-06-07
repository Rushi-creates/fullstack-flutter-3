import 'package:flutter/material.dart';

import '../../SERIALIZERS/repositories/user_repo.dart';

class DisplayAccountInfoWidget extends StatelessWidget {
  const DisplayAccountInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return infoCard(context);
  }

  infoCard(context) {
    var dimVar = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          width: dimVar.width * 0.9,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Your Profile",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                    spInfo(),
                  ]),
            ),
          )),
    );
  }

  spInfo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Your email : ${UserSpRepo.instance.get_user()!.email}'),
          Text('Your number : ${UserSpRepo.instance.get_user()!.number}'),
        ],
      ),
    );
  }
}
