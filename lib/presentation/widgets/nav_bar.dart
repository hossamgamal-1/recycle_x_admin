import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../business_logic/cubit/home_page/home_page_cubit.dart';

class HomePageNavBar extends StatelessWidget {
  const HomePageNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
      builder: (context, state) {
        var read = context.read<HomePageCubit>();
        return BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code),
              label: 'Qr Code',
            ),
          ],
          onTap: read.setNewNavBarIndex,
          currentIndex: read.currentNavBarIndex,
        );
      },
    );
  }
}
