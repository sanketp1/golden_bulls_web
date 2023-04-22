
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class UserAvatar extends StatelessWidget {
  String url;
  UserAvatar({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
          backgroundImage: NetworkImage(url),
        );
  }
}
