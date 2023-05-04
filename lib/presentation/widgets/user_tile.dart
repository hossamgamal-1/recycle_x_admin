import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app/app_injection.dart';
import '../../data/model/user.dart';
import '../business_logic/cubit/web_services/web_services_cubit.dart';
import '../resources/color_manager.dart';

class UserTile extends StatelessWidget {
  const UserTile(this.user, {super.key});
  final User user;
  @override
  Widget build(BuildContext context) {
    int total = user.points.plastic +
        user.points.metal +
        user.points.organicMaterials +
        user.points.paperAndCarton;
    Widget test(String key) {
      return Row(
        children: [
          _customIconButton(Icons.add, () {
            Map<String, dynamic> userData = user.toJson();
            userData['fields'][key]['integerValue'] =
                (int.parse(userData['fields'][key]['integerValue']) + 1)
                    .toString();

            sL<WebServicesCubit>().updateClientUserPoint(userData);
          }),
          const SizedBox(width: 5),
          _customIconButton(Icons.remove, () {
            Map<String, dynamic> userData = user.toJson();
            userData['fields'][key]['integerValue'] =
                (int.parse(userData['fields'][key]['integerValue']) - 1)
                    .toString();

            sL<WebServicesCubit>().updateClientUserPoint(userData);
          }),
        ],
      );
    }

    return Column(
      children: [
        Text('الاسم : ${user.name}'),
        Text('الرقم القومي : ${user.id}'),
        Text('العنوان : ${user.address}'),
        SizedBox(
          width: 5.w,
          child: const Divider(color: ColorManager.darkGrey),
        ),
        const Text('النقاط'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('بلاستيك : ${user.points.plastic}'),
            test('points_plastic'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('ورق وكارتون : ${user.points.paperAndCarton}'),
            test('points_paper'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('معدن وصفيح : ${user.points.metal}'),
            test('points_metal'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('مواد عضوية : ${user.points.organicMaterials}'),
            test('points_organic'),
          ],
        ),
        Text('الإجمالي : $total'),
      ],
    );
  }

  Widget _customIconButton(IconData icon, void Function()? onPressed) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.mainColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, size: 20, color: ColorManager.white),
      ),
    );
  }
}
