import 'package:bloc/bloc.dart';
import 'package:deriv_dot_com_flutter/core/models/binanry_symbol_model.dart';
import 'package:deriv_dot_com_flutter/core/repository/repo.dart';
import 'package:equatable/equatable.dart';

part 'devir_tracker_state.dart';

class DevirTrackerCubit extends Cubit<DevirTrackerState> {
  DevirTrackerCubit({Repository? repo})
      : _repo = repo ?? Repository(),
        super(DevirTrackerState());
  final Repository _repo;

  void listenForActiveSymbols() {
    try {
      emit(state.copyWith(status: DevirTrackerStateStatus.loading));
      _repo.getSymbols().listen(
            (event) => emit(
              state.copyWith(
                activeSymbols: event.activeSymbols,
                status: DevirTrackerStateStatus.success,
              ),
            ),
          );
    } catch (e) {
      print(e);
    }
  }
}
