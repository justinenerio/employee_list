import 'package:flutter/material.dart';

class Loader extends StatefulWidget {
  const Loader({required this.child, required this.isLoading, super.key});

  final Widget child;
  final bool isLoading;

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  final _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final child = KeyedSubtree(key: _key, child: widget.child);

    return widget.isLoading
        ? WillPopScope(
            onWillPop: () async => false,
            child: Stack(
              children: [
                child,
                const SizedBox.expand(
                  child: ColoredBox(
                    color: Colors.black38,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ),
              ],
            ),
          )
        : child;
  }
}
