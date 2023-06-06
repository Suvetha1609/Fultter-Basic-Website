import 'package:newwatt/export.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class appikorn_circle_image extends StatelessWidget {
  const appikorn_circle_image({Key? key, this.url, this.size}) : super(key: key);

  final String? url;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: new BorderRadius.circular(1000.0),
      child: CachedNetworkImage(
        imageUrl: url ?? "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHw%3D&w=1000&q=80",
        placeholder: (context, url) => CircleAvatar().shimmer(),
        fit: BoxFit.cover,
      ),
    ).wh(size ?? 30, size ?? 30);
  }
}
