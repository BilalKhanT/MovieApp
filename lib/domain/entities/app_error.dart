class AppError {
  final String errorMsg;

  AppError(this.errorMsg);

  @override
  List<Object> get props => [errorMsg];
}

