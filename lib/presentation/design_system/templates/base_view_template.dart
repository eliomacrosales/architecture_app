import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseViewTemplate<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child)? builder;
  final Widget? child;
  final T controller;
  final void Function(T)? initPage;

  const BaseViewTemplate({this.builder, Key? key, required this.controller, this.initPage, this.child}) : super(key: key);

  @override
  _BaseViewTemplateState<T> createState() => _BaseViewTemplateState<T>();
}

class _BaseViewTemplateState<T extends ChangeNotifier> extends State<BaseViewTemplate<T>> {
  @override
  void initState() {
    super.initState();
    widget.initPage?.call(widget.controller);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (BuildContext context) => widget.controller,
      child: Consumer<T>(
        builder: widget.builder!,
        child: widget.child,
      ),
    );
  }
}
