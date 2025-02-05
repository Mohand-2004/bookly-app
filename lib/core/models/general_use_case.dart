abstract class GeneralUseCase<T,P> {
  Future<T> execute(P param);
}