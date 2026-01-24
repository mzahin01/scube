import 'package:get/get.dart';

class PageTwoController extends GetxController {
  // Tab states
  final selectedMainTab = 0.obs; // 0: Summery, 1: SLD, 2: Data
  final selectedSourceTab = 0.obs; // 0: Source, 1: Load

  // Power data
  final totalPower = '5.53 kw'.obs;

  // Data list
  final dataList = <DataItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDataList();
  }

  void loadDataList() {
    dataList.value = [
      DataItem(
        title: 'Data View',
        isActive: true,
        data1: '55505.63',
        data2: '58805.63',
        iconColor: DataIconColor.blue,
        iconType: DataIconType.solarPanel,
      ),
      DataItem(
        title: 'Data Type 2',
        isActive: true,
        data1: '55505.63',
        data2: '58805.63',
        iconColor: DataIconColor.orange,
        iconType: DataIconType.battery,
      ),
      DataItem(
        title: 'Data Type 3',
        isActive: false,
        data1: '55505.63',
        data2: '58805.63',
        iconColor: DataIconColor.blue,
        iconType: DataIconType.transmissionTower,
      ),
      DataItem(
        title: 'Data Type 4',
        isActive: true,
        data1: '42350.25',
        data2: '45620.80',
        iconColor: DataIconColor.orange,
        iconType: DataIconType.windTurbine,
      ),
      DataItem(
        title: 'Data Type 5',
        isActive: false,
        data1: '31205.45',
        data2: '33450.15',
        iconColor: DataIconColor.blue,
        iconType: DataIconType.factory,
      ),
      DataItem(
        title: 'Data Type 6',
        isActive: true,
        data1: '21000.00',
        data2: '22000.00',
        iconColor: DataIconColor.orange,
        iconType: DataIconType.solarPanel,
      ),
      DataItem(
        title: 'Data Type 7',
        isActive: false,
        data1: '18000.50',
        data2: '18500.75',
        iconColor: DataIconColor.blue,
        iconType: DataIconType.battery,
      ),
      DataItem(
        title: 'Data Type 8',
        isActive: true,
        data1: '16000.10',
        data2: '17000.20',
        iconColor: DataIconColor.orange,
        iconType: DataIconType.transmissionTower,
      ),
      DataItem(
        title: 'Data Type 9',
        isActive: false,
        data1: '15000.00',
        data2: '15500.00',
        iconColor: DataIconColor.blue,
        iconType: DataIconType.windTurbine,
      ),
      DataItem(
        title: 'Data Type 10',
        isActive: true,
        data1: '14000.00',
        data2: '14500.00',
        iconColor: DataIconColor.orange,
        iconType: DataIconType.factory,
      ),
      DataItem(
        title: 'Data Type 11',
        isActive: false,
        data1: '13000.00',
        data2: '13500.00',
        iconColor: DataIconColor.blue,
        iconType: DataIconType.solarPanel,
      ),
      DataItem(
        title: 'Data Type 12',
        isActive: true,
        data1: '12000.00',
        data2: '12500.00',
        iconColor: DataIconColor.orange,
        iconType: DataIconType.battery,
      ),
      DataItem(
        title: 'Data Type 13',
        isActive: false,
        data1: '11000.00',
        data2: '11500.00',
        iconColor: DataIconColor.blue,
        iconType: DataIconType.transmissionTower,
      ),
      DataItem(
        title: 'Data Type 14',
        isActive: true,
        data1: '10000.00',
        data2: '10500.00',
        iconColor: DataIconColor.orange,
        iconType: DataIconType.windTurbine,
      ),
    ];
  }

  void setMainTab(int index) {
    selectedMainTab.value = index;
  }

  void setSourceTab(int index) {
    selectedSourceTab.value = index;
  }

  void onBackTap() {
    Get.back();
  }

  void onNotificationTap() {
    Get.snackbar('Info', 'Notifications');
  }

  void onNavigateToFirstPage() {
    Get.back();
  }

  void onQuickActionTap(String action) {
    Get.snackbar('Action', '$action tapped');
  }

  void onDataItemTap(DataItem item) {
    Get.snackbar('Data', '${item.title} tapped');
  }
}

enum DataIconColor { blue, orange }

enum DataIconType {
  solarPanel,
  battery,
  transmissionTower,
  windTurbine,
  factory,
}

class DataItem {
  final String title;
  final bool isActive;
  final String data1;
  final String data2;
  final DataIconColor iconColor;
  final DataIconType iconType;

  DataItem({
    required this.title,
    required this.isActive,
    required this.data1,
    required this.data2,
    required this.iconColor,
    required this.iconType,
  });
}
