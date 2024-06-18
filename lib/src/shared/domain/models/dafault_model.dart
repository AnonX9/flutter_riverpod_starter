import 'package:objectbox/objectbox.dart';

@Entity()
class DefaultModel {
  @Id(assignable: true)
  int id = 0; // Placeholder ID, can be updated as needed

  // Add your properties here
  String name;
  int age;

  DefaultModel({required this.name, required this.age});
}
