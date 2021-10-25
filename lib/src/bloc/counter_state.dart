class CounterState{
  int count = 0;

  CounterState(this.count);

  CounterState copy(int? count){
    return CounterState(count ?? this.count);
  }

}