import 'package:flutter/material.dart';

class SnapshotBuilder<T> extends StatelessWidget {
  const SnapshotBuilder(
      {super.key,
      required this.snapshot,
      required this.success,
      this.loading,
      this.errorMessage = 'Something went wrong',
      this.error});

  final AsyncSnapshot<T> snapshot;
  final Widget Function(BuildContext context, T data) success;
  final Widget? loading;
  final Widget? error;
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return loading ?? const Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
      return error ?? Center(child: Text(errorMessage));
    } else {
      return success(context, snapshot.data as T);
    }
  }
}

class FutureSnapshotBuilder<T> extends StatelessWidget {
  const FutureSnapshotBuilder(
      {super.key,
      required this.future,
      required this.success,
      this.loading,
      this.errorMessage = 'Something went wrong',
      this.error});

  final Future<T> future;
  final Widget Function(BuildContext context, T data) success;
  final Widget? loading;
  final Widget? error;
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        return SnapshotBuilder<T>(
          snapshot: snapshot,
          success: success,
          loading: loading,
          error: error,
          errorMessage: errorMessage,
        );
      },
    );
  }
}

class StreamSnapshotBuilder<T> extends StatelessWidget {
  const StreamSnapshotBuilder(
      {super.key,
      required this.stream,
      required this.success,
      this.loading,
      this.errorMessage = 'Something went wrong',
      this.error});

  final Stream<T> stream;
  final Widget Function(BuildContext context, T data) success;
  final Widget? loading;
  final Widget? error;
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: stream,
      builder: (context, snapshot) {
        return SnapshotBuilder<T>(
          snapshot: snapshot,
          success: success,
          loading: loading,
          error: error,
          errorMessage: errorMessage,
        );
      },
    );
  }
}
