import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanamind/cubit/kelola/plant_category_cubit.dart';
import 'package:tanamind/cubit/kelola/plant_category_state.dart';
import 'package:tanamind/model/kelola_model/plant_model.dart';

class TesCubit extends StatefulWidget {
  @override
  _TesCubitState createState() => _TesCubitState();
}

class _TesCubitState extends State<TesCubit> {

  PlantCategoryCubit cubit;

  @override
  void initState() {
    cubit = BlocProvider.of<PlantCategoryCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          BlocBuilder<PlantCategoryCubit, PlantCategoryState>(
              // ignore: missing_return
              builder: (context, state){
                if(state is InitialState){
                  return Center(child: CircularProgressIndicator(),);
                }else if(state is CategoryIsLoaded){
                  print('loaded state : ${state.list}');
                  return _build(state.list);
                }else if(state is CategoryIsError){
                  print('error state : ${state.message}');
                  return Center(child: Text('Error'),);
                }
              })
        ],
      ),
    );
  }

  Widget _build(List<PlantCategoryModel> data){
    return ListView.builder(
        itemCount: data.length,
        shrinkWrap: true,
        itemBuilder: (context, index){
          return Text(data[index].name);
        });
  }
}
