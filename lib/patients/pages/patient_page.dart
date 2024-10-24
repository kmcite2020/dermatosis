import 'package:dermatosis/core/shared.dart';
import 'package:dermatosis/imageries/imageries.dart';
import 'package:dermatosis/imageries/imageries_bloc.dart';
import 'package:dermatosis/patients/patient.dart';

import '../../main.dart';
import '../gender_widget.dart';

class PatientPage extends UI {
  const PatientPage({super.key, required this.patient});
  final Modifier<Patient> patient;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: patient().name.text(),
        leading: const LeadingBackButton(),
        actions: [
          patient().dateOfBirth.year.text(textScaleFactor: 1.2),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(
        children: [
          TextFormField(
            initialValue: patient().name,
            onChanged: (value) => patient(patient()..name = value),
            readOnly: !patient().editing,
          ).pad(),
          patient().id.text().pad(),
          patient().name.text().pad(),
          patient().address.target.text().pad(),
          patient().dateOfBirth.text().pad(),
          // patient().gender.text().pad(),
          // patient().images.text().pad(),
          patient().lesions.text().pad(),
          patient().contact.target.text().pad(),
          patient().diagnosis.text().pad(),
          patient().age.text().pad(),
          AgeWidget(age: patient().age),
          GenderWidget(patient: patient),
          PatternsWidget(patient: patient),
          patient().id.text().pad(),
          ContactUI(patient: patient),
          PicturesUI(patient: patient),
          ElevatedButton(
            onPressed: () {
              // final LesionsBloc lesionsBloc = LesionsBloc();
              // lesionsBloc.addLesionToPatient(
              //   Lesion(),
              //   patient,
              // );
            },
            child: ''.text(),
          ).pad(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: randomID,
        onPressed: () {
          patient(
            patient()..editing = !patient().editing,
          );
        },
        label: Text(
          (patient().editing ? 'EDITING' : 'READING'),
        ),
      ),
    );
  }
}

class PicturesUI extends UI {
  final Modifier<Patient> patient;
  const PicturesUI({super.key, required this.patient});

  Widget build(context) {
    if (patient().images.isEmpty || patient().editing) {
      return PopupMenuButton(
        itemBuilder: (context) {
          return [
            ...imageries().map(
              (imagery) {
                return PopupMenuItem(
                  value: imagery,
                  child: imagery.path.text(),
                );
              },
            ),
          ];
        },
        onSelected: (value) {
          patient(patient()..images.add(value));
          // patientsBloc.addPatientPicture(value, patient);
        },
        icon: Icon(Icons.add),
      );
    }
    return Wrap(
      children: patient().images.map(
        (eachPicture) {
          return PictureUI(picture: eachPicture);
        },
      ).toList(),
    );
  }
}

class PictureUI extends StatelessWidget {
  const PictureUI({
    Key? key,
    required this.picture,
  }) : super(key: key);
  final Imagery picture;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: ClipRRect(
        child: Image.memory(picture.image!),
        borderRadius: BorderRadius.circular(
          settingsRM.borderRadius(),
        ),
      ).pad(),
    );
  }
}

class ContactUI extends StatelessWidget {
  static String? _validator(String? value) {
    if (value == null) {
      return 'Not valid.';
    }
    final x = int.tryParse(value);
    if (x == null) {
      return 'Not a valid integer.';
    }
    return null;
  }

  const ContactUI({super.key, required this.patient});
  final Modifier<Patient> patient;

  @override
  Widget build(BuildContext context) {
    if (patient().editing) {
      return Row(
        children: [
          Expanded(
            flex: 4,
            child: TextFormField(
              keyboardType: TextInputType.number,
              initialValue: patient().contact.target?.countryCode.toString(),
              maxLength: 4,
              validator: _validator,
              onChanged: (value) {
                final contact = patient().contact.target;
                contact!.countryCode = value;
              },
            ).pad(),
          ),
          Expanded(
            flex: 3,
            child: TextFormField(
              keyboardType: TextInputType.number,
              initialValue: patient().contact.target?.mnp.toString(),
              maxLength: 3,
              validator: _validator,
              onChanged: (value) {
                // patient()sBloc.setPatient()ContactMnp(value, patient());
              },
            ).pad(),
          ),
          Expanded(
            flex: 7,
            child: TextFormField(
              keyboardType: TextInputType.number,
              initialValue: patient().contact.target?.phoneCode.toString(),
              maxLength: 7,
              validator: _validator,
              onChanged: (value) {
                // patient()sBloc.setPatient()ContactPhoneCode(
                //     value, patient());
              },
            ).pad(),
          ),
        ],
      );
    } else {
      return patient().contact.text(textScaleFactor: 1.5).pad();
    }
  }
}

class PatternsWidget extends ReactiveStatelessWidget {
  const PatternsWidget({Key? key, required this.patient}) : super(key: key);
  final patient;

  @override
  Widget build(BuildContext context) {
    // final PatternsModel patterns = patient.patterns;
    return Column(
      children: [
        // SwitchListTile(
        //   title: Text('Is the lesion localized or generalized'),
        //   // value: patterns.localizedOrGeneralized,
        //   onChanged: !patient.editing
        //       ? null
        //       : (localizedOrGeneralized) {
        //           patientsBloc.setPatientPatternsLocalizedOrGeneralized(
        //             localizedOrGeneralized,
        //             patient,
        //           );
        //         },
        // ),
        // SwitchListTile(
        //   title: Text('Is the lesion unilateral or bilateral'),
        //   value: patterns.unilateralOrBilateral,
        //   onChanged: !patient.editing
        //       ? null
        //       : (unilateralOrBilateral) {
        //           patientsBloc.setPatientPatternsUnilateralOrBilateral(
        //             unilateralOrBilateral,
        //             patient,
        //           );
        //         },
        // ),
        // SwitchListTile(
        //   title: Text('Is the lesion symmetrical or assymetrical'),
        //   value: patterns.symmetricalOrAssymetrical,
        //   onChanged: !patient.editing
        //       ? null
        //       : (symmetricalOrAsymmetrical) {
        //           patientsBloc.setPatientPatternsSymmetricalOrAssymetrical(
        //             symmetricalOrAsymmetrical,
        //             patient,
        //           );
        //         },
        // ),
        // SwitchListTile(
        //   title: Text('Is the lesion truncal or acral'),
        //   value: patterns.truncalOrAcral,
        //   onChanged: !patient.editing
        //       ? null
        //       : (truncalOrAcral) =>
        //           patientsBloc.setPatientPatternsTruncalOrAcral(
        //             truncalOrAcral,
        //             patient,
        //           ),
        // ),
        // SwitchListTile(
        //   title: Text('Is the lesion on flexor or extensor surface'),
        //   value: patterns.flexorOrExtensor,
        //   onChanged: !patient.editing
        //       ? null
        //       : (value) => patientsBloc.setPatientPatternsFlexorOrExtensor(
        //             value,
        //             patient,
        //           ),
        // ),
        // SwitchListTile(
        //   title: Text('Is the lesion on exposed areas or covered areas'),
        //   value: patterns.exposedOrCovered,
        //   onChanged: !patient.editing
        //       ? null
        //       : (value) => patientsBloc.setPatientPatternsExposedOrCovered(
        //             value,
        //             patient,
        //           ),
        // ),
      ],
    );
  }
}

class AgeWidget extends ReactiveStatelessWidget {
  const AgeWidget({
    Key? key,
    required this.age,
  }) : super(key: key);
  final Duration age;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(settingsRM.borderRadius()),
        ),
        child: age.formatDuration.text(),
      ),
    );
  }
}
