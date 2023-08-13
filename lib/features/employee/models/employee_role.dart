enum EmployeeRole {
  productDesigner,
  flutterDeveloper,
  qaTester,
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
