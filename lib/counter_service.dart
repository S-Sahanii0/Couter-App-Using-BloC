class CounterService {
  Future<int> getIncrementedNumber(int number) {
    number++;
    return Future.delayed(Duration(seconds: 2), () => Future.value(number));
  }

  Future<int> getDecrementedNumber(int number) {
    number--;
    return Future.delayed(Duration(seconds: 2), () => Future.value(number));
  }
}
