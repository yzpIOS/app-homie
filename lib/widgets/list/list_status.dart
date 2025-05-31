class ListStatus {
  final bool isLoading;
  final bool isError;
  final bool isNormal;
  final bool isEmpty;
  final bool isLoadingMore;
  final bool isFinish;
  final dynamic error;

  ListStatus._({
    this.isLoading = false,
    this.isError = false,
    this.isNormal = false,
    this.isEmpty = false,
    this.isLoadingMore = false,
    this.isFinish = false,
    this.error,
  });

  factory ListStatus.loading() {
    return ListStatus._(isLoading: true);
  }

  factory ListStatus.loadingMore() {
    return ListStatus._(isLoadingMore: true);
  }

  factory ListStatus.normal() {
    return ListStatus._(isNormal: true);
  }

  factory ListStatus.error([dynamic e]) {
    return ListStatus._(isError: true, error: e);
  }

  factory ListStatus.empty() {
    return ListStatus._(isEmpty: true);
  }

  factory ListStatus.finish() {
    return ListStatus._(isFinish: true);
  }
}
