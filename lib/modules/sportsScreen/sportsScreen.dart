import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/Components/components.dart';
import '../../shared/cubit/newCubit.dart';
import '../../shared/cubit/newsStates.dart';

  class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewCubit, NewStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewCubit.get(context).sports;
          return articleItem(list);
        }
    );
  }
}
