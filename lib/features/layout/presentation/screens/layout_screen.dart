import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_academy/core/theme/app_radius.dart';
import 'package:your_academy/features/layout/presentation/cubit/layout_cubit/layout_cubit.dart';
import 'package:your_academy/features/layout/presentation/cubit/layout_cubit/layout_states.dart';
import 'package:your_academy/l10n/app_localizations.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          LayoutCubit cubit = LayoutCubit.get(context);
          final l10n = AppLocalizations.of(context)!;
          return Scaffold(
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppRadius.r20),
                topRight: Radius.circular(AppRadius.r20),
              ),
              child: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.changeIndex(index);
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    label: l10n.home,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.book_online_outlined),
                    label: l10n.myCourses,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline),
                    label: l10n.profile,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
