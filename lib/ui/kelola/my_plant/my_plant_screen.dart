import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tanamind/helper/constant.dart';
import 'package:tanamind/helper/style.dart';
import 'package:tanamind/ui/kelola/detail/detail_screen_2.dart';
import 'package:tanamind/ui/kelola/my_plant/my_plant_view_model.dart';

class MyPlantScreen extends StatefulWidget {
  @override
  MyPlantViewScreen createState() => MyPlantViewScreen();
}

class MyPlantViewScreen extends MyPlantViewModel {
  var size;
  var _selectedIndex;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          _buildHeader(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
              'Anda memiliki 10 tanaman',
              style: TextStyle(
                fontFamily: "Montserrat",
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          ),
          _buildFilter(),
          SizedBox(
            height: 10,
          ),
          _buildListPlant()
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'TANAMANKU',
            style: TextStyle(
              fontFamily: "Montserrat",
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.grey,
            foregroundColor: Colors.grey,
            child: Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFilter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: listFilter.map((e) {
        return InkWell(
          onTap: () {
            setState(() {
              _selectedIndex = e;
            });
          },
          child: Container(
            width: 100,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: _selectedIndex == e ? mainGreen : Color(0xff81af8a),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '$e',
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildListPlant() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GridView.builder(
        itemCount: listPlant.length,
        shrinkWrap: true,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return _buildCardPlant(listPlant, index);
        },
      ),
    );
  }

  Widget _buildCardPlant(var list, int index) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, '/detail_tanaman', arguments: {
        'title': list[index]['title'],
        'image': list[index]['image']
      }),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              new BoxShadow(
                color: Colors.black38,
                blurRadius: 2.0,
              ),
            ]),
        child: Stack(
          children: [
            Hero(
              tag: list[index]['image'],
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(
                  list[index]['image'],
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 200,
              width: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(4)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${list[index]['title']}',
                    style: fontMonsserat(18.0, FontWeight.w500, Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    '${list[index]['label']}',
                    style: fontMonsserat(16.0, FontWeight.w500, Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
