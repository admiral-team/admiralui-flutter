import 'package:flutter/material.dart';

class InProgress extends StatelessWidget {
  const InProgress({super.key, this.appBarHidden = false});

  final bool appBarHidden;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Раздел находится в разработке'),
    );
  }
}
