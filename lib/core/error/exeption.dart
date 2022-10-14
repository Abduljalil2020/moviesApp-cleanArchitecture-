

import '../network/error_messages_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel ;

 const   ServerException({
 required  this.errorMessageModel
 });
}
//  const ServerException ( {
// required this.errorMessageModel ,
// } ) ;