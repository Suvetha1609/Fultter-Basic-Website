import 'package:flutter/material.dart';

class appikorn_list_view extends StatelessWidget {
  const appikorn_list_view({required this.child, required this.count, this.controller, this.reversed, this.shrink, this.padding, this.horizondal});

  final child;
  final int count;
  final ScrollController? controller;
  final bool? reversed;
  final bool? horizondal;
  final bool? shrink;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      controller: controller,
      reverse: reversed ?? false,
      shrinkWrap: shrink ?? false,
      scrollDirection: (horizondal == null || horizondal == false) ? Axis.vertical : Axis.horizontal,
      slivers: [
        SliverPadding(
          padding: padding ?? EdgeInsets.zero,
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, position) => Container(
                child: child(index: position),
              ),
              childCount: count,
            ),
          ),
        ),
      ],
    );
  }
}
