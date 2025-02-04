import 'status.dart';

class ApiRepsonse<T>{

Status? status;

T? data;
String? message;


ApiRepsonse(this.status,this.data,this.message);

 ApiRepsonse.loading() : status = Status.LOADING;

 ApiRepsonse.completed() : status = Status.COMPLETED;

 ApiRepsonse.error() : status = Status.ERROR;

 @override
  String toString(){

  return 'Status: $status \n Message : $message \n Data: $data';
 }

}