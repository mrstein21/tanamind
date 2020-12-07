import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tanamind/helper/constant.dart';
import 'package:tanamind/helper/style.dart';
import 'package:tanamind/ui/history_transaction/transaction_view_model.dart';

class TransactionScreen extends StatefulWidget {
  @override
  TransactionViewScreen createState() => TransactionViewScreen();
}

class TransactionViewScreen extends TransactionViewModel {
  int radioValue;
  var date;
  var status;
  var category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainGreen,
        title: Text(
          'Daftar Transaksi',
          style: fontRoboto(14.0, FontWeight.w500, Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSearch(),
          _buildFilter(),
          _buildClearCategory(),
          Expanded(child: _buildListTransaction())
        ],
      ),
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 16.0, 10.0, 8.0),
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
                    hintText: "Cari Transaksi",
                    hintStyle:
                        fontRoboto(14.0, FontWeight.w500, Colors.black26),
                    border: InputBorder.none),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilter() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
      child: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: __showBottomSheetDate,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.29,
                padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text(
                        date ?? 'Semua Tanggal',
                        style: fontRoboto(12.0, FontWeight.w500,
                            date == null ? Colors.black38 : mainGreen),
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down)
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: __showBottomSheetStatus,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.29,
                padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text(
                        status ?? 'Semua Status',
                        style: fontRoboto(12.0, FontWeight.w500,
                            status == null ? Colors.black38 : mainGreen),
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down)
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: __showBottomSheetCategory,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text(
                        category ?? 'Semua Kategori',
                        style: fontRoboto(12.0, FontWeight.w500,
                            category == null ? Colors.black38 : mainGreen),
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClearCategory() {
    if (date == null && status == null && category == null) {
      return Container();
    } else {
      return Padding(
        padding: const EdgeInsets.only(left: 16.0, bottom: 8.0, top: 8.0),
        child: InkWell(
          onTap: () {
            setState(() {
              date = null;
              status = null;
              category = null;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.black45.withOpacity(0.1),
                    spreadRadius: 2.0,
                    blurRadius: 2.0,
                    offset: Offset(0, 2),
                  ),
                ]),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.close,
                  color: Colors.red,
                  size: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 6.0, left: 6.0),
                  child: Text(
                    'Clear Filter',
                    style: fontRoboto(12.0, FontWeight.w500, Colors.black38),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  Widget _buildListTransaction() {
    return ListView.builder(
      itemCount: listTransaction.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return _buildListCard(listTransaction[index]);
      },
    );
  }

  Widget _buildListCard(var data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6.0),
            boxShadow: [
              new BoxShadow(
                color: Colors.black45.withOpacity(0.1),
                spreadRadius: 2.0,
                blurRadius: 2.0,
                offset: Offset(0, 2),
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.shopping_basket,
                        color: mainGreen,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Belanja',
                          style:
                              fontRoboto(12.0, FontWeight.w500, Colors.black),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          data['date'],
                          style:
                              fontRoboto(11.0, FontWeight.w500, Colors.black54),
                        )
                      ],
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                  decoration: BoxDecoration(
                      color: data['status'] == 'Pending'
                          ? Colors.deepPurpleAccent
                          : Colors.green.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(2)),
                  child: Text(
                    data['status'],
                    style: fontRoboto(11.0, FontWeight.w500, Colors.white),
                  ),
                )
              ],
            ),
            Divider(
              color: Colors.black26,
            ),
            IntrinsicHeight(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.asset(
                        data['image'],
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['title'],
                          style:
                              fontRoboto(14.0, FontWeight.w600, Colors.black),
                        ),
                        Text(
                          '${data['qty']} barang',
                          style:
                              fontRoboto(12.0, FontWeight.w500, Colors.black45),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
              child: Text(
                'Total Belanja',
                style: fontRoboto(12.0, FontWeight.w500, Colors.black),
              ),
            ),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    data['price'],
                    style: fontRoboto(14.0, FontWeight.w500, Colors.black),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
                    decoration: BoxDecoration(
                        color: mainGreen,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          new BoxShadow(
                            color: Colors.black45.withOpacity(0.1),
                            spreadRadius: 2.0,
                            blurRadius: 2.0,
                            offset: Offset(0, 2),
                          ),
                        ]),
                    child: Text(
                      'Beli Lagi',
                      style: fontRoboto(12.0, FontWeight.w500, Colors.white),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void __showBottomSheetDate() async {
    var filter;
    showModalBottomSheet<void>(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter state) {
            return Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    topLeft: Radius.circular(8),
                  )),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          new Text(
                            '7 hari terakhir',
                          ),
                          new Radio(
                            value: 0,
                            groupValue: radioValue,
                            onChanged: (value) {
                              state(() {
                                radioValue = value;
                                filter = '7 hari terakhir';
                              });
                            },
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.black26,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Text(
                            '30 hari terakhir',
                          ),
                          new Radio(
                            value: 1,
                            groupValue: radioValue,
                            onChanged: (value) {
                              state(() {
                                radioValue = value;
                                filter = '30 hari terakhir';
                              });
                            },
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.black26,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Text(
                            '90 hari terakhir',
                          ),
                          new Radio(
                            value: 2,
                            groupValue: radioValue,
                            onChanged: (value) {
                              state(() {
                                radioValue = value;
                                filter = '90 hari terakhir';
                              });
                            },
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.black26,
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        date = filter;
                      });
                      Navigator.pop(context, false);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Container(
                        width: 100,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        decoration: BoxDecoration(
                            color: mainGreen,
                            borderRadius: BorderRadius.circular(6)),
                        child: Text(
                          'OK',
                          style:
                              fontRoboto(14.0, FontWeight.w500, Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          });
        });
  }

  void __showBottomSheetStatus() async {
    var filter;
    showModalBottomSheet<void>(
      backgroundColor: Colors.white,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter state) {
            return Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    topLeft: Radius.circular(8),
                  )),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          new Text(
                            'Selesai',
                          ),
                          new Radio(
                            value: 0,
                            groupValue: radioValue,
                            onChanged: (value) {
                              state(() {
                                radioValue = value;
                                filter = 'Selesai';
                              });
                            },
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.black26,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Text(
                            'Pending',
                          ),
                          new Radio(
                            value: 1,
                            groupValue: radioValue,
                            onChanged: (value) {
                              state(() {
                                radioValue = value;
                                filter = 'Pending';
                              });
                            },
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.black26,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Text(
                            'Batal',
                          ),
                          new Radio(
                            value: 2,
                            groupValue: radioValue,
                            onChanged: (value) {
                              state(() {
                                radioValue = value;
                                filter = 'Batal';
                              });
                            },
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.black26,
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        status = filter;
                      });
                      Navigator.pop(context, false);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Container(
                        width: 100,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        decoration: BoxDecoration(
                            color: mainGreen,
                            borderRadius: BorderRadius.circular(6)),
                        child: Text(
                          'OK',
                          style:
                              fontRoboto(14.0, FontWeight.w500, Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          });
        });
  }

  void __showBottomSheetCategory() async {
    var filter;
    showModalBottomSheet<void>(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter state) {
            return Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    topLeft: Radius.circular(8),
                  )),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          new Text(
                            'Diskon',
                          ),
                          new Radio(
                            value: 0,
                            groupValue: radioValue,
                            onChanged: (value) {
                              state(() {
                                radioValue = value;
                                filter = 'Diskon';
                              });
                            },
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.black26,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Text(
                            'Promo',
                          ),
                          new Radio(
                            value: 1,
                            groupValue: radioValue,
                            onChanged: (value) {
                              state(() {
                                radioValue = value;
                                filter = 'Promo';
                              });
                            },
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.black26,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Text(
                            'Sale',
                          ),
                          new Radio(
                            value: 2,
                            groupValue: radioValue,
                            onChanged: (value) {
                              state(() {
                                radioValue = value;
                                filter = 'Sale';
                              });
                            },
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.black26,
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        category = filter;
                      });
                      Navigator.pop(context, false);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Container(
                        width: 100,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        decoration: BoxDecoration(
                            color: mainGreen,
                            borderRadius: BorderRadius.circular(6)),
                        child: Text(
                          'OK',
                          style:
                              fontRoboto(14.0, FontWeight.w500, Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          });
        });
  }
}
