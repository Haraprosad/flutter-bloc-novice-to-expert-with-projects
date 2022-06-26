class Ticker{
  const Ticker();
  Stream<int> tick({required int ticks}){
    return Stream.periodic(const Duration(seconds: 1),(x){
      // print("Ticks : $ticks , X : $x  [Ticks-x-1] = ${ticks-x-1}");// x will start from 0 to ticks-1 .
      return ticks-x-1;
    }).take(ticks);  //take(how many times it will send tick)
  }
}
