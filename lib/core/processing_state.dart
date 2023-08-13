import 'package:freezed_annotation/freezed_annotation.dart';

part 'processing_state.freezed.dart';

@freezed
sealed class ProcessingState<E extends Exception> with _$ProcessingState<E> {
  const factory ProcessingState.none() = ProcessingStateNone;

  const factory ProcessingState.processing() = ProcessingStateProcessing;

  const factory ProcessingState.success() = ProcessingStateSuccess;

  const factory ProcessingState.error(E e) = ProcessingStateError;

  const ProcessingState._();

  bool get isProcessing => this is ProcessingStateProcessing;

  bool get isSuccess => this is ProcessingStateSuccess;
}
