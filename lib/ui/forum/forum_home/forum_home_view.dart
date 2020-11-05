import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'forum_home_view_model.dart';

class ForumHomeView extends ForumHomeViewModel{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,color: Colors.white,),
      ),
      appBar: AppBar(
        title: Text("Forum"),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10,top: 10,right: 10),
              child: Text("Popular Topic",style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Montserrat",fontSize: 16),),
            ),
            SizedBox(
              height: 3,
            ),
            _buildListTopic(),
            SizedBox(
              height: 8,
            ),
            Container(
              padding: EdgeInsets.only(left: 10,right: 10,top: 10),
              child: Text("Trending Post",style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Montserrat",fontSize: 16),),
            ),
            SizedBox(
              height: 3,
            ),
            _buildListQuestion()
          ],
        ),
      ),
    );
  }

  Widget _buildListQuestion(){
    return ListView.builder(
          shrinkWrap: true,
         physics: NeverScrollableScrollPhysics(),
         itemCount: list_question.length,
        itemBuilder: (context,index){
          return _buildRowQuestion(list_question[index]);
        }
    );
  }

  Widget _buildRowQuestion(var data){
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, "/detail_post");
      },
      child: Container(
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
                Icon(Icons.chat,color: Colors.grey,),
                SizedBox(width: 4,),
                Text(data["replies"]+" replies",style: TextStyle(fontFamily: "Montserrat",color: Colors.grey,fontSize: 15),textAlign: TextAlign.start,)
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildListTopic(){
    return Container(
      height: 120,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: list_topic.length,
          itemBuilder: (context,index){
            return _buildRowTopic(list_topic[index]);
      }) ,
    );
  }

  Widget _buildRowTopic(var data){
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,

        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 150,
            child: Text(data["name"],style: TextStyle(fontFamily: "Roboto",color: Colors.white,fontWeight: FontWeight.bold),),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)
              )
            ),
          )
        ],
      ),
      width: 150,
      height: 120,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(data["image"])
        ),
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          new BoxShadow(
            color: Colors.black38,
            blurRadius: 2.0,
          ),
        ]
      ),
    );
  }
  
}