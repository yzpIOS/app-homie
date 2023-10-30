abstract class DataAdapter<T> {
  final T data;

  const DataAdapter(this.data);

  //是否直播中
  bool get isShowOnline => false;
}
