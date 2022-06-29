import 'dart:convert';

import 'package:deriv_dot_com_flutter/core/models/binanry_symbol_model.dart';
import 'package:web_socket_channel/io.dart';

class SocketClient {
  SocketClient({
    IOWebSocketChannel? tickerChannel,
    IOWebSocketChannel? symbolsChannel,
    String url = _baseUrl,
  })  : _tickerChannel = tickerChannel ?? IOWebSocketChannel.connect(url),
        _symbolsChannel = symbolsChannel ?? IOWebSocketChannel.connect(url);
  static const _baseUrl =
      'wss://frontend.binaryws.com/websockets/v3?l=EN&app_id=1089&brand=binary';

  final IOWebSocketChannel _tickerChannel;
  final IOWebSocketChannel _symbolsChannel;

  void disconnect() {
    _tickerChannel.sink.close();
    _symbolsChannel.sink.close();
  }

  void handleError() {
    _tickerChannel.stream.handleError((onError) => print(onError));
    _symbolsChannel.stream.handleError((onError) => print(onError));
  }

  /// get symbols
  Stream<BinanrySymbolModel> fetchSymbols() {
    final req = json.encode(
      {
        'active_symbols': 'brief',
        'product_type': 'basic',
      },
    );

    _symbolsChannel.sink.add(req);

    return _symbolsChannel.stream
        .map((event) => BinanrySymbolModel.fromJson(event));
  }

  /// get ticks for symbols

}
