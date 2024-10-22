import 'package:fpdart/fpdart.dart';
import 'package:meragi_assignment/core/error/failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;
typedef ResultVoid = ResultFuture<void>;
