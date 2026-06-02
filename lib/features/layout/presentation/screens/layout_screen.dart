import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_academy/features/layout/presentation/cubit/layout_cubit/layout_cubit.dart';
import 'package:your_academy/features/layout/presentation/cubit/layout_cubit/layout_states.dart';

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
          return Scaffold(
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)
                
              ),
              child: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                  onTap: (index) {
                    cubit.changeIndex(index);
                  },
                  items:
                  [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home_outlined), label: 'Home'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.book_online_outlined),
                        label: 'My Courses'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person_outline), label: 'Profile')

                  ]
              ),
            ),
          );
        },
      ),
    );
  }
}
