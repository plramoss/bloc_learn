class Ticker {
  const Ticker();
  Stream<int> tick({required int ticks}) {
    /// Stream.periodic is necessarily used with Duration to restrict the Stream to happen in that period of time.
    /// take method is used to limit the number of events the stream emits to the number specified by ticks parameter.
    return Stream.periodic(const Duration(seconds: 1), (x) => ticks - x - 1).take(ticks);
  }
}