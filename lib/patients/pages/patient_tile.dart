import 'package:dermatosis/core/shared.dart';
import 'package:dermatosis/main.dart';
import 'package:dermatosis/patients/patient.dart';

import 'patient_page.dart';

class PatientTile extends UI {
  final Modifier<Patient> patient;

  PatientTile({super.key, required this.patient});
  @override
  Widget build(BuildContext context) {
    Card(
      child: ListTile(
        title: Column(
          children: [
            '${patient().name}'.text(),
            // Text('age:  ${eachPatient.age.formatDuration}'),
            // Wrap(
            //   children: [
            //     Text('contact: ${eachPatient.contact}'),
            //   ],
            // ),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              physics: const BouncingScrollPhysics(),
              itemCount: patient().images.length,
              itemBuilder: (context, index) {
                // final eachPicture = eachPatient.images.elementAt(index);
                return Column(
                  children: [
                    GestureDetector(
                      onDoubleTap: () {
                        // to(
                        //   ShowImageWidget(
                        //     pictureModel: eachPicture,
                        //   ),
                        // );
                      },
                      // child: Hero(
                      //   tag: randomID,
                      //   child: Image.memory(
                      //     eachPicture.image!,
                      //     height: 100,
                      //     width: 100,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                    ),
                    // e.date!.year.text,
                  ],
                );
              },
              shrinkWrap: true,
            ),
            // if (e.medicalRecord != null) e.medicalRecord!.date.text,
          ],
        ),
      ),
    );
    return ListTile(
      leading: CircleAvatar(
        child: patient().age.inYears.text(),
      ),
      title: Column(
        children: [
          patient().name.text(),
        ],
      ),
      onTap: () {
        to(PatientPage(patient: patient));
      },
    );
  }
}
