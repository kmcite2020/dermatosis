// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dermatosis/imageries/imageries.dart';

import '../main.dart';

final _patients = box<Patient>(store);
late final patientsRM = rm<Patient>(_patients);
late final patients = list(_patients, patientsRM);
void addPatient(Patient p) => _patients.put(p);
void removePatient(int id) => _patients.remove(id);

@Entity()
class Patient {
  @Id()
  int id = 0;
  String name = '';
  bool gender = false; // true -> male
  bool editing = false;
  final address = ToOne<Address>();
  @Property(type: PropertyType.date)
  DateTime dateOfBirth = DateTime.now();
  final contact = ToOne<Contact>();
  String diagnosis = '';

  final lesions = ToMany<Lesion>();
  final images = ToMany<Imagery>();
}

extension ooo on Patient {
  Duration get age => DateTime.now().difference(dateOfBirth);
}

@Entity()
class Lesion {
  @Id()
  int id = 0;
  String patterns = '';
}

@Entity()
class Contact {
  @Id()
  int id = 0;
  String countryCode = '';
  String mnp = '';
  String phoneCode = '';
}

@Entity()
class Address {
  @Id()
  int id = 0;
  String town = '';
  String city = '';
  String province = '';
  String country = '';
}
