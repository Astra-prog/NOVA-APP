import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'widgets/app_error_widget.dart';
import 'widgets/app_loading_widget.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  final AsyncValue<T> value;
  final Widget Function(T data) data;

  const AsyncValueWidget({super.key, required this.value, required this.data});

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      error: (e, st) => AppErrorWidget(
        message: e.toString(),
        onRetry: () {
          // Retry logic can be passed if needed, or handled by parent
        },
      ),
      loading: () => const AppLoadingWidget(),
    );
  }
}
