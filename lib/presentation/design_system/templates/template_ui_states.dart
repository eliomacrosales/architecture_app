import 'package:architecture/core/networking/api_response.dart';
import 'package:flutter/material.dart';

class TemplateUIStates<T> extends StatelessWidget {
  /// data siempre será de tipo APIResponse<T>
  final T? data;
  final bool isLoading;
  final Widget Function() loadingBuilder;
  final Widget Function(T data) dataBuilder;
  final Widget Function(String? error) errorBuilder;

  const TemplateUIStates({
    Key? key,
    this.data,
    required this.isLoading,
    required this.loadingBuilder,
    required this.dataBuilder,
    required this.errorBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return loadingBuilder();
    } else if (!(data as APIResponse).error) {
      return dataBuilder(data as T);
    } else {
      return errorBuilder((data as APIResponse).errorMessage);
    }
  }
}
