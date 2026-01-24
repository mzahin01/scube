import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class PageOneController extends GetxController {
  // Header Stats
  final liveAcPower = '10000 kW'.obs;
  final plantGeneration = '82.58 %'.obs;
  final livePR = '85.61 %'.obs;
  final cumulativePR = '27.58 %'.obs;
  final returnPV = '10000 ৳'.obs;
  final totalEnergy = '10000 kWh'.obs;

  // Weather Data
  final moduleTemperature = '17°C'.obs;
  final windSpeed = '26 MPH / NW'.obs;
  final effectiveIrradiation = '15.20 w/m²'.obs;

  // Yesterday's Data
  final yesterdayAcMaxPower = '1636.50 kW'.obs;
  final yesterdayNetEnergy = '6439.16 kWh'.obs;
  final yesterdaySpecificYield = '1.25 kWh/kWp'.obs;

  // Today's Data
  final todayAcMaxPower = '2121.88 kW'.obs;
  final todayNetEnergy = '4875.77 kWh'.obs;
  final todaySpecificYield = '0.94 kWh/kWp'.obs;

  // PV Module Info
  final totalPVModules = '6372 pcs. (585 Wp each)'.obs;
  final totalAcCapacity = '3000 KW'.obs;
  final totalDcCapacity = '3.727 MWp'.obs;
  final dateOfCommissioning = '17/07/2024'.obs;
  final numberOfInverters = '30'.obs;

  // Inverter Data List
  final inverterList = <InverterData>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadInverterData();
  }

  void loadInverterData() {
    inverterList.value = [
      InverterData(
        name: 'LT_01',
        status: '495.505 kWp / 440 kW',
        lifetimeEnergy: '352.96 MWh',
        todayEnergy: '273.69 kWh',
        prevMeterEnergy: '0.00 MWh',
        livePower: '352.96 MWh',
      ),
      InverterData(
        name: 'LT_01',
        status: '495.505 kWp / 440 kW',
        lifetimeEnergy: '352.96 MWh',
        todayEnergy: '273.69 kWh',
        prevMeterEnergy: '0.00 MWh',
        livePower: '352.96 MWh',
      ),
    ];
  }

  void onNavigateToSecondPage() {
    // Navigate to second page
    Get.toNamed(Routes.PAGE_TWO);
  }

  void onNotificationTap() {
    Get.snackbar('Info', 'Notifications');
  }

  void onBackTap() {
    Get.back();
  }
}

class InverterData {
  final String name;
  final String status;
  final String lifetimeEnergy;
  final String todayEnergy;
  final String prevMeterEnergy;
  final String livePower;

  InverterData({
    required this.name,
    required this.status,
    required this.lifetimeEnergy,
    required this.todayEnergy,
    required this.prevMeterEnergy,
    required this.livePower,
  });
}
