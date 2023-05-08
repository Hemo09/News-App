import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/cubit/newCubit.dart';
import 'package:newsapp/shared/cubit/newsStates.dart';

import '../../shared/Components/components.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewCubit, NewStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewCubit.get(context).business;
          return articleItem(list);
        }
    );
  }
}
