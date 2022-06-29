import 'package:deriv_dot_com_flutter/core/models/binanry_symbol_model.dart';
import 'package:deriv_dot_com_flutter/core/socket_client.dart';

class Repository {
  Repository({SocketClient? client}) : _client = client ?? SocketClient();

  final SocketClient _client;

  Stream<BinanrySymbolModel> getSymbols() => _client.fetchSymbols();
}
