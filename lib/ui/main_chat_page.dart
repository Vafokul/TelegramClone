import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/ui/message_page.dart';

class MainChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()=>Navigator.pop(context),
          icon: Icon(Icons.arrow_back,color: Colors.white,),
        ),
        backgroundColor: Colors.blueAccent,
        title: Text('Chats', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
            color: Colors.white,
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
          if(index%2==0){
            return ChatItem(contactName:'Contact $index' ,sent: true);
          } else{
            return ChatItem(contactName:'Contact $index',sent: false);
          }

        },
        separatorBuilder: (context, index) =>
          DividerWithShadow(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => null, // Handle new chat creation
        child: Icon(Icons.chat),
      ),
    );
  }
}

class DividerWithShadow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        SizedBox(width: 72), // Width of the CircleAvatar plus margin
        Expanded(
          child: Container(
            child: Divider(
              thickness: 1.0,
              color: Colors.grey[300],
            ),
          ),
        ),
      ],
    );
  }
}

class ChatItem extends StatelessWidget {
  late final bool sent;
  final String contactName;
  ChatItem({super.key, required this.contactName, required this.sent});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      dense: true,
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?fm=jpg&w=3000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGhvdG98ZW58MHx8MHx8fDA%3D'),
        ),
        title: Text('Contact me',style: TextStyle(fontSize: 14.0),),
        subtitle: Row(
          children: [
            Expanded(child:Text('Last message preview',style: TextStyle(fontSize: 12.0),
            ),

            ),
            if(sent) Icon(Icons.done,size:16.0,color:Colors.blue) else Image.asset('assets/icons/sentt.png'),
          ],
        ),

        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('12:34 PM',style: TextStyle(fontSize: 12.0)),
            SizedBox(height: 5),
            CircleAvatar(
              radius: 10.0,
              child: Text('2',style: TextStyle(fontSize: 12.0)),
            ),
          ],
        ),
        onTap: () {
          //Handle chat item tap
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MessagePage(contactName:contactName)
          ),
          );
        },
    );
  }
}
