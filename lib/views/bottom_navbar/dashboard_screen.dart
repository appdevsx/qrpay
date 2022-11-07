import 'package:flutter/material.dart';
import 'package:qrpay/utils/assets.dart';

class DashBordScreen extends StatelessWidget {
  const DashBordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.dashboard),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // _bodyWidget(context),
      ],
    ));
  }

  // _bodyWidget(BuildContext context) {
  //   return Column(
  //     children: const [Center(child: Text("lskdf"))],
  //   );
  // }
}
