import 'package:meta/meta.dart';

abstract class UseCase<P, R> {
  @protected
  Future<R> getRawFuture({
    P params,
  });

  Future<R> getFuture({
    P params,
  }) =>
      getRawFuture(
        params: params,
      ).catchError(
        (error) => throw error,
      );
}
