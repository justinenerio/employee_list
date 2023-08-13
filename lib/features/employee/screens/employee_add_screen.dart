import 'package:employee_list/core/date_time_ext.dart';
import 'package:employee_list/core/loader.dart';
import 'package:employee_list/features/employee/models/employee_model.dart';
import 'package:employee_list/features/employee/models/employee_role.dart';
import 'package:employee_list/features/employee/services/bloc.dart';
import 'package:employee_list/features/employee/services/repository.dart';
import 'package:employee_list/features/employee/widgets/calendar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:uuid/uuid.dart';

class EmployeeAddScreen extends StatelessWidget {
  const EmployeeAddScreen({super.key, this.employee});

  final EmployeeModel? employee;

  @override
  Widget build(BuildContext context) {
    final isNew = employee == null;

    return BlocProvider(
      create: (context) => EmployeeCubit(context.read<EmployeeRepository>()),
      child: BlocConsumer<EmployeeCubit, EmployeeState>(
        listener: (context, state) {
          state.maybeMap(
            success: (state) {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Success!')),
              );
            },
            error: (state) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Error. Please try again.')),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return Loader(
            isLoading: state.isProcessing,
            child: Scaffold(
              appBar: AppBar(
                title: Text('${isNew ? 'Add' : 'Edit'} Employee Details'),
                actions: [
                  if (!isNew)
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () =>
                          context.read<EmployeeCubit>().delete(employee!),
                    )
                ],
              ),
              body: _Body(employee),
            ),
          );
        },
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body(this.employee);

  final EmployeeModel? employee;

  @override
  State<_Body> createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  final _formKey = GlobalKey<FormState>();

  EmployeeRole? _role;
  DateTime _startDate = DateTime.now();
  DateTime? _endDate;

  late TextEditingController _nameController;

  void _selectRole(EmployeeRole role) {
    setState(() {
      _role = role;
    });
  }

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController();

    if (widget.employee != null) {
      _nameController.text = widget.employee!.name;
      _role = widget.employee?.role;
      _startDate = widget.employee?.startDate ?? DateTime.now();
      _endDate = widget.employee?.endDate;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter Employee Name';
                }
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                hintText: 'Employee Name',
                prefixIcon: Icon(LineIcons.user),
                prefixIconColor: Color(0xFF1DA1F2),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Choose a role';
                }
                return null;
              },
              onTap: () async {
                final role = await _showEmployeeRoleSheet(context);
                if (role != null) {
                  _selectRole(role);
                }
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                hintText: 'Employee Role',
                prefixIcon: Icon(LineIcons.briefcase),
                prefixIconColor: Color(0xFF1DA1F2),
                suffixIcon: Icon(Icons.arrow_drop_down),
                suffixIconColor: Color(0xFF1DA1F2),
              ),
              enabled: true,
              readOnly: true,
              controller: TextEditingController(
                text: _role?.name,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                      hintText: 'Start Date',
                      prefixIcon: Icon(LineIcons.calendar),
                      prefixIconColor: Color(0xFF1DA1F2),
                    ),
                    readOnly: true,
                    controller: TextEditingController(
                      text: _startDate.format,
                    ),
                    onTap: () async {
                      final date = await CalendarPickerWidget.show(
                        context,
                        initial: _startDate,
                      );

                      if (date != null) {
                        setState(() {
                          _startDate = date;
                        });
                      }
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(
                    LineIcons.arrowRight,
                    color: Color(0xFF1DA1F2),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                      hintText: 'No Date',
                      prefixIcon: Icon(LineIcons.calendar),
                      prefixIconColor: Color(0xFF1DA1F2),
                    ),
                    readOnly: true,
                    controller: TextEditingController(
                      text: _endDate?.format,
                    ),
                    onTap: () async {
                      final date = await CalendarPickerWidget.show(
                        context,
                        initial: _endDate,
                        isStart: false,
                      );

                      if (date != null) {
                        setState(() {
                          _endDate = date;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Divider(
              color: Colors.grey,
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffEDF8FF),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final emp = EmployeeModel(
                        id: widget.employee?.id ?? const Uuid().v4(),
                        name: _nameController.text,
                        role: _role!,
                        startDate: _startDate,
                        endDate: _endDate,
                      );

                      final repo = context.read<EmployeeCubit>();

                      if (widget.employee != null) {
                        repo.update(emp);
                      } else {
                        repo.add(emp);
                      }
                    }
                  },
                  child: const Text('Save'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Future<EmployeeRole?> _showEmployeeRoleSheet(
  BuildContext context, {
  EmployeeRole? initial,
}) async =>
    showModalBottomSheet<EmployeeRole?>(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: ListTile.divideTiles(
              context: context,
              tiles: EmployeeRole.values.map(
                (e) => ListTile(
                  selected: e == initial,
                  title: Center(child: Text(e.name)),
                  onTap: () => Navigator.of(context).pop(e),
                ),
              ),
            ).toList(),
          ),
        );
      },
    );
