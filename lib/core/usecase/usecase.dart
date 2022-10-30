import 'package:contracts/core/error/failuer.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<In, Out> {
 Future< Either<Failuer, Out>> excute({required In input});
}
