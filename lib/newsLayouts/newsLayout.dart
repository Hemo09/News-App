import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Network/remote/dio_helper.dart';
import 'package:newsapp/modules/searchScreen/searchScree.dart';
import 'package:newsapp/shared/cubit/newCubit.dart';
import 'package:newsapp/shared/cubit/newsStates.dart';

class NewLayouts extends StatelessWidget {
  bool? isDark = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewCubit ,NewStates>(
      listener: (context , states){},
      builder: (context,states)
      {
        NewCubit cubit = NewCubit.get(context);
        return Scaffold(
          appBar: AppBar(
           title: const Text(
          'News App',
        ),
            actions: [
              IconButton(onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
              }, icon: const Icon(Icons.search,
                size: 25,
              )
              ),
              IconButton(onPressed: (){

                cubit.changeAppMode();
              }, icon: const Icon(Icons.brightness_4_outlined,
                size: 25,
              )
              )
            ],
          ),
          body: cubit.screen[cubit.currentIndex],

          bottomNavigationBar:BottomNavigationBar(
            items: cubit.bottomItems,
            currentIndex: cubit.currentIndex,
            onTap: (index)
            {
              cubit.changeBottomNavBar(index);
            },

          ),
        );
      },
    );
  }
}

