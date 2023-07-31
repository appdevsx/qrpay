import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrpay/routes/routes.dart';

import '../../controller/scan_qr_controlellers/scan_qr_controller.dart';
import '../../utils/assets.dart';
import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';

final controller = Get.put(ScanQRController());

class ScanQrScreen extends StatefulWidget {
  const ScanQrScreen({Key? key}) : super(key: key);
  @override
  ScanScreenState createState() => ScanScreenState();
}

class ScanScreenState extends State<ScanQrScreen> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? barcode;
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  void readQr() async {
    if (barcode != null) {
      controller!.pauseCamera();
      controller!.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.whiteColor,
      extendBodyBehindAppBar: true,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: _bodyWidget(context),
      ),
    );
  }

  // body widget containing all widget elements
  _bodyWidget(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 40,
            child: _scanQrCodeWidget(context),
          ),
          Positioned(
            top: 280,
            right: 20,
            left: 20,
            child: _qrCodeTopMessageWidget(context),
          ),
          Positioned(
            bottom: 20,
            right: 5,
            left: 5,
            child: _iconButtonWidget(context),
          ),
        ],
      ),
    );
  }

  // QR code scan with qr code image
  _scanQrCodeWidget(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: _buildQrViewWidget(context),
    );
  }

  // bottom qr code message
  _qrCodeTopMessageWidget(BuildContext context) {
    return Text(
      "Scan",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: Dimensions.largeTextSize,
        fontWeight: FontWeight.w600,
        color: CustomColor.whiteColor,
      ),
    );
  }

  _buildQrViewWidget(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
          cutOutSize: MediaQuery.of(context).size.width * 0.6,
          borderWidth: 8,
          borderLength: 20,
          borderRadius: 10,
          borderColor: CustomColor.primaryColor),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);
    // this.controller = controller;
    controller.scannedDataStream.listen((barcode) => setState(() {
          this.barcode = barcode;
          // print(this.barcode!.code);
          readQr();
        }));
  }

  _iconButtonWidget(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: Dimensions.defaultPaddingSize * 0.8),
      margin: EdgeInsets.only(
        bottom: Dimensions.marginSize,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.moneyTransferScreen);
          },
          child: CircleAvatar(
            radius: 30,
            backgroundColor: CustomColor.primaryColor,
            child: SvgPicture.asset(
              Assets.edit,
          colorFilter: const ColorFilter.mode(
                  CustomColor.whiteColor, BlendMode.srcIn),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.moneyTransferScreen);
          },
          child: CircleAvatar(
            radius: 30,
            backgroundColor: CustomColor.primaryColor,
            child: SvgPicture.asset(
              Assets.scanqr,
                colorFilter:
                  const ColorFilter.mode(CustomColor.whiteColor, BlendMode.srcIn),
            ),
          ),
        ),
        CircleAvatar(
          radius: 30,
          backgroundColor: CustomColor.primaryColor,
          child: SvgPicture.asset(
            Assets.torch,
           colorFilter:
                const ColorFilter.mode(CustomColor.whiteColor, BlendMode.srcIn),
          ),
        ),
      ]),
    );
  }
}
