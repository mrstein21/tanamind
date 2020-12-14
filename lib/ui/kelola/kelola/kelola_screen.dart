import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tanamind/cubit/kelola/plant_category_cubit.dart';
import 'package:tanamind/cubit/kelola/plant_category_state.dart';
import 'package:tanamind/global.dart';
import 'package:tanamind/helper/constant.dart';
import 'package:tanamind/helper/style.dart';
import 'package:tanamind/model/kelola_model/plant_model.dart';
import 'package:tanamind/ui/kelola/kelola/kelola_view_model.dart';

class KelolaScreen extends StatefulWidget {
  @override
  KelolaViewScreen createState() => KelolaViewScreen();
}

class KelolaViewScreen extends KelolaViewModel {
  Size size;
  double _animatedWidth = 0;
  var _selectedIndex;
  var _selectedIndexRight;

  PlantCategoryCubit cubit;

  @override
  void initState() {
    cubit = BlocProvider.of<PlantCategoryCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Text(
                    'KELOLA',
                    style: fontMonsserat(18.0, FontWeight.w500, Colors.black),
                  ),
                ),
                _buildSearch(),
                SizedBox(
                  height: 14,
                ),
                _buildFilter(),
                SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 6, 16, 6),
                  child: Text(
                    'Pot status benih',
                    style: fontMonsserat(16.0, FontWeight.w500, Colors.black),
                  ),
                ),
                _buildListPlant()
              ],
            ),
          ),
          /*_buildFilterRight()*/
        ],
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
                if (_animatedWidth == 40)
                  _animatedWidth = 0;
                else
                  _animatedWidth = 40;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 8.0),
              child: Container(
                child: RotatedBox(
                  quarterTurns: _animatedWidth == 40 ? -1 : 0,
                  child: Icon(
                    Icons.filter_list,
                    size: 30,
                    color: _animatedWidth == 40 ? mainGreen : Colors.black,
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
                    _selectedIndex = e.name;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  decoration: BoxDecoration(
                    color: _selectedIndex == e.name
                        ? mainGreen
                        : Color(0xff81af8a),
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

  Widget _buildListPlant() {
    return ListView.builder(
        itemCount: listGlobal.length,
        reverse: true,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return _buildCardPlant(listGlobal, index);
        });
  }

  Widget _buildCardPlant(var list, int index) {
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
                  list[index]['image'],
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
                    Text('${list[index]['title']}',
                        style:
                            fontMonsserat(18.0, FontWeight.w500, Colors.black)),
                    Column(
                      children: [
                        LinearProgressIndicator(
                          minHeight: 6,
                          backgroundColor: Colors.grey[300],
                          value: list[index]['panen'],
                          valueColor:
                              new AlwaysStoppedAnimation<Color>(Colors.green),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '25 hari menuju panen',
                            style: fontMonsserat(
                                15.0, FontWeight.w500, Colors.black38),
                          ),
                        ),
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
