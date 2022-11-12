import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrpay/utils/size.dart';
import 'package:timelines/timelines.dart';

import '../../data/delivery_data.dart';
import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';

class DeliveryTrackingPage extends StatelessWidget {
  const DeliveryTrackingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 1,
      itemBuilder: (context, index) {
        final data = dataList(index + 1);
        return Center(
          child: _DeliveryProcesses(
            processes: data.deliveryProcesses,
          ),
        );
      },
    );
  }
}

class _DeliveryProcesses extends StatelessWidget {
  const _DeliveryProcesses({Key? key, required this.processes})
      : super(key: key);

  final List<DeliveryProcess> processes;
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        color: Color(0xff9b9b9b),
        fontSize: 12.5,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: FixedTimeline.tileBuilder(
             
          theme: TimelineThemeData(

            nodePosition: 0,
            color: CustomColor.primaryColor,
            indicatorTheme: const IndicatorThemeData(
              position: 0,
              size: 20.0,
             
            ),
           
          ),
          builder: TimelineTileBuilder.connected(
            connectionDirection: ConnectionDirection.before,
            itemCount: processes.length,
            contentsBuilder: (_, index) {
              if (processes[index].isCompleted) return null;

              return Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      processes[index].name,
                      style: GoogleFonts.inter(
                        color: CustomColor.primaryTextColor,
                        fontSize: Dimensions.mediumTextSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      processes[index].details,
                      style: GoogleFonts.inter(
                        color: CustomColor.primaryTextColor,
                        fontSize: Dimensions.extraSmallTextSize,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    addVerticalSpace(Dimensions.heightSize * 2)
                  ],
                ),
              );
            },
            indicatorBuilder: (_, index) {
              if (processes[index].isCompleted) {
                return Container(
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: CustomColor.primaryColor, width: 2.5),
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(2),
                  child: CircleAvatar(
                    radius: Dimensions.radius * 0.6,
                    backgroundColor: CustomColor.primaryColor,
                  ),
                );
              } else {
                return const OutlinedDotIndicator(
                  borderWidth: 1.5,
                  color: CustomColor.primaryColor,
                );
              }
            },
            connectorBuilder: (_, index, ___) => DashedLineConnector(
              color:
                  processes[index].isCompleted ? CustomColor.primaryColor : null,
            ),
          ),
        ),
      ),
    );
  }
}

