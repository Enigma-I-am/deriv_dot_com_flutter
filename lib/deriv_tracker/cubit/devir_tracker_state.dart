part of 'devir_tracker_cubit.dart';

enum DevirTrackerStateStatus {
  initial,
  loading,
  success,
  failure,
}

extension DevirTrackerStateStatusX on DevirTrackerStateStatus {
  bool get isInitial => this == DevirTrackerStateStatus.initial;
  bool get isLoading => this == DevirTrackerStateStatus.loading;
  bool get isSuccess => this == DevirTrackerStateStatus.success;
  bool get isFailure => this == DevirTrackerStateStatus.failure;
}

class DevirTrackerState extends Equatable {
  const DevirTrackerState({
    this.status = DevirTrackerStateStatus.loading,
    this.activeSymbols = const [],
  });
  final DevirTrackerStateStatus status;
  final List<ActiveSymbol> activeSymbols;

  DevirTrackerState copyWith({
    DevirTrackerStateStatus? status,
    List<ActiveSymbol>? activeSymbols,
  }) {
    return DevirTrackerState(
      status: status ?? this.status,
      activeSymbols: activeSymbols ?? this.activeSymbols,
    );
  }

  @override
  List<Object> get props => [activeSymbols];
}
