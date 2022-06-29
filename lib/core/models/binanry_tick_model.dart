import 'dart:convert';

import 'package:equatable/equatable.dart';

class BinanryTickModel with EquatableMixin {
  BinanryTickModel({
    required this.echoReq,
    required this.msgType,
    required this.subscription,
    required this.tick,
  });

  final EchoReq echoReq;
  final String msgType;
  final Subscription subscription;
  final Tick tick;

    BinanryTickModel copyWith({
    EchoReq? echoReq,
    String? msgType,
    Subscription? subscription,
    Tick? tick,
  }) {
    return BinanryTickModel(
      echoReq: echoReq ?? this.echoReq,
      msgType: msgType ?? this.msgType,
      subscription: subscription ?? this.subscription,
      tick: tick ?? this.tick,
    );
  }

  factory BinanryTickModel.fromJson(String str) =>
      BinanryTickModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BinanryTickModel.fromMap(Map<String, dynamic> json) => BinanryTickModel(
        echoReq: EchoReq.fromMap(json["echo_req"]),
        msgType: json["msg_type"],
        subscription: Subscription.fromMap(json["subscription"]),
        tick: Tick.fromMap(json["tick"]),
      );

  Map<String, dynamic> toMap() => {
        "echo_req": echoReq.toMap(),
        "msg_type": msgType,
        "subscription": subscription.toMap(),
        "tick": tick.toMap(),
      };

  @override
  List<Object?> get props => [echoReq, msgType, subscription, tick];

  @override
  bool? get stringify => true;
}

class EchoReq {
  EchoReq({
    required this.subscribe,
    required this.ticks,
  });

  final int subscribe;
  final String ticks;

  factory EchoReq.fromJson(String str) => EchoReq.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EchoReq.fromMap(Map<String, dynamic> json) => EchoReq(
        subscribe: json["subscribe"],
        ticks: json["ticks"],
      );

  Map<String, dynamic> toMap() => {
        "subscribe": subscribe,
        "ticks": ticks,
      };
}

class Subscription {
  Subscription({
    required this.id,
  });

  final String id;

  factory Subscription.fromJson(String str) =>
      Subscription.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Subscription.fromMap(Map<String, dynamic> json) => Subscription(
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
      };
}

class Tick {
  Tick({
    required this.ask,
    required this.bid,
    required this.epoch,
    required this.id,
    required this.pipSize,
    required this.quote,
    required this.symbol,
  });

  final double ask;
  final double bid;
  final int epoch;
  final String id;
  final int pipSize;
  final double quote;
  final String symbol;

  factory Tick.fromJson(String str) => Tick.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Tick.fromMap(Map<String, dynamic> json) => Tick(
        ask: json["ask"].toDouble(),
        bid: json["bid"].toDouble(),
        epoch: json["epoch"],
        id: json["id"],
        pipSize: json["pip_size"],
        quote: json["quote"].toDouble(),
        symbol: json["symbol"],
      );

  Map<String, dynamic> toMap() => {
        "ask": ask,
        "bid": bid,
        "epoch": epoch,
        "id": id,
        "pip_size": pipSize,
        "quote": quote,
        "symbol": symbol,
      };
}
