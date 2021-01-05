import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tanamind/cubit/kelola/plant/plant_cubit.dart';
import 'package:tanamind/cubit/kelola/plant/plant_state.dart';
import 'package:tanamind/cubit/kelola/plant_category_cubit.dart';
import 'package:tanamind/cubit/kelola/plant_category_state.dart';
import 'package:tanamind/cubit/kelola/pot/pot_cubit.dart';
import 'package:tanamind/cubit/kelola/pot/pot_state.dart';
import 'package:tanamind/global.dart';
import 'package:tanamind/helper/base_url.dart';
import 'package:tanamind/helper/constant.dart';
import 'package:tanamind/helper/style.dart';
import 'package:tanamind/model/kelola_model/plant_category_model.dart';
import 'package:tanamind/model/kelola_model/plant_model.dart';
import 'package:tanamind/model/kelola_model/pot_model.dart';
import 'package:tanamind/ui/kelola/kelola/kelola_view_model.dart';
import 'package:tanamind/ui/widget/widget_helper.dart';

class KelolaScreen extends StatefulWidget {
  @override
  KelolaViewScreen createState() => KelolaViewScreen();
}

class KelolaViewScreen extends KelolaViewModel {
  Size size;

  @override
  void initState() {
    category = BlocProvider.of<PlantCategoryCubit>(context);
    pot = BlocProvider.of<PotCubit>(context);
    plant = BlocProvider.of<PlantCubit>(context);
    if (tokenGlobal != null) {
      category.getCategory();
      plant.getData();
      pot.getData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    if (tokenGlobal == null) {
      return _buildLogin();
    } else {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        body: SafeArea(
          child: BlocListener<PotCubit, PotState>(
            listener: (context, state){
              if(state is PotIsDeleted){
                pot.getData();
                flushBar(context, state.message);
              }else if(state is PotIsError){
                flushBar(context, state.message);
              }
            },
            child: Row(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                        child: Text(
                          'KELOLA',
                          style:
                              fontMonsserat(18.0, FontWeight.w500, Colors.black),
                        ),
                      ),
                      _buildSearch(),
                      SizedBox(
                        height: 14,
                      ),
                      /*_buildFilter(),*/
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 6, 16, 6),
                        child: Text(
                          'List Pot',
                          style:
                              fontMonsserat(16.0, FontWeight.w500, Colors.black),
                        ),
                      ),
                      _buildListPot()
                      /*_buildListPlant()*/
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  Widget _buildLogin() {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icon/ic_empty_plant.png'),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0, top: 16),
              child: Text(
                'Anda harus melakukan login terlebih',
                style: fontRoboto(16.0, FontWeight.w500, Colors.black),
              ),
            ),
            InkWell(
              onTap: () => Navigator.pushNamed(context, '/login',
                  arguments: {'page': 'kelola'}),
              child: Container(
                width: 150,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                decoration: BoxDecoration(
                    color: mainGreen, borderRadius: BorderRadius.circular(8)),
                child: Text(
                  'LOGIN',
                  style: fontRoboto(14.0, FontWeight.w500, Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /*Widget _buildFilterRight() {
    return AnimatedContainer(
      width: _animatedWidth,
      duration: Duration(milliseconds: 450),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Column(
          children: listFilter.map((e) {
            return Expanded(
              child: Container(
                color: mainGreen,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 8),
                child: RotatedBox(
                    quarterTurns: 1,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedIndexRight = e;
                        });
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                        decoration: BoxDecoration(
                            color: _selectedIndexRight == e
                                ? Colors.white.withOpacity(0.5)
                                : mainGreen,
                            borderRadius: BorderRadius.circular(16)),
                        child: Text(
                          '$e',
                          style: GoogleFonts.roboto(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      ),
                    )),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }*/

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.black45.withOpacity(0.1),
                    spreadRadius: 2.0,
                    blurRadius: 2.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.black26,
                  ),
                  Expanded(
                    child: TextField(
                      controller: search,
                      onSubmitted: (value) => onSearch(value),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(8, 0, 0, 8),
                          hintText: "Cari Tanaman",
                          hintStyle: TextStyle(color: Colors.black26),
                          border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                if (animatedWidth == 40)
                  animatedWidth = 0;
                else
                  animatedWidth = 40;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 8.0),
              child: Container(
                child: RotatedBox(
                  quarterTurns: animatedWidth == 40 ? -1 : 0,
                  child: Icon(
                    Icons.filter_list,
                    size: 30,
                    color: animatedWidth == 40 ? mainGreen : Colors.black,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFilter() {
    return BlocBuilder<PlantCategoryCubit, PlantCategoryState>(
      // ignore: missing_return
      builder: (context, state) {
        if (state is InitialState) {
          return Container();
        } else if (state is CategoryIsLoaded) {
          List<PlantCategoryModel> category = new List();
          category = state.list;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: category.map((e) {
              return InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = e.name;
                    plant.getCategory('${e.id}');
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  decoration: BoxDecoration(
                    color:
                        selectedIndex == e.name ? mainGreen : Color(0xff81af8a),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${e.name}',
                    style: fontMonsserat(14.0, FontWeight.w500, Colors.white),
                  ),
                ),
              );
            }).toList(),
          );
        } else if (state is CategoryIsError) {
          print('error state : ${state.message}');
          return Container();
        }
      },
    );
  }

  Widget _buildListPot() {
    return BlocBuilder<PotCubit, PotState>(
      // ignore: missing_return
      builder: (context, state) {
        if (state is PotIsLoading) {
          return _buildLoading();
        } else if (state is PotIsLoaded) {
          if (state.list.isEmpty) {
            return Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1),
                child: buildEmpty('Tidak ada item...'));
          } else {
            return ListView.builder(
                itemCount: state.list.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return _buildPotCard(state.list[index]);
                });
          }
        } else if (state is PotIsError) {
          return Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1),
              child: buildError('Internal Server Error...'));
        }
      },
    );
  }

  Widget _buildPotCard(PotModel data) {
    var image;
    if (data.image != null) {
      image = data.image.substring(32);
    }
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            new BoxShadow(
              color: Colors.black45.withOpacity(0.1),
              spreadRadius: 2.0,
              blurRadius: 2.0,
              offset: Offset(0, 2),
            ),
          ]),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: data.image != null
                    ? CachedNetworkImage(
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                        imageUrl: 'http://192.168.1.14/tanamind-api/$image',
                      )
                    : Container(
                        width: 120,
                        height: 120,
                        color: Colors.grey[300].withOpacity(0.8),
                      ),
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${data.name.replaceFirst(data.name[0], data.name[0].toUpperCase())}',
                          style:
                              fontMonsserat(14.0, FontWeight.w500, Colors.black),
                        ),
                        SizedBox(
                          height: 12.0,
                        ),
                        Text(
                          '${data.description.replaceFirst(data.description[0], data.description[0].toUpperCase())}',
                          style:
                              fontMonsserat(12.0, FontWeight.w500, Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: PopupMenuButton(
                      offset: Offset(0, 50),
                      onSelected: choiceAction,
                      elevation: 4.0,
                      itemBuilder: (BuildContext ctx) {
                        idPot = data.id;
                        return popButton.map((String choice) {
                          return PopupMenuItem<String>(
                            value: choice,
                            child: new Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.delete,
                                    color: mainGreen,
                                  ),
                                  Text(
                                    choice,
                                    style: fontRoboto(
                                        14.0, FontWeight.w500, Colors.black),
                                  )
                                ],
                              ),
                            ),
                          );
                        }).toList();
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildListPlant() {
    return BlocBuilder<PlantCubit, PlantState>(
        // ignore: missing_return
        builder: (context, state) {
      if (state is PlantIsLoading) {
        return _buildLoading();
      } else if (state is PlantIsLoaded) {
        if (state.list.isEmpty) {
          return Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1),
              child: buildEmpty('Tidak ada item...'));
        } else {
          return ListView.builder(
            itemCount: state.list.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return _buildCardPlant(state.list[index], index);
            },
          );
        }
      } else if (state is PlantIsError) {
        return Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
            child: buildError('Internal Server Error...'));
      }
    });
  }

  Widget _buildLoading() {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            height: 130,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[100],
              child: Container(
                height: 130,
                width: double.infinity,
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 8),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCardPlant(PlantModel data, int index) {
    var x;
    if (data.dateProgress != null) {
      x = (100 - data.dateProgress) / 100;
    }
    return InkWell(
      onTap: () => Navigator.pushNamed(context, '/list_tanamanku'),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              new BoxShadow(
                color: Colors.black45.withOpacity(0.1),
                spreadRadius: 2.0,
                blurRadius: 2.0,
                offset: Offset(0, 2),
              ),
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  listTanaman[index]['image'],
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${data.masterPlan.name}',
                        style:
                            fontMonsserat(18.0, FontWeight.w500, Colors.black)),
                    Column(
                      children: [
                        data.dateProgress != null
                            ? LinearProgressIndicator(
                                minHeight: 6,
                                backgroundColor: Colors.grey[300],
                                value: x,
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    Colors.green),
                              )
                            : Container(),
                        SizedBox(
                          height: 8,
                        ),
                        data.dateProgress != null
                            ? Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '${data.dateProgress} hari menuju panen',
                                  style: fontMonsserat(
                                      15.0, FontWeight.w500, Colors.black38),
                                ),
                              )
                            : Container(),
                      ],
                    )
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
