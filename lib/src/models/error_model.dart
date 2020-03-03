class ErrorModel {
  final bool status;
  final int code;
  final List<String> data;

  ErrorModel({
    this.status,
    this.code,
    this.data,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    var errorJson = json['data'];

    List<String> dataList = errorJson.cast<String>();

    return new ErrorModel(
      status: json['status'],
      code: json['code'],
      data: dataList,
    );
  }
}
