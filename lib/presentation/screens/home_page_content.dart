import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app/app_injection.dart';
import '../business_logic/cubit/cach/cach_cubit.dart';
import '../business_logic/cubit/web_services/web_services_cubit.dart';
import '../resources/font_manager.dart';
import '../resources/text_style_manager.dart';
import '../resources/values_manager.dart';
import '../widgets/user_tile.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    String? uid = sL<CachCubit>().getUid();
    return DefaultTextStyle(
      style: getMediumStyle(fontSize: FontSize.s26)
          .copyWith(overflow: TextOverflow.clip),
      child: Padding(
        padding: EdgeInsets.all(AppSize.s5.w),
        child: Center(
          child: uid == null || uid == '-1'
              ? const Text('Scan the client\'s bar code')
              : _getBody(),
        ),
      ),
    );
  }
}

Widget _getBody() {
  return FutureBuilder(
    future: sL<CachCubit>().getIdToFetchUserDetails(),
    builder: (context, snapshot) {
      if (snapshot.hasData &&
          snapshot.connectionState == ConnectionState.done) {
        if (snapshot.data == null) {
          return const Text('Scan the client\'s bar code');
        }
        return BlocBuilder<WebServicesCubit, WebServicesState>(
            buildWhen: (previous, current) => current != previous,
            bloc: sL<WebServicesCubit>()
              ..getUserDetailsById(
                snapshot.data!,
                // '9YltK4fOJfP89buE65mC',
              ),
            builder: (context, state) {
              if (state is WaitingState) {
                return const CircularProgressIndicator();
              }
              if (state is FailureState) {
                return const Text('error');
              }
              if (state is LoadedState) {
                return ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    UserTile(state.user),
                  ],
                );
              } else {
                return Container();
              }
            });
      } else {
        return Container();
      }
    },
  );
}
