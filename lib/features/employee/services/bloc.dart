import 'package:employee_list/core/processing_state.dart';
import 'package:employee_list/features/employee/models/employee_model.dart';
import 'package:employee_list/features/employee/services/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeCubit extends Cubit<EmployeeState> {
  EmployeeCubit(this.repository) : super(const ProcessingState.none());

  final EmployeeRepository repository;

  Future<void> add(EmployeeModel employee) async {
    emit(const ProcessingState.processing());

    try {
      await repository.addEmployee(employee);
      await _simulateLoading();

      emit(const ProcessingState.success());
    } on Exception catch (e) {
      emit(ProcessingState.error(e));
    }
  }

  Future<void> update(EmployeeModel employee) async {
    emit(const ProcessingState.processing());

    try {
      await repository.updateEmployee(employee);
      await _simulateLoading();

      emit(const ProcessingState.success());
    } on Exception catch (e) {
      emit(ProcessingState.error(e));
    }
  }

  Future<void> delete(EmployeeModel employee) async {
    emit(const ProcessingState.processing());

    try {
      await repository.deleteEmployee(employee.id);
      await _simulateLoading();

      emit(const ProcessingState.success());
    } on Exception catch (e) {
      emit(ProcessingState.error(e));
    }
  }

  Future<void> _simulateLoading() async {
    // Simulate a delay to show loading state
    await Future<void>.delayed(const Duration(seconds: 1));
  }
}

typedef EmployeeState = ProcessingState<Exception>;
