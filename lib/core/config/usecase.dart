import '../constant/type_def.dart';

abstract class UseCase<Type, P extends Params> {
  DataResponse<Type> call(P params);
}

mixin Params {
  BodyMap getBody() => {};

  QueryParams getParams() => {};
}

class NoParams with Params {}
