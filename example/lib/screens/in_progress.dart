import 'package:flutter/material.dart';

class InProgress extends StatelessWidget {
  const InProgress({Key? key, this.appBarHidden = false}) : super(key: key);
  final bool appBarHidden;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Раздел находится в разработке'),
    );
  }
}
