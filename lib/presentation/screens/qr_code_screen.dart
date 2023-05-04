import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app/app_injection.dart';
import '../business_logic/cubit/cach/cach_cubit.dart';
import '../resources/values_manager.dart';

class QrCodeScanner extends StatelessWidget {
  const QrCodeScanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppPadding.p4.w),
      child: Center(
        child: ElevatedButton(
          onPressed: () async {
            String clientUid = await FlutterBarcodeScanner.scanBarcode(
              '',
              'Cancel',
              false,
              ScanMode.QR,
            );
            sL<CachCubit>().cachUserUid(clientUid);
          },
          child: const Text('Scan'),
        ),
      ),
    );
  }
}
