import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/Components/components.dart';
import 'package:newsapp/shared/cubit/newCubit.dart';
import 'package:newsapp/shared/cubit/newsStates.dart';

class SearchScreen extends StatelessWidget {

  TextEditingController? searchController;
  var validateKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewCubit , NewStates>(
        listener: (context , state){},
        builder: (context , state)
        {
          var list = NewCubit.get(context).search;
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: validateKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child:   /*TextFormField(
                      cursorColor: Colors.red,
                      controller: searchController,
                      keyboardType: TextInputType.text,
                     validator: (String? value){
                        if(value!.isEmpty)
                        {
                          validateKey.currentState!.validate();
                        }
                        return "Search must not be empty";
                      },
                      onChanged: (value){
                        NewCubit.get(context).getSearchData(value: value);
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          label: const Text('Search'),
                          labelStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                          ),
                          border:
                          OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
                    ),*/TextFormField(
                      keyboardType: TextInputType.text,
                      onFieldSubmitted: (value)
                      {
                        NewCubit.get(context).getSearchData(value: value);
                      },
                      controller: searchController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        labelText: 'Search',
                          border:
                          OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
                      ),
                    ),

                  Expanded(child: articleItem(list)),
                ],
              ),
            ),
          );
        }

    );
  }
}
