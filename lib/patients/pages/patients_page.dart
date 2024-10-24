import 'package:dermatosis/patients/pages/patient_tile.dart';
import 'package:dermatosis/patients/patient.dart';
import 'package:dermatosis/main.dart';

import '../../imageries/imageries.dart';

class PatientsPage extends UI {
  const PatientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: FloatingActionButton(
          heroTag: randomID,
          onPressed: () {
            patients(Patient());
          },
          child: const Icon(Icons.add),
        ).pad(),
        title: const Text('DERMATOMA'),
        actions: [
          LeadingBackButton(),
        ],
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: patients().length,
        itemBuilder: (context, index) {
          Patient patient([Patient? _]) {
            if (_ != null) patients(_);
            return patients().elementAt(index);
          }

          return PatientTile(patient: patient);
        },
      ),
    );
  }
}

class ShowImageWidget extends UI {
  const ShowImageWidget({super.key, required this.pictureModel});

  final Imagery pictureModel;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
              // title: Text(
              //   pictureModel.date!.format(),
              //   textScaleFactor: .7,
              // ),
              ),
          body: ClipRRect(
            // borderRadius: BorderRadius.circular(settingsBloc.borderRadius),
            child: GestureDetector(
              onDoubleTap: () {
                // RM.navigate.back();
              },
              child: Image.memory(
                pictureModel.image!,
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  if (wasSynchronouslyLoaded) return child;
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 0),
                    child: () {
                      if (frame != null) {
                        return child;
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 6,
                          ),
                        );
                      }
                    }(),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum SortType {
  byName,
  byAddress,
  byDate,
}

const sortTypes = SortType.values;

// final sortTypeFormField = RM.injectFormField(SortType.byName);
