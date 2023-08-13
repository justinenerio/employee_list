import 'package:hive/hive.dart';

part 'employee_role.g.dart';

@HiveType(typeId: 1)
enum EmployeeRole {
  @HiveField(0)
  productDesigner,
  @HiveField(1)
  flutterDeveloper,
  @HiveField(2)
  qaTester,
  @HiveField(3)
  productOwner,
}

extension EmployeeRoleExt on EmployeeRole {
  String get name => switch (this) {
        EmployeeRole.productDesigner => 'Product Designer',
        EmployeeRole.flutterDeveloper => 'Flutter Developer',
        EmployeeRole.qaTester => 'QA Tester',
        EmployeeRole.productOwner => 'Product Owner',
      };
}
