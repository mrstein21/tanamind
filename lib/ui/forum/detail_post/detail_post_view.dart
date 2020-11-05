import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'detail_post_view_model.dart';

class DetailPostView extends DetailPostViewModel{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Post"),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
             SizedBox(
               height: 10,
             ),
            _buildRowQuestion(question),
            Container(
              padding: EdgeInsets.only(left: 10,right: 10,top: 10),
              child: Text("Replies",style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Montserrat",fontSize: 16),),
            ),
            SizedBox(
              height: 3,
            ),
            _buildListAnswer()
          ],
        ),
      ),
    );// TODO: implement build
  }

  Widget _buildListAnswer(){
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: answer.length,
        itemBuilder: (context,index){
          return _buildRowAnswer(answer[index]);
        }
    );
  }
  Widget _buildRowAnswer(var data){
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            new BoxShadow(
              color: Colors.black38,
              blurRadius: 2.0,
            ),
          ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text(data["name"],style: TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.bold),),
            leading: CircleAvatar(
              backgroundImage: AssetImage(data["image"]),
            ),
            subtitle: Text(data["date"],style: TextStyle(fontFamily: "Montserrat",color: Colors.grey),),
          ),
          SizedBox(height: 7,),
          Text(data["answer"],style: TextStyle(fontFamily: 'Montserrat',color: Colors.black),),
          SizedBox(height: 4,),
        ],
      ),
    );
  }


  Widget _buildRowQuestion(var data){
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            new BoxShadow(
              color: Colors.black38,
              blurRadius: 2.0,
            ),
          ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text(data["name"],style: TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.bold),),
            leading: CircleAvatar(
              backgroundImage: AssetImage(data["image"]),
            ),
            subtitle: Text(data["date"],style: TextStyle(fontFamily: "Montserrat",color: Colors.grey),),
          ),
          SizedBox(height: 7,),
          Text(data["question"],style: TextStyle(fontFamily: 'Montserrat',color: Colors.black),),
          SizedBox(height: 4,),
          Divider(),
          SizedBox(height: 4,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.edit,color: Colors.grey,),
              SizedBox(width: 4,),
              Text("Tambah komentar...",style: TextStyle(fontFamily: "Montserrat",color: Colors.grey,fontSize: 15),textAlign: TextAlign.start,)
            ],
          )
        ],
      ),
    );
  }


}