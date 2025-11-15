import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:laravel_echo/laravel_echo.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../constants/app_prefs.dart';

// This class manages the Socket.IO connection and provides methods for sending and listening to events.
class SocketService {
  // Private constructor to enforce singleton pattern
  SocketService._();
  StreamController<bool>? socketController;
  static SocketService _instance = SocketService._();
  // Factory method to access the singleton instance
  factory SocketService() => _instance;
  StreamSubscription<bool>? streamSubscription;
  // Create a Socket.IO client instance
  IO.Socket? socket;
  Echo? echo;
  // Initialize the Socket.IO connection and Laravel Echo instance

  connect(Function(bool event) readyToListen) {
    print("start to connect");
    socketController = StreamController();
    startStreamSubscription(readyToListen);
    socketController?.sink.add(false);
    try {
      // Connect to the Socket.IO server at 'https://mnkaf.qa:6001'
      socket = IO.io(
        'https://backend.mazadat-sat.com:6001',
        // Disable automatic connection, set reconnection attempts, and set timeout
        IO.OptionBuilder()
            .disableAutoConnect()
            .setReconnectionAttempts(5)
            .setTimeout(10000)
            .setExtraHeaders({'Authorization': 'Bearer ${AppPrefs.token}'})
            // .setExtraHeaders({'Authorization': 'Bearer ${AppPrefs.token}'})
            // Use only the 'websocket' transport
            .setTransports(["websocket"]).build(),
      );

      // Create an Echo instance using the Socket.IO client
      echo = Echo(
        broadcaster: EchoBroadcasterType.SocketIO,
        client: socket,
        options: {
          'auth': {
            'headers': {
              'Authorization': 'Bearer ${AppPrefs.token}',
            }
          },
        },
      );
      // Listening private channel
      // Print Socket.IO connection status messages
      _getSocketLogs(echo?.connector.socket as IO.Socket);
    } catch (error) {
      // Handle Socket.IO connection errors
      _logError(error);
    }
  }

  listenToChannelWithEvent(
      {required String channel,
      required int id,
      required String event,
      required Function(Map<String, dynamic> data) listenCallback}) {
    echo?.private('$channel.$id').listen(event, listenCallback);
  }

  // Print Socket.IO connection event logs
  _getSocketLogs(IO.Socket socket) {
    socket.onConnect((data) {
      debugPrint('socket is connected $data');
      socketController?.sink.add(true);
    });
    socket.onDisconnect((data) {
      debugPrint('socket is disconnected $data');
      socketController?.sink.add(false);
    });
    socket.onError((data) {
      debugPrint('socket error $data');
      socketController?.sink.add(false);
    });
    socket.onReconnect((data) {
      debugPrint('socket on reconnecting $data');
      socketController?.sink.add(false);
    });
    socket.onReconnectFailed((data) {
      debugPrint('socket on reconnecting failed$data');
      socketController?.sink.add(false);
    });
    socket.onReconnectAttempt((data) {
      debugPrint('socket on reconnecting attempt$data');
      socketController?.sink.add(false);
    });
    socket.onReconnectError((data) {
      debugPrint('socket on reconnecting error $data');
      socketController?.sink.add(false);
    });
    socket.onConnect((data) => debugPrint('socket on connecting $data'));
    socket.onConnectError((data) {
      debugPrint('socket on connect error $data');
      socketController?.sink.add(false);
    });
    socket.onPing((data) => debugPrint('socket on ping$data'));
    socket.onPong((data) => debugPrint('socket on pong$data'));
  }

  // Send an event to the specified channel with the provided data
  send({required String channel, required Map data}) =>
      socket?.emit(channel, data);

  // Listen for events on the specified channel and invoke the provided handler function with the received data
  listen({
    required String channel,
    required dynamic Function(dynamic) handler,
  }) {
    print("enteeeeeeeeeeeeeeeeee");
    print(channel);
    socket?.on(channel, (data) {
      // Handle incoming data
      print('Received data: ${data['message']}');
      handler(data);
    });
  }

  close() {
    streamSubscription?.cancel();

    socketController?.close();
    socket?.close();
  }

  void _logError(error) {
    // Log error details using your chosen logging service
    // e.g., print to console, file, or send to remote server
    debugPrint('SocketService error: ${error.toString()}');
  }

  startStreamSubscription(Function(bool event) readyToListen) {
    streamSubscription = socketController?.stream.listen(readyToListen);
  }
}
