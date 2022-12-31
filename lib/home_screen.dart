import 'package:bloc_app/bloc/internet_bloc.dart';
import 'package:bloc_app/bloc/internet_state.dart';
import 'package:bloc_app/cubit/internet_cubit.dart';
import 'package:bloc_app/cubit/internet_cubitState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Demo App"),
//       ),
//       body: Center(
//           child: BlocConsumer<InternetBloc, InternetState>(
//         listener: (context, state) {
//           if (state is InternetGainedState) {
//             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//               content: Text("Internet Connected"),
//               backgroundColor: Colors.green,
//             ));
//           } else if (state is InternetLostState) {
//             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//               content: Text("Internet Disconnect"),
//               backgroundColor: Colors.red,
//             ));
//           }
//         },
//         builder: (context, state) {
//           if (state is InternetGainedState) {
//             return const Text("Connected");
//           } else if (state is InternetLostState) {
//             return const Text("Not Connected");
//           } else {
//             return const Text("Loading.....");
//           }
//         },
//       )),
//     );
//   }
// }

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo App"),
      ),
      body: Center(
          child: BlocConsumer<InternetCubit, InternetState2>(
        listener: (context, state) {
          if (state == InternetState2.Gained) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Internet Connected"),
              backgroundColor: Colors.green,
            ));
          } else if (state == InternetState2.Lost) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Internet Disconnect"),
              backgroundColor: Colors.red,
            ));
          }
        },
        builder: (context, state) {
          if (state == InternetState2.Gained) {
            return const Text("Connected");
          } else if (state == InternetState2.Lost) {
            return const Text("Not Connected");
          } else {
            return const Text("Loading.....");
          }
        },
      )),
    );
  }
}
