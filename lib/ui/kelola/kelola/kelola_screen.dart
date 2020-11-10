import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tanamind/ui/kelola/kelola/kelola_view_model.dart';

class KelolaScreen extends StatefulWidget {
  @override
  KelolaViewScreen createState() => KelolaViewScreen();
}

class KelolaViewScreen extends KelolaViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Text(
              'KELOLA',
              style: TextStyle(
                  fontFamily: "Montserrat",
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
          ),
          _buildSearch(),
          SizedBox(height: 14,),
          _buildFilter(),
          SizedBox(height: 12,),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 6, 16, 6),
            child: Text(
              'Pot status benih',
              style: TextStyle(
                  fontFamily: "Montserrat",
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          ),
          _buildListPlant()
        ],
      ),
    );
  }

  Widget _buildSearch() {
    return Container(
      margin: EdgeInsets.only(top: 15, left: 10, right: 10),
      padding: EdgeInsets.all(1),
      child: Center(
        child: TextFormField(
          decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              prefixIcon: Icon(Icons.search),
              hintText: "Cari barang disini.."),
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            new BoxShadow(
              color: Colors.black38,
              blurRadius: 2.0,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(30))),
    );
  }

  Widget _buildFilter(){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: listFilter.map((e) {
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.green,
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
        );
      }).toList(),
    );
  }

  Widget _buildListPlant(){
    return ListView.builder(
        itemCount: listTanaman.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index){
          return _buildCardPlant(listTanaman, index);
        });
  }

  Widget _buildCardPlant(var list, int index){
    return InkWell(
      onTap: () => Navigator.pushNamed(context, '/list_tanamanku'),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              new BoxShadow(
                color: Colors.black38,
                blurRadius: 2.0,
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
                        Text(
                          '${list[index]['title']}',
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 18,
                          ),
                        ),
                        Column(
                          children: [
                            LinearProgressIndicator(
                              minHeight: 6,
                              backgroundColor: Colors.grey[300],
                              value: list[index]['panen'],
                              valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
                            ),
                            SizedBox(height: 8,),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                '25 hari menuju panen',
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Colors.black87,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
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
