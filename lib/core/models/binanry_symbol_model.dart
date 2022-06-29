import 'dart:convert';

import 'package:equatable/equatable.dart';

class BinanrySymbolModel with EquatableMixin {
  const BinanrySymbolModel({
    required this.activeSymbols,
    required this.echoReq,
    required this.msgType,
  });

  final List<ActiveSymbol> activeSymbols;
  final EchoReq echoReq;
  final String msgType;

  BinanrySymbolModel copyWith({
    List<ActiveSymbol>? activeSymbols,
    EchoReq? echoReq,
    String? msgType,
  }) {
    return BinanrySymbolModel(
      activeSymbols: activeSymbols ?? this.activeSymbols,
      echoReq: echoReq ?? this.echoReq,
      msgType: msgType ?? this.msgType,
    );
  }

  factory BinanrySymbolModel.fromJson(String str) =>
      BinanrySymbolModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BinanrySymbolModel.fromMap(Map<String, dynamic> json) =>
      BinanrySymbolModel(
        activeSymbols: List<ActiveSymbol>.from(
          json["active_symbols"]?.map(
            (x) => ActiveSymbol.fromMap(x),
          ),
        ),
        echoReq: EchoReq.fromMap(json["echo_req"]),
        msgType: json["msg_type"],
      );

  Map<String, dynamic> toMap() => {
        "active_symbols": List<dynamic>.from(
          activeSymbols.map(
            (x) => x.toMap(),
          ),
        ),
        "echo_req": echoReq.toMap(),
        "msg_type": msgType,
      };

  @override
  List<Object?> get props => [activeSymbols, echoReq, msgType];

  @override
  bool? get stringify => true;
}

class ActiveSymbol {
  ActiveSymbol({
    required this.allowForwardStarting,
    required this.displayName,
    required this.exchangeIsOpen,
    required this.isTradingSuspended,
    required this.market,
    required this.marketDisplayName,
    required this.pip,
    required this.submarket,
    required this.submarketDisplayName,
    required this.symbol,
    required this.symbolType,
  });

  final int allowForwardStarting;
  final String displayName;
  final int exchangeIsOpen;
  final int isTradingSuspended;
  final String market;
  final String marketDisplayName;
  final double pip;
  final String submarket;
  final String submarketDisplayName;
  final String symbol;
  final String symbolType;

  factory ActiveSymbol.fromJson(String str) =>
      ActiveSymbol.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ActiveSymbol.fromMap(Map<String, dynamic> json) => ActiveSymbol(
        allowForwardStarting: json["allow_forward_starting"] ?? 0,
        displayName: json["display_name"] ?? '',
        exchangeIsOpen: json["exchange_is_open"] ?? 0,
        isTradingSuspended: json["is_trading_suspended"] ?? 0,
        market: json["market"] ?? '',
        marketDisplayName: json["market_display_name"] ?? '',
        pip: json["pip"].toDouble() ?? 0.0,
        submarket: json["submarket"] ?? '',
        submarketDisplayName: json["submarket_display_name"] ?? '',
        symbol: json["symbol"] ?? '',
        symbolType: json["symbol_type"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "allow_forward_starting": allowForwardStarting,
        "display_name": displayName,
        "exchange_is_open": exchangeIsOpen,
        "is_trading_suspended": isTradingSuspended,
        "market": market,
        "market_display_name": marketDisplayName,
        "pip": pip,
        "submarket": submarket,
        "submarket_display_name": submarketDisplayName,
        "symbol": symbol,
        "symbol_type": symbolType,
      };
}

class EchoReq {
  EchoReq({
    required this.activeSymbols,
    required this.productType,
  });

  final String activeSymbols;
  final String productType;

  factory EchoReq.fromJson(String str) => EchoReq.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EchoReq.fromMap(Map<String, dynamic> json) => EchoReq(
        activeSymbols: json["active_symbols"],
        productType: json["product_type"],
      );

  Map<String, dynamic> toMap() => {
        "active_symbols": activeSymbols,
        "product_type": productType,
      };
}
