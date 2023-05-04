import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../business_logic/cubit/home_page/home_page_cubit.dart';
import '../widgets/nav_bar.dart';
import 'home_page_content.dart';
import 'qr_code_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      const HomePageContent(),
      const QrCodeScanner(),
    ];
    AppBar getAppBar() => AppBar(
          leading: InkWell(
            onTap: () {},
            child: const Icon(Icons.person),
          ),
        );
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocProvider(
        create: (context) => HomePageCubit(),
        child: Scaffold(
          appBar: getAppBar(),
          body: BlocBuilder<HomePageCubit, HomePageState>(
            builder: (context, state) =>
                pages[context.read<HomePageCubit>().currentNavBarIndex],
          ),
          bottomNavigationBar: const HomePageNavBar(),
          endDrawer: const Drawer(),
        ),
      ),
    );
  }
}
