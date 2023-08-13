import 'package:employee_list/features/employee/models/employee_model.dart';
import 'package:employee_list/features/employee/models/employee_role.dart';
import 'package:employee_list/features/employee/screens/employee_add_screen.dart';
import 'package:employee_list/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final _dummyEmployees = [
  EmployeeModel(
    name: 'name',
    role: EmployeeRole.flutterDeveloper,
    startDate: DateTime.now(),
  ),
  EmployeeModel(
    name: 'name2',
    role: EmployeeRole.flutterDeveloper,
    startDate: DateTime.now(),
  ),
  EmployeeModel(
    name: 'name3',
    role: EmployeeRole.flutterDeveloper,
    startDate: DateTime.now(),
    endDate: DateTime.now().add(const Duration(days: 2)),
  ),
];

class EmployeeListScreen extends StatelessWidget {
  const EmployeeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee List'),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (context) => const EmployeeAddScreen(),
          ),
        ),
        child: const Icon(Icons.add),
      ),
      // body: const _EmptyWidget(),
      body: _EmployeeList(_dummyEmployees),
    );
  }
}

class _EmployeeList extends StatelessWidget {
  const _EmployeeList(this.employees);
  final List<EmployeeModel> employees;

  @override
  Widget build(BuildContext context) {
    final active = employees.activeEmployees;
    final inactive = employees.inactiveEmployees;

    return CustomScrollView(
      slivers: [
        if (active.isNotEmpty)
          const SliverToBoxAdapter(
            child: _Header('Current employees'),
          ),
        if (active.isNotEmpty)
          SliverList(
            delegate: SliverChildListDelegate(
              ListTile.divideTiles(
                context: context,
                tiles: active.map(_EmployeeTile.new),
              ).toList(),
            ),
          ),
        if (inactive.isNotEmpty)
          const SliverToBoxAdapter(
            child: _Header('Previous employees'),
          ),
        if (inactive.isNotEmpty)
          SliverList(
            delegate: SliverChildListDelegate(
              ListTile.divideTiles(
                context: context,
                tiles: inactive.map(_EmployeeTile.new),
              ).toList(),
            ),
          ),
      ],
    );
  }
}

class _EmployeeTile extends StatelessWidget {
  const _EmployeeTile(this.employee);

  final EmployeeModel employee;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(employee.hashCode.toString()),
      background: Container(
        alignment: AlignmentDirectional.centerEnd,
        color: Colors.red,
        child: const Padding(
          padding: EdgeInsets.only(right: 24),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      confirmDismiss: (DismissDirection direction) async {
        return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Delete Confirmation'),
              content: const Text(
                'Are you sure you want to delete this item?',
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Delete'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Cancel'),
                ),
              ],
            );
          },
        );
      },
      onDismissed: (direction) {
        //TODO delete
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Employee data has been deleted'),
          ),
        );
      },
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        title: Text(
          employee.name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 6),
            Text(
              employee.role.name,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 6),
            if (employee.isActive)
              Text(
                'From ${employee.startDate.listFormat}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              )
            else
              Text(
                '${employee.startDate.listFormat} - ${employee.endDate?.listFormat}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
          ],
        ),
        isThreeLine: true,
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (context) => EmployeeAddScreen(employee: employee),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: const TextStyle(
          color: Color(0xff1DA1F2),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      tileColor: const Color(0xffF2F2F2),
    );
  }
}

class _EmptyWidget extends StatelessWidget {
  const _EmptyWidget();

  @override
  Widget build(BuildContext context) {
    return Center(child: Assets.images.empty.svg());
  }
}

extension on DateTime {
  String get listFormat => DateFormat('dd MMM, yyyy').format(this);
}
