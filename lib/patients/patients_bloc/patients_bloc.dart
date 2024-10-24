// part of '../../../logic/logic.dart';

// import 'package:dermatosis/imageries/imageries.dart';
// import 'package:dermatosis/patients/patient.dart';

// final PatientsBloc patientsBloc = PatientsBloc();

// class PatientsBloc {
//   void setPatient(Patient patientModel) async {
//     patientsRM.add(patientModel);
//   }

//   void setPatientName(String value, Patient patientModel) {
//     setPatient(patientModel..name = value);
//   }

//   void setPatientEditing(bool value, Patient patientModel) {
//     setPatient(patientModel..editing = value);
//   }

//   void setPatientAddress(Address value, Patient patient) {
//     setPatient(patient..address = value);
//   }

//   void setPatientAddressTown(String string, Patient patient) {
//     setPatientAddress(patient.address..town = string, patient);
//   }

//   void setPatientAddressCity(String string, Patient patient) {
//     setPatientAddress(patient.address..city = string, patient);
//   }

//   void setPatientAddressState(String string, Patient patient) {
//     setPatientAddress(patient.address..state = string, patient);
//   }

//   void setPatientAddressCountry(String string, Patient patient) {
//     setPatientAddress(patient.address..country = string, patient);
//   }

//   void setPatientDateOfBirth(DateTime value, Patient patient) {
//     setPatient(patient..dateOfBirth = value);
//   }

//   void setPatientGender(Gender value, Patient patient) {
//     setPatient(patient.gender = value);
//   }

//   void addPatientPicture(Imagery value, Patient patient) {
//     setPatient(patient..pictures.add(value));
//   }

//   void removePatientPicture(Imagery value, Patient patient) {
//     setPatient(patient..pictures.remove(value));
//   }

//   // void clearPicturesFromPatient(PatientModel patient) {
//   //   addPatientPicture({}, patient..pictures.updateSync());
//   // }

//   void setPatientContact(Contact value, Patient patient) {
//     setPatient(patient..contact = value);
//   }

//   void setPatientContactCountryCode(String value, Patient patient) {
//     setPatientContact(patient.contact..countryCode = value, patient);
//   }

//   void setPatientContactMnp(String value, Patient patient) {
//     setPatientContact(patient.contact..mnp = value, patient);
//   }

//   void setPatientContactPhoneCode(String value, Patient patient) {
//     setPatientContact(patient.contact..phoneCode = value, patient);
//   }

//   void setPatientPatterns(PatternsModel value, Patient patient) {
//     setPatient(patient..patterns = value);
//   }

//   void setPatientPatternsLocalizedOrGeneralized(bool? value, Patient patient) {
//     setPatientPatterns(
//       patient.patterns..localizedOrGeneralized = value!,
//       patient,
//     );
//   }

//   void setPatientPatternsUnilateralOrBilateral(bool? value, Patient patient) {
//     setPatientPatterns(
//       patient.patterns..unilateralOrBilateral = value!,
//       patient,
//     );
//   }

//   void setPatientPatternsSymmetricalOrAssymetrical(bool? value, Patient patient) {
//     setPatientPatterns(
//       patient.patterns..symmetricalOrAssymetrical = value!,
//       patient,
//     );
//   }

//   void setPatientPatternsTruncalOrAcral(bool? value, Patient patient) {
//     setPatientPatterns(
//       patient.patterns..truncalOrAcral = value!,
//       patient,
//     );
//   }

//   void setPatientPatternsFlexorOrExtensor(bool? value, Patient patient) {
//     setPatientPatterns(
//       patient.patterns..flexorOrExtensor = value!,
//       patient,
//     );
//   }

//   void setPatientPatternsExposedOrCovered(bool? value, Patient patient) {
//     final patterns = patient.patterns;
//     setPatientPatterns(
//       patterns..exposedOrCovered = value!,
//       patient,
//     );
//   }

//   void deletePatient(PatientModel patientModel) async {
//     await patientsRepository.deletePatient(patientModel);
//   }

//   void clearPatients() async => await patientsRepository.clearPatients();
// }

// mixin LesionsBloc2 {
//   List<LesionSite> lesions(PatientModel patientModel) => patientModel.lesions;
//   void setPatientLesions(List<LesionSite> lesions, PatientModel patientModel) {
//     patientsBloc.setPatient(patientModel..lesions = lesions);
//   }

//   void addLesion(LesionSite lesionSite, PatientModel patientModel) {
//     setPatientLesions(lesions(patientModel)..add(lesionSite), patientModel);
//   }

//   void removeLesion(LesionSite lesionSite, PatientModel patientModel) {
//     setPatientLesions(lesions(patientModel)..remove(lesionSite), patientModel);
//   }

//   void clearLesions(PatientModel patientModel) {
//     setPatientLesions([], patientModel);
//   }
// }
