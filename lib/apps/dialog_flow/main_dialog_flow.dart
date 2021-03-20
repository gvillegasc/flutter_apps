import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_dialogflow/flutter_dialogflow.dart';
import 'package:flutter_ui_app/apps/dialog_flow/models/Message.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class MainDialogFlow extends StatefulWidget {
  @override
  _MainDialogFlowState createState() => _MainDialogFlowState();
}

class _MainDialogFlowState extends State<MainDialogFlow> {
  final _focusNode = FocusNode();
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<MessageBubble> messageList = [];
  Dialogflow dialogflow;

  @override
  void initState() {
    super.initState();
    responseDialog('Hola');
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
          0, MessageBubble(message: Message(typeUser: 'user', message: query)));
    });

    dialogflow = const Dialogflow(token: 'd3d91773ebc24be5811a919c4047c527');
    final response = await dialogflow.sendQuery(message);
    setState(() {
      messageList.insert(
          0,
          MessageBubble(
              message: Message(
                  typeUser: 'dialog', message: response.getMessageResponse())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialog Flow'),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Flexible(
                child: ListView.builder(
                    reverse: true,
                    controller: _scrollController,
                    padding: const EdgeInsets.only(top: 10),
                    itemCount: messageList.length,
                    itemBuilder: (_, i) => messageList[i])),
            const Divider(
              height: 1,
            ),
            Container(
              color: Colors.white,
              child: _inputChat(),
            )
          ],
        ),
      ),
    );
  }

  void _sendMessage() {
    if (_textController.text.isNotEmpty) {
      responseDialog(_textController.text);
      _textController.clear();
      _focusNode.requestFocus();
    }
  }

  Widget _inputChat() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                textInputAction: TextInputAction.send,
                onEditingComplete: _sendMessage,
                decoration: const InputDecoration.collapsed(
                    hintText: 'Escribe un mensaje!'),
                focusNode: _focusNode,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: Platform.isIOS
                  ? CupertinoButton(
                      child: const Text('Send'), onPressed: _sendMessage)
                  : Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      child: IconButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          icon: const Icon(
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
  const MessageBubble({Key key, @required this.message}) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: responsive.width,
      child: message.typeUser == 'dialog'
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: responsive.inchR(1)),
                const CircleAvatar(
                  backgroundColor: Colors.redAccent,
                  child: Text('DF', style: TextStyle(color: Colors.white)),
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
                      style: const TextStyle(color: Colors.black),
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
                      style: const TextStyle(color: Colors.white),
                    )),
                SizedBox(width: responsive.inchR(1)),
                const CircleAvatar(
                  child: Text('US'),
                ),
                SizedBox(width: responsive.inchR(1)),
              ],
            ),
    );
  }
}
