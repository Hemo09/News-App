import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapp/Network/local/cacheHelper.dart';
import 'package:newsapp/Network/remote/dio_helper.dart';
import 'package:newsapp/newsLayouts/newsLayout.dart';
import 'package:newsapp/shared/cubit/newCubit.dart';
import 'package:newsapp/shared/cubit/newsStates.dart';
import 'Network/BoocObserve/bloc_Observe.dart';


void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getBoolean(key: 'isDark');
  runApp( MyApp(isDark));
}
class MyApp extends StatelessWidget
{
  late bool? isDark;
  MyApp(this.isDark);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>NewCubit()..getBusinessData()..getSportsData()..getScienceData()..changeAppMode(isShared: isDark)..getSearchData(),
      child: BlocConsumer<NewCubit , NewStates>(
        listener: (context , state){},
        builder: (context , state)
        {
          return  MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.deepPurple,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme:const AppBarTheme(
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type:BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepPurple,
              ),
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.grey,
              bottomNavigationBarTheme:  BottomNavigationBarThemeData(
                backgroundColor: HexColor('333739'),
                type:BottomNavigationBarType.fixed,
                unselectedItemColor: Colors.grey,
                selectedItemColor: Colors.white,
              ),
              appBarTheme: AppBarTheme(
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('333739'),
                  statusBarIconBrightness: Brightness.light,
                ),
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
                backgroundColor: HexColor('333739'),
                elevation: 0.0,
                iconTheme: const IconThemeData(
                  color: Colors.white,
                ),
              ),
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
              scaffoldBackgroundColor: HexColor('333739'),
            ),
            //NewCubit.get(context).isDark? ThemeMode.dark :ThemeMode.light
            themeMode: NewCubit.get(context).isDark? ThemeMode.light :ThemeMode.dark,
            debugShowCheckedModeBanner: false,
            home: NewLayouts(),
          );
        },
      ),
    );
  }
}

