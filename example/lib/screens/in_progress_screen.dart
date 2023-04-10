import 'package:flutter/material.dart';

class InProgressScreen extends StatelessWidget {
  const InProgressScreen({super.key, this.appBarHidden = false});

  final bool appBarHidden;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Раздел находится в разработке'),
    );
  }
}
