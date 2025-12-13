import 'package:e_rtlh_mobile/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../laporan_list_controller.dart';

class FilterModal {
  static Future<void> show(
      {required BuildContext context,
      required LaporanListController controller}) {
    return Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              Text(
                "Filter Laporan",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              // ================= STATUS =================
              const Text("Status",
                  style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),

              Obx(() => Wrap(
                    spacing: 8,
                    children: controller.statuses.map((status) {
                      final isSelected =
                          controller.selectedStatus.value == status;
                      return ChoiceChip(
                        label: Text(status.replaceAll('_', ' ')),
                        selected: isSelected,
                        onSelected: (_) => controller.setStatus(status),
                        selectedColor: Colors.blue.shade100,
                      );
                    }).toList(),
                  )),

              const SizedBox(height: 20),

              // ================= DATE RANGE =================
              const Text("Rentang Tanggal",
                  style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),

              Obx(() => Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () async {
                            final picked = await showDateRangePicker(
                              context: Get.context!,
                              firstDate: DateTime(2020),
                              lastDate: DateTime.now(),
                            );

                            if (picked != null) {
                              controller.setDateRange(
                                picked.start,
                                picked.end,
                              );
                            }
                          },
                          child: Text(
                            controller.startDate.value == null
                                ? "Pilih Tanggal"
                                : "${controller.startDate.value!.toLocal().toString().split(' ')[0]} - "
                                    "${controller.endDate.value!.toLocal().toString().split(' ')[0]}",
                          ),
                        ),
                      ),
                    ],
                  )),

              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        controller.reset();
                        Get.back();
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: BorderSide(color: Colors.grey.shade300),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Reset",
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        controller.getFilteredList();
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: colorPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Cari",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }
}
