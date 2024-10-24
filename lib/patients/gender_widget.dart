import '../main.dart';

class GenderWidget extends UI {
  const GenderWidget({Key? key, required this.patient}) : super(key: key);
  final patient;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        patient(patient()..gender = !patient().gender);
      },
      child: Icon(patient().gender ? Icons.male : Icons.female),
    ).pad();
  }
}
