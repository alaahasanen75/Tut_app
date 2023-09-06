import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/core/color_manage.dart';
import 'package:flutter_application_1/core/serves.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/cubit/clean_arch_cubit.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    var details = AppCubit.get(context).details;

    return BlocProvider(
        create: (context) => AppCubit(getit(), getit(), getit()),
        child: BlocConsumer<AppCubit, LoginState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
                appBar: AppBar(
                  title: Center(child: Text('Store details')),
                ),
                backgroundColor: Colors.white.withOpacity(0.3),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 200,
                            width: double.infinity,
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: BorderSide(
                                      color: ColorManage.grey, width: 1)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image(
                                  image: NetworkImage('${details!['image']}'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Details',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: ColorManage.Primary),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${details['details']}',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: ColorManage.lightGray,
                                height: 1),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Services',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: ColorManage.Primary),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${details['services']}',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: ColorManage.lightGray,
                                height: 1),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'About store',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: ColorManage.Primary),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${details['about']}',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: ColorManage.lightGray,
                                height: 1),
                          )
                        ]),
                  ),
                ));
          },
        ));
  }
}
