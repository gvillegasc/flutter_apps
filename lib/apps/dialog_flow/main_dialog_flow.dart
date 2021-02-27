import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_dialogflow/flutter_dialogflow.dart';
import 'package:flutter_ui_app/apps/dialog_flow/models/Message.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:flutter_ui_app/main.dart';

class MainDialogFlow extends StatefulWidget {
  @override
  _MainDialogFlowState createState() => _MainDialogFlowState();
}

class _MainDialogFlowState extends State<MainDialogFlow> {
  final _focusNode = new FocusNode();
  final TextEditingController _textController = new TextEditingController();
  ScrollController _scrollController = new ScrollController();
  List<MessageBubble> messageList = [];

  @override
  void initState() {
    super.initState();
    responseDialog("Hola");
  }

  @override
  void dispose() {
    _textController?.dispose();
    _focusNode?.dispose();
    _scrollController?.dispose();
    super.dispose();
  }

  void responseDialog(String query) async {
    final message = query.trim().replaceAll(' ', '_');
    setState(() {
      messageList.insert(
          0, MessageBubble(message: Message(typeUser: "user", message: query)));
    });

    Dialogflow dialogflow =
        Dialogflow(token: "d3d91773ebc24be5811a919c4047c527");
    AIResponse response = await dialogflow.sendQuery(message);
    setState(() {
      messageList.insert(
          0,
          MessageBubble(
              message: Message(
                  typeUser: "dialog", message: response.getMessageResponse())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => MenuApps()));
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Dialog Flow'),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Flexible(
                  child: ListView.builder(
                      reverse: true,
                      controller: _scrollController,
                      padding: EdgeInsets.only(top: 10),
                      itemCount: messageList.length,
                      itemBuilder: (_, i) => messageList[i])),
              Divider(
                height: 1,
              ),
              Container(
                color: Colors.white,
                child: _inputChat(),
              )
            ],
          ),
        ),
      ),
    );
  }

  _sendMessage() {
    if (_textController.text.trim().length > 0) {
      responseDialog(_textController.text);
      _textController.clear();
      _focusNode.requestFocus();
    }
  }

  Widget _inputChat() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                textInputAction: TextInputAction.send,
                onEditingComplete: _sendMessage,
                decoration:
                    InputDecoration.collapsed(hintText: "Escribe un mensaje!"),
                focusNode: _focusNode,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              child: Platform.isIOS
                  ? CupertinoButton(
                      child: Text("Send"), onPressed: _sendMessage)
                  : Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      child: IconButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          icon: Icon(
                            Icons.send,
                            color: Colors.blue,
                          ),
                          onPressed: _sendMessage),
                    ),
            )
          ],
        ),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble({Key key, @required this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      width: responsive.width,
      child: message.typeUser == "dialog"
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: responsive.inchR(1)),
                CircleAvatar(
                  backgroundColor: Colors.redAccent,
                  child: Text("DF", style: TextStyle(color: Colors.white)),
                ),
                SizedBox(width: responsive.inchR(1)),
                Container(
                    constraints:
                        BoxConstraints(maxWidth: responsive.widthR(50)),
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8)),
                    padding: EdgeInsets.symmetric(
                        horizontal: responsive.inchR(1.5),
                        vertical: responsive.inchR(1.2)),
                    child: Text(
                      message.message,
                      style: TextStyle(color: Colors.black),
                    )),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    constraints:
                        BoxConstraints(maxWidth: responsive.widthR(50)),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8)),
                    padding: EdgeInsets.symmetric(
                        horizontal: responsive.inchR(1.5),
                        vertical: responsive.inchR(1.2)),
                    child: Text(
                      message.message,
                      style: TextStyle(color: Colors.white),
                    )),
                SizedBox(width: responsive.inchR(1)),
                CircleAvatar(
                  child: Text("US"),
                ),
                SizedBox(width: responsive.inchR(1)),
              ],
            ),
    );
  }
}
