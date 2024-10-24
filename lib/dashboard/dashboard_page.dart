import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dermatosis/patients/pages/patients_page.dart';
import 'package:dermatosis/imageries/imageries_page.dart';
import 'package:dermatosis/settings/settings_page/settings_page.dart';
import 'package:dermatosis/main.dart';

class DashboardPage extends UI {
  const DashboardPage({super.key});
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('/'),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: [
            ElevatedButton.icon(
              onPressed: () => to(ImageriesPage()),
              label: 'Pictures'.text(),
              icon: Icon(Icons.photo_size_select_actual),
            ).pad(),
            ElevatedButton.icon(
              onPressed: () => to(PatientsPage()),
              label: 'Patients'.text(),
              icon: Icon(FontAwesomeIcons.prescriptionBottleMedical),
            ).pad(),
            ElevatedButton.icon(
              onPressed: () => to(SettingsPage()),
              label: 'Settings'.text(),
              icon: Icon(Icons.settings),
            ).pad(),
          ],
        ),
      ),
    );
  }
}

class LeadingBackButton extends UI {
  const LeadingBackButton({super.key});
  @override
  Widget build(BuildContext context) => const BackButton().pad();
}
