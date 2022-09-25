class Token{
  String? status;
  String? message;
  String? cftToken;
  String? error;

  Token.withError(String msg){
    error = msg;
  }
  Token.fromJson(Map<String,dynamic> json){
    status = json["status"];
    message = json["message"];
    cftToken = json["cftoken"];
  }
}